---
title: Theme Show Case
categories: [Web]
tags: [Theme]
banner: /articles/beechnut/theme-show-case/g1.png
date: 2019-05-17 15:13:09
---

展示些样式，逐步修改中~

<!-- more -->

# List

## Ordered List
1. 第一步修改布局
  1. 布局A要下移
    1. YaYaYaYaYaYaYaYaYaYa
    2. Who care?
  2. 布局B去掉
2. 调整css样式！！

## Unordered List
- 第一步修改布局
  - 布局A要下移
    - YaYaYaYaYaYaYaYaYaYa
    - Who care?
  - 布局B去掉
- 调整css样式！！

## Checked List
- [ ] check this point!
- [x] do you like it?

# Code
```js
hexo.extend.filter.register('theme_inject', function(injects) {
  injects.head.file('custom', 'source/_data/head.swig', {}, {cache: true});
  injects.sidebar.raw('custom', 'Put some in sidebar!');
});
```

# Table

| 水果        | 价格    |  数量  |
| --------   | -----:  | :----: |
| 香蕉        | $1      |   5    |
| 苹果        | $1      |   6    |
| 草莓        | $1      |   7    |

## Long Table

|水果|价格|数量|水果|价格|数量|水果|价格|数量|水果|价格|数量|水果|价格|数量|水果|价格|数量|
|---|---:|:--:|---|---:|:--:|---|---:|:--:|---|---:|:--:|---|---:|:--:|---|---:|:--:|
|香蕉|$1|5    |香蕉|$1|5    |香蕉|$1|5    |香蕉|$1|5    |香蕉|$1|5    |香蕉|$1|5    |
|苹果|$1|6    |苹果|$1|6    |苹果|$1|6    |苹果|$1|6    |苹果|$1|6    |苹果|$1|6    |
|草莓|$1|7    |草莓|$1|7    |草莓|$1|7    |草莓|$1|7    |草莓|$1|7    |草莓|$1|7    |

