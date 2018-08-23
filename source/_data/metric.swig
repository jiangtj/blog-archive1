<script type="text/javascript">

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

</script>