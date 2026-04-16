## 背景与目标

假设你想在学习变成的时候保持一个健康的饮食...你有一个绝妙的主意：写一个快捷的方法（method）来计算订单的卡路里。让我们用下面的表格作为精简版菜单：

<table class="table">
  <thead>
    <tr>
      <th>Item</th>
      <th>Calories</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Hamburger</td>
      <td>250</td>
    </tr>
    <tr>
      <td>Cheese Burger</td>
      <td>300</td>
    </tr>
    <tr>
      <td>Veggie Burger</td>
      <td>540</td>
    </tr>
    <tr>
      <td>Vegan Burger</td>
      <td>350</td>
    </tr>
    <tr>
      <td>Sweet Potatoes</td>
      <td>230</td>
    </tr>
    <tr>
      <td>Salad</td>
      <td>15</td>
    </tr>
    <tr>
      <td>Iced Tea</td>
      <td>70</td>
    </tr>
    <tr>
      <td>Lemonade</td>
      <td>90</td>
    </tr>
  </tbody>
</table>

你将把这些菜单数据存储于一个Ruby[常量(constant)](https://www.rubyguides.com/2017/07/ruby-constants/)。常量就像变量，但它用于保存不会改变的数据。按照惯例，常量名称用`全大写字母`书写。

下面是一个包含学生和他们年龄的`Hash`常量示例——`AGE_OF_STUDENTS`：

```ruby
AGE_OF_STUDENTS = {
  "Laura" => 23,
  "Peter" => 20,
  "Mary" => 27
}
```

然后你可以通过键来查找值：

```ruby
AGE_OF_STUDENTS["Laura"]  # => 23
```

你的常量将以`Hash`的形式保存上面的菜单，以菜品名称为键，卡路里数量为值。你的方法将在该常量中查找每道菜品来计算总卡路里。

阅读有关[哈希（Hashes）](https://ruby-doc.org/3.3.5/Hash.html)的文档。
你将总是会用到它们，所以和它们交个朋友吧 😊

**在这个练习中，为了简单起见，使用`字符串（Strings）`而不是`符号（Symbols）`作为你的键**

## 详细说明

- 定义一个`MENU`常量，将上面的菜单存储为`Hash`。
- 定义一个`#poor_calories_counter`方法，接受三个菜品名称作为参数，**通过在`MENU`常量中查找**来返回这三道菜的总卡路里数量。

例如`poor_calories_counter("Cheese Burger", "Sweet Potatoes", "Iced Tea")`应该返回`600`。

## 关键学习要点

- 什么是哈希（hash）？你在什么时候使用它们？
- 你怎样提取存储在一个哈希中的值？
