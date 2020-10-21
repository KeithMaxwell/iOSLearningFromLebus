# 木琴App

## 如何区分不同的iOS控件？

可以使用它们的属性： tag来进行区分。tag的类型为整型（`Int`）。

我们可以通过	`控件.tag`的形式来查看或更改其tag的值。如果是在storyboard，则在控件的属性检查器里面更改即可。

## 如何在应用中加入音频？

1. 引入 AVFoundation框架
2. 使用`AVAudioPlayer(contentsOf:)`方法创建一个AVAudioPlayer，其参数类型为音频的URL对象。
3. 使用该对象的`play()`方法开始播放

需要注意的问题：

1. `AVAudioPlayer(contentsOf:)`可能会抛出一个异常，我们需要使用 异常处理来调用这个方法
2. AVAudioPlayer是一个强指针，一次只允许引用一个。即需要把它放到局部作用域的外面，即全局作用域中。

异常处理语句通常有如下框架构成：

```swift
let url = Bundle.main.url(forResource:"note1",withExtension:"wav")
//从do开始是异常处理框架：
do{
  //例如刚才的音频 另外，player是一个全局变量，定义为：var player:AvAudioPlayer!
  	player = try AVAudioPlayer(contentsOf:url!)
}catch{
  //如果引发异常，会执行catch作用域中的代码
}
```

取得一个资源的URL对象：

```swift
let url = Bundle.main.url(forResource:"文件名不包含后缀名",withExtension:"后缀名但没有.")
```

## 组(Group)和文件夹

Xcode中创建的组是虚拟文件夹，仅在Xcode中可以看到（为黄色）。而在访达中查看这个项目，会发现没有我们在Xcode中创建的组。

通常，Xcode中看到的颜色为黄色的为组（虚拟），蓝色的为文件夹（访达中真实存在）。

