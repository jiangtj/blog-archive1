/* global hexo */

'use strict';

hexo.extend.filter.register('theme_inject', function(injects) {

  injects.head.file('custom', 'views/head.swig', {}, {cache: true});
  injects.sidebar.file('custom', 'views/sidebar.swig', {}, {cache: true});
  injects.bodyEnd.file('baidu-push', 'views/baidu-push.swig', {}, {cache: true});
  injects.bodyEnd.file('lozad', 'views/lozad.swig', {}, {cache: true});

  injects.variable.push('source/_data/variables.styl');
  injects.style.push('source/_data/styles.styl');

  // inject moon-menu
  hexo.theme.config.back2top.enable = false;
  let moonMenu = Object.assign({
    back2top: {
      enable: true,
      icon: 'fa fa-chevron-up',
      func: 'back2top',
      order: -1
    },
    back2bottom: {
      enable: true,
      icon: 'fa fa-chevron-down',
      func: 'back2bottom',
      order: -2
    },
  }, hexo.theme.config.moon_menu, hexo.config.moon_menu);
  let moonMenuArr = Object.keys(moonMenu)
    .map(key => moonMenu[key])
    .map(item => {
      item.order = item.order || 0;
      if (item.enable === undefined) {
        item.enable = true;
      }
      return item;
    })
    .filter(item => item.enable)
    .sort((a, b) => a.order - b.order);
  
  injects.bodyEnd.file('moon-menu', 'views/moon-menu.swig', {menus: moonMenuArr}, {cache: true, only: true});
  injects.style.push('views/moon-menu.styl')

});
