## 背景与目标

现在，假设你想改进你的卡路里计数器，使他能够接受饮料，汉堡，配菜，**以及套餐**。让我们在菜单上加上下面这三种套餐：

<table class="table">
  <thead>
    <tr>
      <th>Meal</th>
      <th>Items in Meal</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Cheesy Combo</td>
      <td>Cheese Burger, Sweet Potatoes, Lemonade</td>
    </tr>
    <tr>
      <td>Veggie Combo</td>
      <td>Veggie Burger, Sweet Potatoes, Iced Tea</td>
    </tr>
    <tr>
      <td>Vegan Combo</td>
      <td>Vegan Burger, Salad, Lemonade</td>
    </tr>
  </tbody>
</table>

## 详细说明

将这些套餐存储在第二个常量中。对于"Cheesy Combo"这样的套餐，你需要知道它由"Cheese Burger"、"Sweet Potatoes"和"Lemonade"组成。因此，你的目标是能够从套餐名称找到其中包含的三个菜品。然后你可以使用这些菜品来计算总卡路里。你会用什么数据结构来在`MEALS`常量中描述这些套餐呢？

现在让我们试着创建一个完整的`#calories_counter`，它能够帮我们计算卡路里，只需运行：

```ruby
orders = ["Sweet Potatoes", "Cheesy Combo", "Lemonade", "Vegan Combo"]
puts calories_counter(orders)
# => 1395
```

## 关键学习要点

- 你如何提取存储在`哈希(Hash)`中的`数组（Array）`的值呢？

想象我们正在为动物园构建一个应用程序:
- 如果要存储动物名字并按照字母表顺便排序，你会使用哪种数据结构呢？
- 如果要存储动物的名字和颜色，你会使用哪种数据结构呢？
