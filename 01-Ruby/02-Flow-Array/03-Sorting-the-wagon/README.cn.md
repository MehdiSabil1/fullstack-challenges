## 背景与目标

[`数组（Array）`类](https://ruby-doc.org/3.3.5/Array.html)是ruby中用于存储和访问数据的2个主要数据结构之一（我们在明天将看到另一个：[哈希（Hash）](https://ruby-doc.org/3.3.5/Hash.html )) 。

数组（Array）是有序的，因此可以通过每个元素的**索引**访问它。这个练习将帮助你理解如何创建一个数组，如何在其中存储数据，最后，如何用索引提取数据。
记住，数组索引是由`0`开始的，而不是`1`。

程序员经常被要求对事物进行排序，这就是为什么你应该阅读一些[排序算法（sorting algorithms）](http://en.wikipedia.org/wiki/Sorting_algorithm) (需要VPN 🛡)。希望这个Ruby文档会让你知道一些[枚举（Enumerable）]的排序方法(http://ruby-doc.org/3.3.5/Enumerable.html) 。`数组（Array）`就是`枚举（Enumerable）`的一种形式，所以你可以在使用`数组（Array）时，`应用`枚举（Enumerable）`文档页面中引用的所有方法（methods），因为`数组（Array）`**含有**`枚举（Enumerable）`模块。

## 详细说明

- 完成`wagon_sort`方法，该方法需要一个参数，即一个包含学生姓名（`字符串（String）`）的数组，并返回一个数组，将学生名字按字母顺序排序。
- 排序方法须对大小写不敏感，例如`bob` 应该放在`Felix`前面（查看[ASCII表](http://www.asciitable.com/)）
- 该方法应该保留名字原来的拼写。

### `wagon_sort` 方法

`wagon_sort` 方法应该接受一个学生姓名数组，并返回一个新的按字母顺序排序的数组，忽略大小写。原始数组应保持不变。

例如，如果你将数组 `["bob", "Felix", "Cedric"]` 传递给 `wagon_sort` 方法，它应该返回 `["bob", "Cedric", "Felix"]`。如果你传递一个空数组，它应该返回一个空数组。如果你传递 `["Alex", "Claire", "Toni"]`，它应该返回 `["Alex", "Claire", "Toni"]`。

你的任务只是在 `lib/wagon_sort.rb` 文件中定义 `wagon_sort` 方法。但如果你想在工作时测试你的方法，你可以尝试在实际数组上调用它，例如：

```ruby
wagon_sort(["bob", "Felix", "Cedric"])
# => ["bob", "Cedric", "Felix"]
```

现在不用担心构建界面；这将在稍后进行。现在，专注于正确实现 `wagon_sort` 方法。

### 交互式编程

现在，让我们构建一个使用 `wagon_sort` 方法的简单交互式程序。该程序将提示用户逐个输入学生姓名，当用户完成后，它将显示排序后的姓名列表。

打开`interface.rb`文件，确保使用`wagon_sort`方法。该接口应该有一个正确的风格化的输出。名称应该用逗号（`, `）分开，除了最后两个必须用`和`字隔开。

```bash
ruby lib/interface.rb

Type a student name:
felix
Type another student name or press enter to finish:
Cedric
Type another student name or press enter to finish:
bob
Type another student name or press enter to finish:

Congratulations! Your Wagon has 3 students:
bob, Cedric and felix # 注意正确的单词分隔。
```

💡 你应该使用什么类型的变量来存储名字？应该是数组、字符串、整数还是其他什么？

💡 我们如何让用户输入数据？不要忘记你的 `gets` 和 `puts`。

💡 当用户完成输入名字后，我们如何知道？你可以检查输入是否为空（即用户只是按了回车键而没有输入任何内容）。

💡 我们什么时候想要对名字进行排序？在用户完成输入后，对吧？也许你已经猜到了，但你已经编写了一些代码来帮助你做到这一点 😉

💡 我们如何显示名字？你可以使用 `puts` 来打印它们，但你会想要很好地格式化它们。记住用逗号分隔名字，并对最后两个名字使用"和"。

## 关键学习要点

熟悉基本的数组运算。你现在应该知道以下的语法：

- 创建一个数组（array）
- 在数组中添加一个新的元素
- 访问第n个元素
- 更新一个元素
- 根据索引删除一个元素
