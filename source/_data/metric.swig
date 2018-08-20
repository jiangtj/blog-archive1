<script type="text/javascript">

    debugger;
    function doWriteInfluxDb() {

    //开发环境不发送统计数据
    if (window.location.hostname === 'localhost'){
      return;
    }

    var influx = {
      referrer: {},
      path: {},
      write: function (formData){
        $.ajax({
            url: "https://chro.j-time.cn/influx/write?db=mine-test",
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
    influxTemp = "visit";

    //referrer
    influx.referrer.data = document.referrer;
    if (influx.referrer.data != "") {
      influx.referrer.begin = influx.referrer.data.indexOf("://") + 3;
      influx.referrer.end = influx.referrer.data.indexOf("/", influx.referrer.begin);
      influx.referrer.host = influx.referrer.data.substring(influx.referrer.begin,influx.referrer.end).split(":")[0];
      //var influxTemp = "referrer,host="+influx.referrer.host + " value='"+influx.referrer.data + "'";
      if (influx.referrer.host != "localhost" && influx.referrer.host != "jiangtj.gitlab.io") {
        influxTemp += ",referrer="+influx.referrer.host;
      }
    }

    //visit
    influx.path.datas = window.location.pathname.split("/");
    if (influx.path.datas.length >= 6) {
      if (influx.path.datas[1].length === 4&&influx.path.datas[2].length === 2
        &&influx.path.datas[3].length === 2)
      influx.path.article = influx.path.datas[influx.path.datas.length - 2];
      influxTemp += ",article=" + influx.path.article;
    }
    
    influxTemp += " value=1";
    influx.write(influxTemp);
    //alert(JSON.stringify(influx))
    //alert(JSON.stringify(influxTemp))

    }

    doWriteInfluxDb();

</script>