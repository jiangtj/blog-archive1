---
title: 使用Git Submodule管理Hexo主题
categories: [前端]
tags: [Hexo, Git]
date: 2019-08-07 23:23:25
description: “小白”都能玩耍的的方式，将一切井井有条
---

不多说废话，介绍一种简单又近乎完美的主题管理方式。文章中使用[Cake]()主题介绍，如果你使用NexT替换对应的链接。

> English user go to [**here**](/articles/beechnut/hexo-git-submodule/#English)

# 中文教程

需要提前储备的知识，如果不懂请至百度
- 基本的Git操作（Git Init/Add/Commit/Pust/Fetch/Pull）
- 基本的Node/NPM操作（npm install）或者Yarn（类似于NPM）
- 基本的Hexo命令（hexo init/cl/s/g）

<!-- more -->

## 初始化项目

首先我们创建一个新的hexo项目，命令行运行以下命令
```bash
# Create a new hexo project
hexo init <dir>
cd <dir>
```

将该项目使用Git管理
```bash
git init
# do something by yourself, if you want to push it to GitHub.
```

添加Cake主题作为该项目的Git子模块
```bash
git submodule add https://github.com/JiangTJ/hexo-theme-cake themes/cake
```

修改Hexo中的配置文件`theme`为`cake`

一个基本的项目通过上面的步骤可以创建，如果你看到这篇文章前已经有自己的博客项目，定位到未完成的步骤起，跟着走完。

## 更新主题版本

如果你使用的主题仍在被维护，那么你能从远程获取更新。这部操作很简单，像下面这样：
```bash
git submodule update --remote
```

它会从远程拉取最新master上的代码至你的子模块（也就是你的主题）中

> 如果你想修改拉取的分支通过`git config -f .gitmodules submodule.themes/cake.branch stable`，一般情况下，master分支足够好，不需要修改

## 使用npm脚本替换

git submodule的命令不好记，另一种方式是使用npm脚本替换。编辑`package.json`文件，添加以下内容：
```json
{
  "name": "mrtt-hexo-blog",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "update-theme": "git submodule update --remote"
  },
  "hexo": {
    "version": "3.9.0"
  },
  "dependencies": {
    //...
  }
}
```

之后每次更新都只需要运行`npm run update-theme`

## 自定义主题

这个问题经常被提到，想要从官方的远程仓库获取更新，但又希望能修改主题的文件，添加自己的代码，也就是传说中的魔改，怎么处理呢

一种方式是fork，然后将自己fork的主题作为子模块，但每次更新需要先将官方的更新同步至你fork的主题（有点麻烦）

另一种是这里介绍的：替换。我不对主题文件做修改，但我能在外面创文件。思路是将外面与主题的文件路径一致替换掉对应的主题的文件

### 替换

首先，安装一个hexo插件[hexo-theme-plus](https://github.com/jiangtj/hexo-theme-plus)
```bash
npm i --save @jiangtj/hexo-theme-plus
```

默认情况下，已经配置好了替换路径，如果你需要修改，在hexo中修改以下配置
```yml
theme_plus:
  custom_path: custom/theme # disabled: set 'false'
```

在`custom/theme`创建对应的主题文件，比如`${theme_dir}/layout/_partials/footer.swig`，将它复制到`${hexo_dir}/custom/theme/_partials/footer.swig`，然后稍微做些修改，比如我在作者信息那里加了个颜表情Ծ‸ Ծ
```html
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || author }} Ծ‸ Ծ</span>
```

`hexo s`运行预览，我们可以看到最底下，作者的后面已经加上了Ծ‸ Ծ

> Replace存在一点缺陷，首先只支持`layout`下的文件，其次需要主题支持（使用partial，不能用模版的特定的语法比如include），Cake除了`layout`根目录下外，其余都支持替换，但NexT需要你替换`include` `macro`等语法

### 注入

除了替换，还可以在注入点注入任何你希望的代码，详细见我上篇文章[Hexo NexT 高阶教程之 Injects](/articles/beechnut/hexo-next-injects/)

## 另一台电脑上编辑

使用Git仓库同步的情况下，如果你需要在另一台电脑上工作，你唯一需要做的事是在`git clone`命令上加上`--recursive`

```bash
git clone --recursive https://github.com/your-name/your-blog
```

如果是GUI工具，那么什么都不用改变，它们默认都是加`--recursive`的

如果你忘记加`--recursive`了，多执行下以下命令，当然你也可以将它加入到你的npm scripts里，方便记住它

```bash
git submodule init
git submodule update
```

## 总结

1. 不要修改任何主题文件，我相信替换与注入配合，你已经能修改任何的主题代码了，这能保证你的主题仓库可以直接设置为官方的仓库，且更新无冲突
2. 需要记住的命令很少，就两个`git submodule update --remote`和`git clone --recursive repo`

# English

Need to reserve knowledge in advance, if you do not understand please go to Google
- Basic Git operation (Git Init/Add/Commit/Pust/Fetch/Pull)
- Basic Node/NPM operation (npm install) or Yarn (similar to NPM)
- Basic Hexo command (hexo init/cl/s/g)

## Initialization project

First we create a new hexo project, the command line runs the following command
```bash
# Create a new hexo project
hexo init <dir>
Cd <dir>
```

Use the Git management for this project
```bash
Git init
# do something by yourself, if you want to push it to GitHub.
```

Add the Cake theme as the Git submodule for the project
```bash
git submodule add https://github.com/JiangTJ/hexo-theme-cake themes/cake
```

Modify the configuration file in Hexo `theme` to `cake`

A basic project can be created through the above steps. If you have already had your own blog project before this article, locate the unfinished steps and follow the instructions.

## Update theme version

If the theme you are using is still being maintained, then you can get updates from remote. This operation is very simple, like this:
```bash
git submodule update --remote
```

It will pull the code from the latest master to your submodule from the remote.

> If you want to modify the pull branch by `git config -f .gitmodules submodule.themes/cake.branch stable`, in general, the master branch is good enough, no need to modify

## Replace with npm script

The git submodule command is not easy to remember, another way is to use the npm script to replace. Edit the `package.json` file and add the following:
```json
{
  "name": "mrtt-hexo-blog",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "update-theme": "git submodule update --remote"
  },
  "hexo": {
    "version": "3.9.0"
  },
  "dependencies": {
    //...
  }
}
```

For each update, you only need to run `npm run update-theme`

## Custom Theme

This problem is often mentioned, I want to get updates from the official remote repository, but I want to be able to modify the file of the theme, add my own code, how to deal with it?

One way is to fork, and then use the theme of your fork as a submodule, but each update needs to synchronize the official update to the theme of your fork (somewhat troublesome)

The other one is introduced here: replacement. I don't make changes to the theme file, but I can create a file outside. The idea is to replace the file in the same way as the file path of the theme.

### Replacement

First, install a hexo plugin [hexo-theme-plus](https://github.com/jiangtj/hexo-theme-plus)
```bash
npm i --save @jiangtj/hexo-theme-plus
```

By default, the replacement path is already configured. If you need to modify it, modify the following configuration in hexo.
```yml
theme_plus:
  custom_path: custom/theme # disabled: set 'false'
```

Create a corresponding theme file in `custom/theme`, such as `${theme_dir}/layout/_partials/footer.swig`, copy it to `${hexo_dir}/custom/theme/_partials/footer.swig`, then Make some changes, for example, I added a Ծ‸ Ծ to the author information.
```html
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || author }} Ծ‸ Ծ</span>
```

`hexo s` run preview, we can see the bottom, the author has added Ծ‸ Ծ

> Replace has a bit of defects. First, it only supports files under `layout`. Secondly, it needs theme support (using partial, you can't use the specific syntax of the template, such as include). Cake except for the `layout` root directory, all support replacement. But NexT requires you to replace the syntax of `include` `macro` etc.

### Injection

Another way, you can also inject any code you want at the injection point. See my previous article [Hexo NexT Advanced Tutorial Injects](/articles/beechnut/hexo-next-injects/)

## Editing on another computer

In the case of Git repository synchronization, if you need to work on another computer, the only thing you need to do is add `--recursive` to the `git clone` command.

```bash
git clone --recursive https://github.com/your-name/your-blog
```

If it's a GUI tool, then nothing needs to be changed. They default to adding `--recursive`

If you forget to add `--recursive`, you can execute the following command. Of course, you can also add it to your npm scripts, so you can remember it.

```bash
git submodule init
git submodule update
```

## Summary

1. Don't modify any theme files. I believe that replacing and injecting, you can modify any theme code, which ensures that your theme repository can be set directly to the official repository, and the update has no conflicts.
2. There are very few commands to remember, just two `git submodule update --remote` and `git clone --recursive repo`
