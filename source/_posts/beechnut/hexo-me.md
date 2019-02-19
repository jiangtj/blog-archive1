---
title: 我与Hexo的一些事
date: 2019-2-19
categories: [Web]
tags: [Hexo]
---

# 序
这可能是我最后一篇关于Hexo的文章，之前写过一篇[简单、高效的管理hexo站点主题](https://www.dnocm.com/articles/almond/hexo-theme-manage/)，仅仅提了fork、submodules，却收获好几个赞。所以一直有个想法，将我是如何管理的，分享给大家。

你可以通过这篇文章学到：
- 从0开始搭建属于自己的博客
- 我管理它的方式

<!-- more -->

# 第一次运行
你使用[yarn](https://yarnpkg.com/)么？没有的话，建议你看一下，我接下来的命令都会用它，比`npm`好用

接下来根据官网的教程，我们运行以下命令：
```bash
# 安装hexo-cli
yarn global add hexo-cli
# 在blog下初始化blog
hexo init blog
# 进入blog目录
cd blog
# 安装依赖(事实上当你hexo init已经完成这个步骤)
# yarn install
# 运行
hexo server
```

打开<http://localhost:4000/>，你就能看到你的博客站点已经运行了

# 备份源码
源码备份很重要，你总不希望写着写着就丢了把，而且如果需要在不同的地方编辑，那么必须要上传到公共的仓库。一般代码的存储都是用Git的

1. 在GitHub创建你的仓库
2. 在博客目录，运行命令，提交代码
```bash
git init
git commit -m "first commit"
git remote add origin https://github.com/<your-name>/<your-repo>.git
git push -u origin master
```

# 更换主题
官方的主题landscape，相信使用它的绝对是少数，因为不好看。所以接下来就需要更换它。这里我以[NexT](https://theme-next.org/)为例（毕竟现在是该组织成员之一，做一下适当推广）

1. 下载最新的主题源码<https://github.com/theme-next/hexo-theme-next/releases>
2. 解压，放入themes目录，重命名主题文件夹名为`next`（方便下文配置）
3. 修改hexo的`_config.yml`中的`theme`
```yml
theme: next
```
4. `hexo s`运行，查看修改后的界面

> 在看下面之前，我们先来想个问题，如果某天next主题升级了版本，7.x到了8.x，是不是也想升级。怎么做呢？
1. 删除旧的next
2. 下载新的next
3. 如果自定义过next，就麻烦了，自定义的文件需要一个个比对
是不是觉得很麻烦，是不是在想会不会有更好的方式处理这个？开头我就提到过另一篇，先思考下，然后去看吧。这里不想重复提及

NexT主题有许多配置，你可以在它的官方找到，我这里就不多做介绍了
