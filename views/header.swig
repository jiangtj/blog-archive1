<!-- Google Adsense -->
<amp-auto-ads type="adsense"
              data-ad-client="ca-pub-8243423215749776">
</amp-auto-ads>

<div class="pin-top-msg">
您访问的是非正式的站点（Dnocm）,不是最新内容，请<a class='jump-to-dnocm'>点击这里跳转</a>
<i class="fa fa-times" aria-hidden="true" onclick="hidePin()"></i> 
</div>

<script>
if (window.location.hostname != 'www.dnocm.com') {

  document.querySelector(".pin-top-msg").style.display = 'block';
  var reHost = window.location.href.replace(window.location.hostname, 'www.dnocm.com');
  var reRort = reHost.replace( ":" + window.location.port, '');
  document.querySelector(".jump-to-dnocm").href = reRort;

  var hidePin = function() {
    document.querySelector(".pin-top-msg").style.display = 'none';
  }

}
</script>
