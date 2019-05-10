---
title: 想写个自己的主题
tags: [Todo]
date: 2019-04-30 10:37:37
banner: /articles/beechnut/todo-an-new-theme/g2.png
---

目前使用的NexT主题，也是NexT成员。但果然还是希望自己的站点能够与众不同点，所以想写个自己的主题。整理下一些资源

**参考主题**
- [NexT](https://github.com/theme-next/hexo-theme-next)：最熟悉的
- [Inside](https://github.com/elmorec/hexo-theme-inside)：厉害的作者，使用Angular重新了生成器

计划：基于NexT改进，参照Inside的设计风格

(*^__^*) 嘻嘻，你是幸运的25%用户（不幸的），现在看到的页面就是正在改进哒~

下面是些样式，逐步修改中~

**多层列表**
- 列表A
  - 列表B

**代码块**
```js
hexo.extend.filter.register('theme_inject', function(injects) {
  injects.head.file('custom', 'source/_data/head.swig', {}, {cache: true});
  injects.sidebar.raw('custom', 'Put some in sidebar!');
});
```

**表格**

| 水果        | 价格    |  数量  |
| --------   | -----:   | :----: |
| 香蕉        | $1      |   5    |
| 苹果        | $1      |   6    |
| 草莓        | $1      |   7    |
