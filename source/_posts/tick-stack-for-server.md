---
title: TICK Stack 实践之监控服务器
date: 2018-5-21
categories: [DevOps]
tags: [TICK Stack]
---

[TICK Stack](https://www.influxdata.com/time-series-platform/)是由一系列的服务组成的监控分析处理数据的解决方案，一般用于系统监控，或者收集处理与时间紧密相关的数据。    

![图片来自官网](https://2bjee8bvp8y263sjpl3xui1a-wpengine.netdna-ssl.com/wp-content/uploads/Tick-Stack-Complete.png)

它包含了以下服务：   
- Telegraf 是一个插件驱动的代理服务，用于收集并提供系统数据（如CPU、内存等）
- InfluxDB 是一个时序数据库，为满足高负载的读写而开发的数据库
- Chronograf 通过图表可视化分析数据的服务
- Kapacitor 是数据处理服务，用于批处理数据以及必要时提醒用户等

<!-- more -->

# 安装
TICK在官网<https://portal.influxdata.com/downloads>提供相应的下载安装方式，注意需要翻墙（JQuery引用的是Google源，会导致页面点击无反应）    
下面是Ubuntu & Debian的安装方式     
```bash
# telegraf
wget https://dl.influxdata.com/telegraf/releases/telegraf_1.6.2-1_amd64.deb
sudo dpkg -i telegraf_1.6.2-1_amd64.deb
# influxdb
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.5.2_amd64.deb
sudo dpkg -i influxdb_1.5.2_amd64.deb
# chronograf
wget https://dl.influxdata.com/chronograf/releases/chronograf_1.4.4.2_amd64.deb
sudo dpkg -i chronograf_1.4.4.2_amd64.deb
# kapacitor
wget https://dl.influxdata.com/kapacitor/releases/kapacitor_1.4.1_amd64.deb
sudo dpkg -i kapacitor_1.4.1_amd64.deb
```

也可以通过添加apt源安装      
```bash
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get update 
sudo apt-get install influxdb
sudo apt-get install telegraf
sudo apt-get install chronograf
sudo apt-get install kapacitor
```


# 运行
通过linux命令启动相应的服务    
```bash
sudo service telegraf start
sudo service influxd start
sudo service kapacitor start
sudo service chronograf start
```
默认情况下，访问<http://chronograf-ip:8888>即可    

# 配置
一般情况下需要调整配置文件，使服务满足我们的需求，如权限等。    
可以查看官方相关的文档配置    

- [chronograf](https://docs.influxdata.com/chronograf/v1.4/introduction/getting-started/)   
- [influxdb](https://docs.influxdata.com/influxdb/v1.5/)    

目前Chronograf 的权限支持github,google等账号体系，但企业内部使用可能需要重新开发，满足企业内部帐号权限系统  

# 其他   
事实上，监控的功能挺多余的，云服务商一般都为我们提供了不错的监控服务。但influxdb，目前来说最主流的时序数据库，可以用来存储其他一些数据。例如网站的访问量等。再通过chronograf展示数据，在[我的博客](https://jiangtj.gitlab.io/)的左侧菜单上有站点数据，就是通过这种方式来实现的。   

下面是，我站点统计使用的js脚本，可做参考：    
```js
    function doWriteInfluxDb() {

    var influx = {
      data: {},
      db: "mine-test",
      measurement: "visit",
      write: function (formData){
        $.ajax({
            url: "https://chro.j-time.cn/influx/write?db=" + influx.db,
            type: "post",
            data: formData,
            dataType: "json",
            error: function(xhr,status,error){
              console.log(xhr);
            },
            success: function(result){
            }
        });
      }
    }

    var influxTemp = influx.measurement;

    //referrer
    var referrerData = document.referrer;
    if (referrerData != "") {
      var begin = referrerData.indexOf("://") + 3;
      var end = referrerData.indexOf("/",begin);
      var host = referrerData.substring(begin,end).split(":")[0];
      //var influxTemp = "referrer,host="+influx.referrer.host + " value='"+referrerData + "'";
      if (host != "localhost" && host != "jiangtj.gitlab.io") {
        influx.data.referrer=host;
      }
    }

    //article
    var pathDatas = window.location.pathname.split("/");
    if (pathDatas.length >= 6) {
      if (pathDatas[1].length === 4&&pathDatas[2].length === 2
        &&pathDatas[3].length === 2)
      influx.data.article = pathDatas[pathDatas.length - 2];
    }

    //填充数据
    $.each(influx.data, function (key, value) {
      influxTemp += "," + key + "=" + value;
    });
    
    //访问次数
    influxTemp += " value=1";

    //开发环境不发送统计数据
    if (window.location.hostname === 'localhost'){
      return;
    }

    //发送数据
    influx.write(influxTemp);

    }

    doWriteInfluxDb();
```

# 参考
- [TICK技术栈 -- DevOps轻量级监控解决方案](https://blog.csdn.net/lin_credible/article/details/60579738)  
- [Open Source Time Series Platform](https://www.influxdata.com/time-series-platform/)  
 
