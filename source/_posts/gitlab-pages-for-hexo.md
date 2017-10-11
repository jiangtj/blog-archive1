---
title: GitLab Pages 搭建Hexo教程
date: 2017-10-11
categories: [web]
tags: [hexo,gitlab-ci]
---

大部分情况下，都是github pages与hexo组合搭建静态博客。但不可否认的是，这样存在一些问题。比如，每次文章写完都需要要编译，才能上传，如果我仅仅想写个博客，这样的操作显得繁琐。又比如，你拥有多台电脑的情况，你需要在每台电脑上都配置一样的环境。    

所以通过持续集成CI/CD的方式，让编译自动化，是一种很不错的解决方案。这里将介绍gitlab-ci来简化环境的搭建与编译过程。当然静态资源将托管在gitlab-pages上。   

> There is also a tutorial in English

<!-- more -->

## 中文教程

### 环境搭建

1. 点击打开[gitlab pages例子页面](https://gitlab.com/groups/pages)
2. fork其中的hexo项目到自己的账户（如果没有需要创建一个新的gitlab账户）
3. 删除fork关系（点击项目左侧的settings->General，然后展开Advanced settings，删除fork关系）
4. 可选：修改项目信息，如Project name、Project description、Path等。*这里建议Path和Project name一同修改。*gitlab pages地址规则与github是一致的  
5. 可选：**建议修改`.gitlab-ci.yml`中node版本为6.11.2**
6. 修改任意一文件，如readme.md或者source/_posts下的文章

当你完成这些步骤，你可以点击右侧的CI/CD，可以看到如下画面：  

![](https://raw.githubusercontent.com/JiangTJ/assets/master/img/others/ci-1.jpg)  

当然你看到的可能是pending或running，这时请耐心等待。当显示为passed时，在浏览器中输入托管地址https://your-name.gitlab.io/projext-name，能访问，就意味着搭建成功咯    

### 修改主题

这个项目结构是标准的hexo的项目，除了多个一个`.gitlab-ci.yml`，如下图   

![](https://raw.githubusercontent.com/JiangTJ/assets/master/img/others/ci-2.jpg)  

我们仅需关心script部分即可，而这部分其实是标准的hexo命令。   

如果你想使用next主题（最受欢迎的hexo主题），<http://theme-next.iissnan.com>官网的网站上已有详细的教程


## English

### Get Started

1. Click [example projects for gitlab pages](https://gitlab.com/groups/pages)
2. Fork the project of hexo to your account(If you do not have any gitlab account, you can create a new)
3. Remove fork relationship(Choose settings->General from the list on the left.And expand Advanced settings to remove fork relationship)
4. Optional: modify project info，such as Project name, Project description, Path etc. *Here's a suggestion about that path and Project name modify together.* your website will be available at https://username.gitlab.io/projectname, it is familiar with gitlab pages.
5. Optional: **suggested modify the node's version from `.gitlab-ci.yml` to 6.11.2**
6. Modify any file, such as readme.md or the article under source/_posts
7. Choose CI/CD, waiting job completion
8. Click https://your-name.gitlab.io/projext-name

### Advanced

- you can modify script in `.gitlab-ci.yml`.
- you can change the theme to next, which is most popular theme of hexo, by a official tutorial <http://theme-next.iissnan.com>
