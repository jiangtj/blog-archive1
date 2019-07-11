 <!-- 
<script>
  ((window.gitter = {}).chat = {}).options = {
    room: 'jiangtj/Lobby'
  }});
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
