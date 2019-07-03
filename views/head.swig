<!-- Google Ads -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-8243423215749776",
    enable_page_level_ads: true
  });
</script>
<script async custom-element="amp-auto-ads"
        src="https://cdn.ampproject.org/v0/amp-auto-ads-0.1.js">
</script>

<!-- 
<script>
  ((window.gitter = {}).chat = {}).options = {
    room: 'jiangtj/Lobby'
  };

  document.addEventListener('gitter-sidecar-instance-started', function(e) {
    var sidecatButton = document.querySelector('.gitter-open-chat-button');
    sidecatButton.innerHTML='<i class="fa fa-heart" aria-hidden="true"style="margin-right: .3rem;"></i>'
                          + 'CHAT'
                          + '<i class="fa fa-heart" aria-hidden="true"style="margin-left: .3rem;"></i>';
  });

</script>
<script src="https://sidecar.gitter.im/dist/sidecar.v1.js" async defer></script>
 -->

<script src="https://sidecar.gitter.im/dist/sidecar.v1.js" async defer></script>
<script>
  ((window.gitter = {}).chat = {}).options = {
    room: 'jiangtj/Lobby',
    activationElement: false
  };
  var openGitter = function() {};
  document.addEventListener('gitter-sidecar-ready', function(e) {
    var GitterChat = e.detail.Chat;
    var chat = new GitterChat({
      room: 'jiangtj/Lobby',
      activationElement: false
    });
    openGitter = () => {
      chat.toggleChat(true);
    }
  });
</script>
