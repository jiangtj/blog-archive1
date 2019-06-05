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

# 喜欢吃Cake嘛？

![](/cake/images/t1.png)

Hexo Theme Cake是个lovely主题，基于7.1.0版本的NexT。原本计划重新设计内部逻辑，是它更简单更棒。就像蛋糕Cake，非常非常好吃，而且做起来也简单。

但。。。我似乎没考虑到大量的工作量，几乎是我无法完成的。所以，大部分工作循序渐进把。由于大量的重写，许多NexT上的功能被破坏了，其中大部分能以插件形式，快速集成到该主题。如果你发现NexT有的功能，而Cake没有，你可以在GitHub上提交issue，我会尽快支持这些功能。

*目前在编写文档中，编写完成会独立出主题库，敬请期待。*

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

