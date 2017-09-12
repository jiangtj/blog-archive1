---
title: Java Reactor模式之Flux篇
date: 2017-9-12
categories: [java]
tags: [WebFlux,Reactor]
---

Spring5现处在第四个预发布版，正式版将要发布了，它带来的一大特性就是响应式框架spring webflux。默认采用的便是Reactor。因此。本文通过Reactor中的Flux，来学习使用Reactor，以及了解其传递的思想。本文基于Reactor3.1 rc1    

Reactor官方地址<http://projectreactor.io/>，官方文档写的十分详细，如果您有不错的英文能力，建议直接阅读官方文档。  

<!-- more -->

Flux<T> 继承自 Publisher<T> ，用于代表拥有 0 到 n 元素的数据流，相对于 Mono<T> (其包含0-1个元素) 更加复杂。所以弄懂了Flux，其实也已经对Mono熟悉了。  

### static
Flux一般通过静态方法构造，所以先看看它的静态方法。

##### combineLatest

public static <T,V> Flux<V> combineLatest(Function<Object[],V> combinator, Publisher<? extends T>... sources)  
构建一个Flux，其数据源自不久前由多个的发布者发布数据.

![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/combinelatest.png)  

Type Parameters:  
T - 表示数据源类型  
V - 被混合者混合后的类型  
Parameters:   
sources - 待合并的数据源  
combinator - 混合者，接受最新的数据源，并返回一个流处理下一步骤。
Returns:  一个以Flux为基础的混合流  
*不同的参数方法很多，这里都只展示一个。*  

##### concat
public static <T> Flux<T> concat(Publisher<? extends T>... sources)  
用于连接一个流。与combineLatest不同的是，concat都是在前一个流完成后在连接新的流。而combineLatest，则数据最先到的，先处理。  

![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/concat.png)  

Type Parameters:   
T - 数据源与输出数据的类型  
Parameters:  
sources - 一系列的生产者  
Returns:  一个新的Flux连接了所有的输入的数据流  

##### concatDelayError
拥有与concat类似的方法，不同的是，遇到错误不提前拦截，而是等到最后的输入的数据流处理完成

##### create
通过FluxSink API，以同步或者异步方式创建Flux。  
例如：  
```java
 Flux.<String>create(emitter -> {

     ActionListener al = e -> {
         emitter.next(textField.getText());
     };
     // without cleanup support:

     button.addActionListener(al);

     // with cleanup support:

     button.addActionListener(al);
     emitter.onDispose(() -> {
         button.removeListener(al);
     });
 });
```
这是非常有用的，如果一个值，需要适配其他的值，通过异步的api。而且，你将不必担心取消和背压。  
*create(Consumer<? super FluxSink<T>> emitter, FluxSink.OverflowStrategy backpressure) 设置背压方式*  



*未完待续*