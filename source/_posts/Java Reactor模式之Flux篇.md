---
title: Java Reactor模式之Flux篇
date: 2017-9-12
categories: [java]
tags: [WebFlux,Reactor]
---

Spring5现处在第四个预发布版，正式版将要发布了，它带来的一大特性就是响应式框架spring webflux。默认采用的便是Reactor。因此。本文通过Reactor中的Flux，来学习使用Reactor，以及了解其传递的思想。本文基于Reactor3.1 rc1    

Reactor官方地址<http://projectreactor.io/>，官方文档写的十分详细，如果您有不错的英文能力，建议直接阅读官方文档。  

<!-- more -->

Flux<T> 继承自 Publisher<T> ，用于代表拥有 0 到 n 元素的流，相对于 Mono<T> (其包含0-1个元素) 更加复杂。所以弄懂了Flux，其实也已经对Mono熟悉了。  

### 静态方法
Flux一般通过静态方法构造，所以先看看它的静态方法。 

#### combineLatest

public static <T,V> Flux<V> combineLatest(Function<Object[],V> combinator, Publisher<? extends T>... sources)  
构建一个Flux，混合由多个的发布者发布最新事件.

![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/combinelatest.png)  

Type Parameters:  
T - 表示发布者的事件类型  
V - 被混合者混合后的类型  
Parameters:   
sources - 发布者，提供事件  
combinator - 混合者，接受最新的事件，处理并传递给下游。  
Returns:  一个以Flux为基础的混合流  
*不同的参数方法很多，这里都只展示一个。*  

#### concat
public static <T> Flux<T> concat(Publisher<? extends T>... sources)  
用于连接一个流。与combineLatest不同的是，concat都是在前一个流完成后在连接新的流。而combineLatest，则哪个事件最先到的，哪个先处理。  

![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/concat.png)  

Type Parameters:   
T - 事件的类型  
Parameters:  
sources - 一系列的发布者  
Returns:  一个新的Flux连接了所有的发布者，并传递给下游    

#### concatDelayError
拥有与concat类似的方法，不同的是，遇到错误不提前拦截，而是等到最后发布的事件处理完成后

#### create
public static <T> Flux<T> create(Consumer<? super FluxSink<T>> emitter)  
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
这是非常有用的，如果一个流，需要动态添加或者移除其他的多个事件，通过异步的api。而且，你将不必担心被取消和背压。  
*create(Consumer<? super FluxSink<T>> emitter, FluxSink.OverflowStrategy backpressure) 设置背压方式*  

##### backpressure(背压)概念的理解
这里，我摘自一位大神的话，背压是指在异步场景中，被观察者发送事件速度远快于观察者的处理速度的情况下，一种告诉上游的被观察者降低发送速度的策略。简而言之，背压是流速控制的一种策略。  
> 更多的背压到<http://www.jianshu.com/p/2c4799fa91a4>这里不多做介绍了    

#### defer
public static <T> Flux<T> defer(Supplier<? extends Publisher<T>> supplier)  
这个方法提供了一种惰性策略，发布者不会一开始发布消息，直到订阅者创建实例.  
![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/defer.png)  
Type Parameters:  
T - 发布者发布或订阅者接受的类型  
Parameters:  
supplier - 一个发布者的供应者，当订阅的时候回调  
Returns: 一个惰性的Flux  
#### empty
public static <T> Flux<T> empty()  
创建一个不含任何事件的流.
#### error
public static <T> Flux<T> error(Throwable error)  
返回一个带着立即终止标识和错误信息的流 
#### first
public static <I> Flux<I> first(Publisher<? extends I>... sources)  
挑选出第一个发布者，由其提供事件。能有效避免多个源的冲突，一般都会接switchOnNext，处理剩下的源。  
![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/firstemitting.png)  
#### from
public static <T> Flux<T> from(Publisher<? extends T> source)  
public static <T> Flux<T> fromIterable(Iterable<? extends T> it)  
public static <T> Flux<T> fromStream(Stream<? extends T> s)  
从一个发布者创建一个flux流  
#### fromArray，fromIterable，fromStream
public static <T> Flux<T> fromArray(T[] array)
通过一个数组，或者一个可迭代的元素，或者一个流，创建flux流.  

![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/fromarray.png)  

Type Parameters:  
T - 数组的类型和Flux的类型  
Parameters:  
emmm.. - 数组,可迭代的元素,流  
Returns: 新的flux流  

#### generate
public static <T> Flux<T> generate(Consumer<SynchronousSink<T>> generator)  
Programmatically create a Flux by generating signals one-by-one via a consumer callback.  

![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/generate.png)  

