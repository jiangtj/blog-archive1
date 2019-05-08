/* global hexo */

'use strict';

hexo.extend.filter.register('theme_inject', function(injects) {
  injects.head.file('custom', 'source/_data/head.swig', {}, {cache: true});
  injects.sidebar.file('custom', 'source/_data/sidebar.swig', {}, {cache: true});
  injects.bodyEnd.file('baidu-push', 'views/baidu-push.swig', {}, {cache: true});
});
