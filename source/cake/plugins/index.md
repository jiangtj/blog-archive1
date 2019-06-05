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

# Use

## Install

```bash
npm i <plugin-name>(example:hexo-cake-canvas-ribbon) --save
# or
yarn add <plugin-name>(example:hexo-cake-canvas-ribbon)
```

It's easy to install. you just use like other hexo plugins.

## Config

插件支持多种配置方式，下面以`hexo-cake-canvas-ribbon`插件配置为例。

**在Hexo配置文件中配置**
```yml _config.yml
canvas_ribbon:
  size: 300
  alpha: 0.6
  zIndex: -1
  url: //cdn.jsdelivr.net/gh/theme-next/theme-next-canvas-ribbon@1/canvas-ribbon.js
```

**在Cake主题配置文件中配置**
```yml themes/cake/_config.yml
canvas_ribbon:
  size: 300
  alpha: 0.6
  zIndex: -1
  url: //cdn.jsdelivr.net/gh/theme-next/theme-next-canvas-ribbon@1/canvas-ribbon.js
```

**在_date文件中配置**
```yml source/_data/canvas_ribbon.yml
size: 300
alpha: 0.6
zIndex: -1
url: //cdn.jsdelivr.net/gh/theme-next/theme-next-canvas-ribbon@1/canvas-ribbon.js
```

你可以寻找配置名称变量在对应的插件项目中
