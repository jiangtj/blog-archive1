/* global hexo */

'use strict';

const fs = require('fs');

hexo.extend.filter.register('before_generate', function() {
  hexo.theme.setView('_custom/head.swig', fs.readFileSync('source/_data/head.swig').toString());
  hexo.theme.setView('_custom/sidebar.swig', fs.readFileSync('source/_data/sidebar.swig').toString());
});
