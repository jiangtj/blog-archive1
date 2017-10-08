---
title: dart之环境搭建
date: 2017-10-8
categories: [dart]
tags: [dart web]
---

### 下载

windows可下载安装程序，也可以使用Chocolatey来安装  
下载地址：<https://www.dartlang.org/install>    
*需翻墙*  

### 工具

推荐下载WebStorm   
下载地址：<https://www.jetbrains.com/webstorm/>  

### 第一个Angular应用

官方推荐使用AngularDart，当然也有其他用户维护的vue，有兴趣可以尝试下。   

1. 在WebStorm的欢迎界面，选择创建新的工程。或者点击菜单的File > New > Project… 。  
2. 在左侧的菜单中选择Dart。  
3. 如果Dart SDK path 和 Dartium path fields没有值，选择安装路径。  
4. 修改Location中的值，已设置位置路径与应用的名称  
5. Generate sample content 打上勾  
6. 选择AngularDart Web App template  
7. 创建  

![](https://webdev.dartlang.org/guides/images/create-ng2-project.png)

### 运行

- 右键 pubspec.yaml 选择 Pub: Get Dependencies 更新依赖.   
- 右键 web/index.html 文件，然后选择 Run ‘index.html’  

![](https://webdev.dartlang.org/guides/images/run-app-in-ws.png)  

看到下面画面时就好ok咯   

![](https://webdev.dartlang.org/guides/images/run-app.png)  