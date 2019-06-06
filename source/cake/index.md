---
title: Hexo Theme Cake
comments: true
reward: true
menu:
  基础配置: /cake/options/ || cog 
  插件: /cake/plugins/ || plug 
  自定义: /cake/custom/ || wrench 
  集成: /cake/cubes/ || cubes 
---

# 一些事

![](/cake/images/t1.png)

Hexo Theme Cake是个lovely主题，基于7.1.0版本的NexT。原本计划重新设计内部逻辑，是它更简单更棒。就像蛋糕Cake，非常非常好吃，而且做起来也简单。

但。。。我似乎没考虑到大量的工作量，几乎是我无法完成的。所以，大部分工作循序渐进把。由于大量的重写，许多NexT上的功能被破坏了，其中大部分能以插件形式，快速集成到该主题。如果你发现NexT有的功能，而Cake没有，你可以在GitHub上提交issue，我会尽快支持这些功能。

也许有人会问为什么要单独独立出一个主题？这主要包含以下几点原因
1. 实践一些新特性，大部分我都会添加至NexT中，但由于NexT的用户量，需要考虑兼容性，支持会慢些
2. 更大的控制权，我可以做任何事，而不需经过任何人的同意

未来：
1. 目前在考虑优化NexT的插件方案，Cake为其中一个方案的实践，不稳定也不确定。当NexT插件化模块化方案确定后，Cake会改进并兼容
2. Cake或许能成为NexT的一个外部scheme

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

