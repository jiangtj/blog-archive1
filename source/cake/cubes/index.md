---
title: 集成
comments: true
reward: true
menu:
  主页: /cake/ || eercast
  基础配置: /cake/options/ || cog
  插件: /cake/plugins/ || plug
  自定义: /cake/custom/ || wrench
---

其他的主题，如果你希望使用这里的插件，可以通过以下方式，集成`theme_inject`至你的主题。

1. 需要添加[injects.js](https://github.com/JiangTJ/hexo-theme-cake/blob/master/scripts/injects.js)与[injects-point.js](https://github.com/JiangTJ/hexo-theme-cake/blob/master/scripts/injects-point.js)至你的主题脚本目录`scripts`
2. 在`generateBefore`的监听调用
  ```js
  hexo.on('generateBefore', function () {
    require('./injects')(hexo);
  });
  ```
3. 在对应的位置添加注入点，你需要测试注入点是否可用，下面是Cake与NexT的注入点例子
  - Views
    - https://github.com/JiangTJ/hexo-theme-cake/blob/3166ade3be26c09eedcb254c92cc3af6004dba48/layout/_partials/head/head.swig#L112-L114
    - https://github.com/JiangTJ/hexo-theme-cake/blob/3166ade3be26c09eedcb254c92cc3af6004dba48/layout/_partials/header/index.swig#L4-L6
    - https://github.com/JiangTJ/hexo-theme-cake/blob/3166ade3be26c09eedcb254c92cc3af6004dba48/layout/_layout.swig#L113-L115
    - https://github.com/JiangTJ/hexo-theme-cake/blob/3166ade3be26c09eedcb254c92cc3af6004dba48/layout/_macro/sidebar.swig#L128-L130
    - https://github.com/JiangTJ/hexo-theme-cake/blob/3166ade3be26c09eedcb254c92cc3af6004dba48/layout/_partials/post/reward.swig#L4-L8
  - Stylus
    - https://github.com/jiangtj/hexo-theme-cake/blob/3166ade3be26c09eedcb254c92cc3af6004dba48/source/css/main.styl#L9-L10
    - https://github.com/jiangtj/hexo-theme-cake/blob/3166ade3be26c09eedcb254c92cc3af6004dba48/source/css/main.styl#L17-L18
    - https://github.com/jiangtj/hexo-theme-cake/blob/3166ade3be26c09eedcb254c92cc3af6004dba48/source/css/main.styl#L41-L42
