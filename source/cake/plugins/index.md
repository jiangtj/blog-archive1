---
title: 插件
comments: true
reward: true
menu:
  Home: /cake/ || eercast 
  基础配置: /cake/options/ || cog 
  自定义: /cake/custom/ || wrench 
  集成: /cake/cubes/ || cubes 
---

Cake通过插件集成附加的功能，而本身不包含附加功能的任何文件。所以轻量且强大。

# List
这里是一系列现有的插件

- [hexo-cake-canvas-ribbon](https://github.com/jiangtj-lab/hexo-cake-canvas-ribbon): Ribbon背景
- [hexo-cake-math](https://github.com/jiangtj-lab/hexo-cake-math): Math支持
- [hexo-cake-live2d](https://github.com/jiangtj-lab/hexo-cake-live2d): Live2d支持(与上游区别：仅Cake生成的Html文件非全部)
- [hexo-cake-moon-menu](https://github.com/jiangtj-lab/hexo-cake-moon-menu): 新的右下角按钮

# Use

```bash
# use npm
npm i <plugin-name>(example:hexo-cake-canvas-ribbon) --save
# or use yarn
yarn add <plugin-name>(example:hexo-cake-canvas-ribbon)
```

Cake插件非常容易安装，就像普通的hexo的插件一样，唯一的区别在于仅在Cake主题（或[集成了Cake主题的插件方式](/cake/cubes)）下有效。具体配置见插件项目。

# Create

一般情况下，你只需要注入你的文件在`theme_inject`过滤器中。目前插件的开发仍在尝试阶段，存在较大的变化，如果您想尝试，可以参考`hexo-cake-canvas-ribbon`，这是最简单的插件实现。

关于`theme_inject`的使用，你可以参考[自定义章节](/cake/custom)的详细内容。
