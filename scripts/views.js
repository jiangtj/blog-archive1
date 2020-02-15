/* global hexo */

'use strict';

const fs = require('fs');
const path = require('path');
const injector = require('hexo-extend-injector2')(hexo);
const { Cache } = require('hexo-util');
const cache = new Cache();

//gitter
injector.register('head_end', () => {
  return cache.apply('gitter', () => {
    return fs.readFileSync(path.resolve(hexo.base_dir, 'views/gitter.html'), 'utf8');
  });
});


injector.register('head_end', fs.readFileSync(path.resolve(hexo.base_dir, 'views/head.html'), 'utf8'));
injector.register('bodyBegin', fs.readFileSync(path.resolve(hexo.base_dir, 'views/header.html'), 'utf8'));
injector.register('body-end', fs.readFileSync(path.resolve(hexo.base_dir, 'views/baidu-push.html'), 'utf8'));
//injector.sidebar.file('custom', 'views/sidebar.swig', {}, {cache: true});
//injector.bodyEnd.file('baidu-push', 'views/baidu-push.swig', {}, {cache: true});

injector.register('variable', 'source/_data/variables.styl');
injector.register('style', 'source/_data/styles.styl');

//injects.style.push('views/gitter.styl');

