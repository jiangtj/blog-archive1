<div class="moon-menu">
  <div class="moon-menu-item">
  </div>
  <div class="moon-menu-button">
    <svg class="moon-menu-svg">
      <circle class="moon-menu-cricle" cx="50%" cy="50%" r="44%"></circle>
      <circle class="moon-menu-border" cx="50%" cy="50%" r="48%"></circle>
    </svg>
    <div class="moon-menu-icon">
    </div>
    <div class="moon-menu-text"></div>
  </div>
</div>

<script>
window.addEventListener('scroll' , function(){

  //Get scroll percent
  let offsetHeight =document.documentElement.offsetHeight;
  let scrollHeight =document.documentElement.scrollHeight;
  var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
  let percent = Math.round(scrollTop/(scrollHeight - offsetHeight)*100);
  if (percent > 100) percent = 100;
  
  let menuText = document.querySelector('.moon-menu-text');
  if (!percent){
    percent = 0;
    menuText.style.display = 'none';
  } else {
    menuText.style.display = 'block';
    menuText.innerHTML = percent + '%';
  }
  
  //Update strokeDasharray
  let length = 196;
  document.querySelector('.moon-menu-border').style.strokeDasharray = percent*length/100 + ' ' + length;

});
</script>
