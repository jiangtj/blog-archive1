---
title: 自定义
comments: true
reward: true
menu:
  Home: /cake/ || eercast 
  基础配置: /cake/options/ || cog 
  插件: /cake/plugins/ || plug 
  集成: /cake/cubes/ || cubes 
---

Cake提供强大的自定义功能，确保你能在不修改主题文件的情况下，注入新的组件，或者使用外部文件替换主题文件。

> 已在NexT中添加Inject，你也可以在[NexT文档](https://theme-next.org/docs/advanced-settings#Injects)中查看如何使用。

# Inject

Cake提供新的过滤类型`theme_inject`，你能通过它，在提供的注入点中，添加你的自定义内容。插件便是基于此开发。

例如：

```js
hexo.extend.filter.register('theme_inject', function(injects) {
  injects.head.file('custom', 'source/_data/head.swig', {}, {cache: true});
  injects.sidebar.raw('custom', 'Put some in sidebar!');
});
```

目前拥有的注入点：

- View: ['head', 'header', 'sidebar', 'postMeta', 'postBodyEnd', 'footer', 'bodyEnd', 'reward']
- Css:  ['variable', 'style']

Api:

- View: injects.[point].file/raw(name, file/raw[, locals][, options])
- Css:  injects.[point].push(file)

> todo css自定义的介绍

# Replace

这部分是hexo的功能，在大部分主题中都支持（NexT会在未来支持，需要使用partial替换include）。

```js
hexo.extend.filter.register('before_generate', function (data) {
  hexo.theme.setView('需要替换的文件路径', fs.readFileSync('你的自定义文件').toString());
});
```

你也可以使用[hexo-theme-plus](https://github.com/JiangTJ/hexo-theme-plus)简化这部分工作。
