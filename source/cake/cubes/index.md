---
title: 集成
comments: true
reward: true
menu:
  Home: /cake/ || eercast 
  基础配置: /cake/options/ || cog 
  插件: /cake/plugins/ || plug 
  自定义: /cake/custom/ || wrench 
---

其他的主题，如果你希望使用这里的插件，可以通过以下方式，集成`theme_inject`至你的主题。

1. 复制[injects.js](https://github.com/JiangTJ/hexo-theme-cake/blob/master/scripts/injects.js)至你的主题脚本目录`scripts`
2. 添加`generateBefore`的监听
  ```js
  hexo.on('generateBefore', function () {
    require('./injects')(hexo);
  });
  ```
3. 在对应的位置添加注入点，你需要测试注入点是否可用，下面是Cake的注入点
  - Views
    - https://github.com/JiangTJ/hexo-theme-cake/blob/18416cd667490b0edd0bbb3d4f4d9cc16a98501a/layout/_partials/head/head.swig#L120-L122
    - https://github.com/JiangTJ/hexo-theme-cake/blob/18416cd667490b0edd0bbb3d4f4d9cc16a98501a/layout/_partials/header/index.swig#L4-L6
    - https://github.com/JiangTJ/hexo-theme-cake/blob/18416cd667490b0edd0bbb3d4f4d9cc16a98501a/layout/_layout.swig#L115-L117
    - https://github.com/JiangTJ/hexo-theme-cake/blob/18416cd667490b0edd0bbb3d4f4d9cc16a98501a/layout/_macro/sidebar.swig#L128-L130
    - https://github.com/JiangTJ/hexo-theme-cake/blob/18416cd667490b0edd0bbb3d4f4d9cc16a98501a/layout/_partials/post/reward.swig#L4-L8
  - Stylus
    - https://github.com/JiangTJ/hexo-theme-cake/blob/18416cd667490b0edd0bbb3d4f4d9cc16a98501a/source/css/main.styl#L14-L15
    - https://github.com/JiangTJ/hexo-theme-cake/blob/18416cd667490b0edd0bbb3d4f4d9cc16a98501a/source/css/main.styl#L45-L46
