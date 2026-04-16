## 背景与目标

你知道歌曲的副歌是什么吗？它是歌曲中重复出现的部分，通常歌词相同。例如，在OutKast的歌曲"Hey Ya!"中，副歌是：

> "Hey ya! Hey ya! Hey ya! Hey ya!" 📢

看一下`lib/refrain.rb`中的`#refrain`方法。它"演唱"一首歌的副歌：接受歌词和可选参数来控制重复次数、颤音强度以及是否大声演唱。

问题在于这些可选参数是**顺序依赖的**：要将`strong`设为`true`，你必须先传入`number_of_times`和`vibrato`的值，即使你并不在意它们：

```ruby
refrain("hey ya", 1, 0, true)  # 为了传strong，不得不先填入1和0
```

顺序搞错就会产生意外的行为。这就是**顺序依赖**，是常见的bug来源。

解决方法是用单个`options`哈希替换可选参数。调用者只需传入自己关心的选项，按名称，顺序任意：

```ruby
better_refrain("hey ya", strong: true)
better_refrain("hey ya", number_of_times: 4, vibrato: 10, strong: true)
```

注意`lyrics`参数是**必填的**，所以它仍然排在第一位，不属于`options`哈希。

## 详细说明

`#refrain`已经为你实现好了。你的任务是编写一个新版本：

- 在`lib/refrain.rb`中实现`#better_refrain`，使其产生与`#refrain`相同的输出，但将可选参数改为以哈希形式接受，而不是位置参数。

## 关键学习要点

- 你**真正**理解为什么`#better_refrain`是一个更灵活的实现吗？试着向你的伙伴解释一下。
