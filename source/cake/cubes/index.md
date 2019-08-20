---
title: 集成
include: fm-cake-zh
---

这里介绍NexT插件方案的实现思路与集成方式，NexT插件方案的目的是为了使NexT更加精简，保留核心功能

NexT插件方案原理很简单，在适当的位置包含提供的代码

在Layout中，使用官方的`partial`进行包含，在CSS中使用stylus的import导入配置文件，主要涉及到以下几个文件
- [injects.js](https://github.com/theme-next/hexo-theme-next/blob/master/scripts/events/lib/injects.js)：解析theme_inject中注入的内容
- [injects-point.js](https://github.com/theme-next/hexo-theme-next/blob/master/scripts/events/lib/injects-point.js)：定义注入点
- [core.js](https://github.com/theme-next/hexo-theme-next/blob/master/scripts/events/core.js)：执行injects的脚本
- [next-inject.js](https://github.com/theme-next/hexo-theme-next/blob/master/scripts/helpers/next-inject.js)：简化注入点的代码
- Layout中的注入点可以搜索`next_inject`，查看NexT定义在何处。CSS中的看[main.styl](https://github.com/theme-next/hexo-theme-next/blob/master/source/css/main.styl#L14-L15)

NexT插件方案从一开始就考虑过如何在其它主题中实现，但不容易
- 主题的样式与布局的不同，能提供的注入点也不同（可能的解决方案：在Hexo中制定标准，各个主题中进行实现）
- CSS样式无法通用，除了stylus还在使用其它CSS预处理器的主题（不是很好的方案：插件使用内联CSS）
