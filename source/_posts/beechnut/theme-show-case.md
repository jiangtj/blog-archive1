---
title: Theme Show Case
categories: [Web]
tags: [Theme]
banner: /articles/beechnut/theme-show-case/g1.png
date: 2019-05-17 15:13:09
---

展示些样式，逐步修改中~

<!-- more -->

**多层列表**
1. 第一步修改布局
  - 布局A要下移
    1. YaYaYaYaYaYaYaYaYaYa
    2. Who care?
  - 布局B去掉
2. 调整css样式！！

**代码块**
```js
hexo.extend.filter.register('theme_inject', function(injects) {
  injects.head.file('custom', 'source/_data/head.swig', {}, {cache: true});
  injects.sidebar.raw('custom', 'Put some in sidebar!');
});
```

**表格**

| 水果        | 价格    |  数量  |
| --------   | -----:  | :----: |
| 香蕉        | $1      |   5    |
| 苹果        | $1      |   6    |
| 草莓        | $1      |   7    |

