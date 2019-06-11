<div class="moon-menu">
  <div class="moon-menu-items">
    {% for item in menus %}
      <div class="moon-menu-item">
        <i class="{{ item.icon }}"></i>
      </div>
    {% endfor %}
  </div>
  <div class="moon-menu-button">
    <svg class="moon-menu-svg">
      <circle class="moon-menu-cricle" cx="50%" cy="50%" r="44%"></circle>
      <circle class="moon-menu-border" cx="50%" cy="50%" r="48%"></circle>
      <g class="moon-menu-points">
        <circle class="moon-menu-point" r=".2rem" cx="0" cy="-.8rem"></circle>
        <circle class="moon-menu-point" r=".2rem"></circle>
        <circle class="moon-menu-point" r=".2rem" cx="0" cy=".8rem"></circle>
      </g>
    </svg>
    <div class="moon-menu-icon">
    </div>
    <div class="moon-menu-text">
    </div>
  </div>
</div>

<script defer>

const moonMenuListener = function () {

  //Get scroll percent
  let offsetHeight =document.documentElement.offsetHeight;
  let scrollHeight =document.documentElement.scrollHeight;
  var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
  let percent = Math.round(scrollTop/(scrollHeight - offsetHeight)*100);
  if (percent > 100) percent = 100;
  
  let menuText = document.querySelector('.moon-menu-text');
  let menuPoints = document.querySelector('.moon-menu-points');
  if (!percent){
    percent = 0;
    menuText.style.display = 'none';
    menuPoints.style.display = 'block';
  } else {
    menuText.style.display = 'block';
    menuPoints.style.display = 'none';
    menuText.innerHTML = percent + '%';
  }
  
  //Update strokeDasharray
  let length = 196;
  document.querySelector('.moon-menu-border').style.strokeDasharray = percent*length/100 + ' ' + length;

}

window.addEventListener('load' , () => {
  moonMenuListener();
  document.querySelector('.moon-menu-border').style.strokeWidth = '1px';
});
window.addEventListener('scroll' , moonMenuListener);

</script>
