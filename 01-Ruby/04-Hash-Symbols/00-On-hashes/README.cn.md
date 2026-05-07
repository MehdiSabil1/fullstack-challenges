## 背景与目标

### 和同学们讨论一下

- 什么是 Hash？它与 Array 有什么不同？
- 如何在 Hash 中存储和获取数据？
- 如果访问一个不存在的键，会发生什么？

### 技术概述

**Hash** 是一个键值对的集合。与使用整数索引的 Array 不同，Hash 允许你通过一个有意义的键来查找数据。

下面是一个例子：

```ruby
person = { "name" => "Alice", "age" => 30, "city" => "Paris" }
```

你可以通过键来访问对应的值：

```ruby
person["name"]  # => "Alice"
person["age"]   # => 30
```

如果键不存在，Ruby 会返回 `nil`：

```ruby
person["missing"]  # => nil
```

你也可以用同样的方式添加或更新键值对：

```ruby
person["job"] = "Developer"
```

阅读 [Hash 的文档](https://ruby-doc.org/3.3.5/Hash.html) — 你会经常用到它！

## 详细说明

打开 `lib/hashes.rb`。你会看到一个判断真假的小测验，以及几个方法来测试你对 Hash 的理解。

## 关键学习要点

- 如何从 Hash 中读取一个值？
- 如果访问不存在的键，Ruby 会返回什么？
- 如何向 Hash 中添加新的键值对？
- 如何更新 Hash 中已有的值？
- 如何从 Hash 中删除一个键？
