---
title: Dart与Node对比
date: 2018-5-28
categories: [Web]
tags: [Dart,Node]
---

# 简介

## node
Node.js 是一个基于 Chrome V8 引擎的 JavaScript 运行环境。   
Node.js 使用了一个事件驱动、非阻塞式 I/O 的模型，使其轻量又高效。   
Node.js 的包管理器 npm，是全球最大的开源库生态系统。   

## dart
Dart是谷歌开发的计算机编程语言，后来被Ecma(ECMA-408)认定为标准。它被用于web、服务器、移动应用和物联网等领域的开发。它是宽松开源许可证（修改的BSD证书）下的开源软件。    
Dart是面向对象的、类定义的、单继承的语言。它的语法类似C语言，可以转译为JavaScript，支持接口(interfaces)、混入(mixins)、抽象类(abstract classes)、具体化泛型(reified generics)、可选类型(optional typing)和sound type system。 

<!-- more -->  

本篇文章基于node 8.11 与 dart 2.0-dev58   

# 包管理

对于任意一门语言，在依赖库膨胀的今天，包管理越来越显得重要。例如java的maven以及Swift的SPM(Swift Package Manager)    

## npm
npm是我见过的最简单，粗暴的包管理工具   
npm会根据package.json查找并下载依赖至本地的node_modules文件夹上，但这种方式导致每个项目都需要下载几乎相同的依赖文件（而且很大），为解决这样的问题，Facebook开发了yarn依赖管理工具，统一下载依赖本件，复制相关文件至对应的项目，以减少下载慢的问题。当然还有其他方案，例如pnpm，他通过链接，将依赖关联到统一位置，以解决网络与空间占用问题        
npm非常自由，每个用户都能上传与下载任意的js包，但也因此，npm的包也非常的乱，看一下angular官方的例子以及ivew的node_modules大小吧，很难想象，一个不大的项目需要这么大的依赖库    
![](/images/md/others/node_modules1.png)   

## pub
dart的包管理工具名为pub，他的管理方式类似于pnpm。他会下载依赖至统一的目录下。而每个项目都将关联依赖至该目录    
目前，dart库中项目大部分来自于谷歌或者谷歌移植的node库，谷歌但也因此，依赖库相对于node来说小了太多，但必要的库都是有的。   
谷歌的angular框架也基于dart进行了重新的开发，相对于TypeScript版来说，最显著的是依赖库明显少了好多     
![](/images/md/others/pub1.png)    

# 运行

Waiting for edit !!

# 编译

Waiting for edit !!


