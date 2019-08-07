---
title: Hexo Theme Cake
comments: true
reward: true
menu:
  基础配置: /cake/options/ || cog 
  插件: /cake/plugins/ || plug 
  自定义: /cake/custom/ || wrench 
---

# 一些事

![](/cake/images/t1.png)

Hexo Theme Cake是个lovely主题，基于7.1.0版本的NexT。原本计划重新设计内部逻辑，是它更简单更棒。就像蛋糕Cake，非常非常好吃，而且做起来也简单。

但。。。我似乎没考虑到大量的工作量，几乎是我无法完成的。所以，大部分工作循序渐进把。由于大量的重写，许多NexT上的功能被破坏了，其中大部分能以插件形式，快速集成到该主题。如果你发现NexT有的功能，而Cake没有，你可以在[GitHub](https://github.com/JiangTJ/hexo-theme-cake)上提交issue，我会尽快支持这些功能。

也许有人会问为什么要单独独立出一个主题？这主要包含以下几点原因
1. 实践一些新特性，大部分我都会添加至NexT中，但由于NexT的用户量，需要考虑兼容性，支持会慢些
2. 更大的控制权，我可以做任何事，重构/去除一些有异议的功能，比如下面的例子
  - Exturl 加密对于前端来说没有意义，所以会去除
  - Note Tag 重构，调整其header的方式，去除了样式配置（保留一种好看的，原因是可以通过stylus自定义）

> 所以如果你喜欢我的样式，可以尝试使用，如果更喜欢更多内置功能，[NexT](https://github.com/theme-next/hexo-theme-next)可能更适合你

# 快速开始

```bash
# 创建一个新的hexo项目
hexo init <dir>
cd <dir>
# 添加Cake主题作为子模块
git init
git add .
git submodule add https://github.com/JiangTJ/hexo-theme-cake themes/cake
```

修改`_config.yml`中的`theme`为`cake`。

`hexo s`运行，你能本地预览啦

