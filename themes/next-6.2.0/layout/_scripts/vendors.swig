{# Reset `window.Promise` when it was not a function. #}
{# IE refers the element whose id is `Promise` as `window.Promise`, this causes Velocity throwing an exception #}
<script type="text/javascript">
  if (Object.prototype.toString.call(window.Promise) !== '[object Function]') {
    window.Promise = null;
  }
</script>

{% set js_vendors = {} %}
{% set js_vendors.jquery      = 'jquery/index.js?v=2.1.3' %}

{% if theme.fastclick %}
  {% set js_vendors.fastclick   = 'fastclick/lib/fastclick.min.js?v=1.0.6' %}
{% endif %}

{% if theme.lazyload %}
  {% set js_vendors.lazyload    = 'jquery_lazyload/jquery.lazyload.js?v=1.9.7' %}
{% endif %}

{% set js_vendors.velocity    = 'velocity/velocity.min.js?v=1.2.1' %}
{% set js_vendors.velocity_ui = 'velocity/velocity.ui.min.js?v=1.2.1' %}

{% if theme.fancybox %}
  {% set js_vendors.fancybox  = 'fancybox/source/jquery.fancybox.pack.js?v=2.1.5' %}
{% endif %}

{% if theme.canvas_nest %}
  {% set js_vendors.canvas_nest  = 'canvas-nest/canvas-nest.min.js' %}
{% endif %}

{% if theme.three_waves %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.three_waves  = 'three/three-waves.min.js' %}
{% endif %}

{% if theme.canvas_lines %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.canvas_lines  = 'three/canvas_lines.min.js' %}
{% endif %}

{% if theme.canvas_sphere %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.canvas_sphere  = 'three/canvas_sphere.min.js' %}
{% endif %}

{% if theme.canvas_ribbon.enable and theme.scheme === 'Pisces'%}
  {% set js_vendors.canvas_ribbon  = 'canvas-ribbon/canvas-ribbon.js' %}
{% endif %}

{% if theme.reading_progress.enable %}
  {% set js_vendors.reading_progress  = 'reading_progress/reading_progress.js' %}
{% endif %}

{% for name, internal in js_vendors %}
  {% set internal_script = url_for(theme.vendors._internal) + '/' + internal %}
  {% if name == 'canvas_ribbon' %}
    <script id="ribbon" type="text/javascript" size="{{ theme.canvas_ribbon.size }}" alpha="{{ theme.canvas_ribbon.alpha }}"  zIndex="{{theme.canvas_ribbon.zIndex }}" src="{{ theme.vendors[name] | default(internal_script) }}"></script>
  {% else %}
    <script type="text/javascript" src="{{ theme.vendors[name] | default(internal_script) }}"></script>
  {% endif %}
{% endfor %}

<script type="text/javascript">

    //debugger;
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
