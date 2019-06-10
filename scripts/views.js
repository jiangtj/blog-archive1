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
  injects.bodyEnd.file('moon-menu', 'views/moon-menu.swig', {}, {cache: true});
  hexo.theme.config.back2top.enable = false;
  hexo.theme.config.moon_menu = Object.assign({
    back2top: {
      enable: true,
      icon: 's',
      func: 'back2top'
    },
    back2bottom: {
      enable: true,
      icon: 's',
      func: 'back2bottom'
    },
  }, hexo.theme.config.moon_menu);
  injects.style.push('views/moon-menu.styl')

});
