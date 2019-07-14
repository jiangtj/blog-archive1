/* global hexo */

'use strict';

hexo.extend.filter.register('theme_inject', function(injects) {

  injects.head.file('custom', 'views/head.swig', {}, {cache: true});
  injects.header.file('custom', 'views/header.swig', {}, {cache: true});
  injects.sidebar.file('custom', 'views/sidebar.swig', {}, {cache: true});
  injects.bodyEnd.file('baidu-push', 'views/baidu-push.swig', {}, {cache: true});

  injects.variable.push('source/_data/variables.styl');
  injects.style.push('source/_data/styles.styl');

  //gitter
  injects.head.file('gitter', 'views/gitter.swig', {}, {cache: true});
  //injects.style.push('views/gitter.styl');

});
