/* global hexo */

'use strict';

if (hexo.config.theme !== 'next') return;

// 做一点兼容，方便测试NexT主题
hexo.extend.filter.register('theme_inject', function(injects) {

  injects.menu = new ViewInject();
  hexo.theme.config.reward = null;

}, -99);

class ViewInject {
  constructor() {
    this.raws = [];
  }
  raw(name, raw, ...args) {}
  file(name, file, ...args) {}
}
