/* global hexo */

'use strict';

hexo.extend.filter.register('theme_inject', function(injects) {
  injects.head.file('custom', 'views/head.swig', {}, {cache: true});
  injects.sidebar.file('custom', 'views/sidebar.swig', {}, {cache: true});
  injects.bodyEnd.file('baidu-push', 'views/baidu-push.swig', {}, {cache: true});
  injects.bodyEnd.file('lozad', 'views/lozad.swig', {}, {cache: true});
});