Type Parameters:  
T - the value type emitted  
Parameters:  
generator - Consume the SynchronousSink provided per-subscriber by Reactor to generate a single signal on each pass.
Returns: a Flux   
没看懂，好像是说，通过编程方式创建一个一对一的消费回调  

#### interval
public static Flux<Long> interval(Duration period)  
间隔一定的时间，发送事件。  
Runs on the Schedulers.parallel() Scheduler.  
![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/interval.png)  

#### just
public static <T> Flux<T> just(T... data)  
创建一个包含一系列元素的flux流  
![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/justn.png)  

#### merge
public static <I> Flux<I> merge(Publisher<? extends I>... sources)  
混合多个流，和combineLatest类似，但它要求是同类型的流合并，combineLatest需要提供合并方式  
![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/merge.png) 

#### never
public static <T> Flux<T> never()  
Create a Flux that will never signal any data, error or completion signal.  

![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/never.png)  

Type Parameters:  
T - the Subscriber type target  
Returns:  
a never completing Flux  
看一看，不是很明白，该流的用处。

#### onAssembly
protected static <T> Flux<T> onAssembly(Flux<T> source)  
To be used by custom operators: invokes assembly Hooks pointcut given a Flux, potentially returning a new Flux. This is for example useful to activate cross-cutting concerns at assembly time, eg. a generalized checkpoint().  
Type Parameters:  
T - the value type  
Parameters:  
source - the source to apply assembly hooks onto
Returns:  
the source, potentially wrapped with assembly time cross-cutting behavior  
看到了切入点，是不是类似于切面的作用，之后实例尝试一下，这里暂时不多做解释。  
#### push
public static <T> Flux<T> push(Consumer<? super FluxSink<T>> emitter)  
Programmatically create a Flux with the capability of emitting multiple elements from a single-threaded producer through the FluxSink API.  
This Flux factory is useful if one wants to adapt some other single-threaded multi-valued async API and not worry about cancellation and backpressure (which is handled by buffering all signals if the downstream can't keep up).  

For example:

```java
 Flux.<String>push(emitter -> {

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
 }, FluxSink.OverflowStrategy.LATEST);
 ```

Type Parameters:  
T - The type of values in the sequence  
Parameters:  
emitter - Consume the FluxSink provided per-subscriber by Reactor to generate signals.  
Returns:  a Flux  
跟create一样，之后看一下源码看，什么鬼ヽ(o_ _)o摔倒  

#### range
public static Flux<Integer> range(int start, int count)  
提供从start，到start + count的所有整数的flux流

#### switchOnNext
public static <T> Flux<T> switchOnNext(Publisher<? extends Publisher<? extends T>> mergedPublishers)  
从最新的发布者那里获取事件，如果有新的发布者加入，则改用新的发布者。  
当最后一个发布者完成所有发布事件，并且没有发布者加入，则flux完成。  
![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/switchonnext.png)

#### using
public static <T,D> Flux<T> using(Callable<? extends D> resourceSupplier, Function<? super D,? extends Publisher<? extends T>> sourceSupplier, Consumer<? super D> resourceCleanup)  
Uses a resource, generated by a supplier for each individual Subscriber, while streaming the values from a Publisher derived from the same resource and makes sure the resource is released if the sequence terminates or the Subscriber cancels.  
Eager resource cleanup happens just before the source termination and exceptions raised by the cleanup Consumer may override the terminal even.

![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/using.png)

#### zip
public static <I,O> Flux<O> zip(Function<? super Object[],? extends O> combinator, Publisher<? extends I>... sources)
通过混合者，合并多个流成一个输出流，一一对应合并
![](https://raw.githubusercontent.com/reactor/reactor-core/v3.1.0.RC1/src/docs/marble/zip.png)  

#### ...
看一下下面的api  
public static <T1,T2,T3,V> Flux<V> combineLatest(Publisher<? extends T1> source1, Publisher<? extends T2> source2, Publisher<? extends T3> source3, Function<Object[],V> combinator) 
public static <T1,T2,T3,T4,V> Flux<V> combineLatest(Publisher<? extends T1> source1, Publisher<? extends T2> source2, Publisher<? extends T3> source3, Publisher<? extends T4> source4, Function<Object[],V> combinator)   
...  
public static <T1,T2> Flux<Tuple2<T1,T2>> zip(Publisher<? extends T1> source1, lisher<? extends T2> source2)  
public static <T1,T2,T3> Flux<Tuple3<T1,T2,T3>> zip(Publisher<? extends T1> source1, lisher<? extends T2> source2, lisher<? extends T3> source3)  
...  
ヽ(o_ _)o摔倒

### 常用的实例方法
静态的方法介绍完了，但是实例方法比静态方法多太多，所以这里只举常用的几种介绍
### 实践


*未完待续*