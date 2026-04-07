## 背景和目标

本练习的目标是开发一个 2 个模型的 Rails 应用，一个 restaurant 模型和匿名的 review 模型。

你可以在这里看到一个类似的例子，使用 articles 和 comments 模型，[Rails 指南](http://guides.rubyonrails.org/getting_started.html#adding-a-second-model)。

## 生成 Rails 应用

你将使用一个外部的由老师编写的详细说明文件 specs 来测试你的 Rails 应用，这就是为什么要在命令里面指定`-T`，意思是不要生成 Rails 内置的测试文件。
以下是你将要运行的设置命令：

```bash
cd ~/code/<user.github_nickname>
rails new rails-yelp-mvp --skip-active-storage --skip-action-mailbox --skip-ci -T
cd rails-yelp-mvp
git add .
git commit -m "rails new"
gh repo create --public --source=.
git push origin master
echo "gem 'rspec-rails', group: [ :test ]" >> Gemfile
echo "gem 'rails-controller-testing', group: [ :test ]" >> Gemfile
bundle install
git submodule add git@github.com:lewagon/fullstack-challenges-03-Rails-restaurant-reviews-specs.git spec
git add .
git commit -m "Prepare rails app with external specs"
```

## 前端设置

### 安装 Bootstrap 样式

跟着[这个文档](https://getbootstrap.com/docs/5.3/getting-started/introduction/#css)来安装 Bootstrap 在你的 Rails 应用上。你可以复制粘贴下方代码在`application.html.erb`的`head`中添加一个`link`标签：

```erb
<!-- app/views/layouts/application.html.erb -->
<!-- [...] -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
```

你现在可以在你 Rails 应用的各个页面里使用 Bootstrap class 啦！🎉

### Simple Form 库

加入下方 gem 到你的 Gemfile 里，来将[Simple Form](https://github.com/heartcombo/simple_form)加到你的应用中：

```ruby
# Gemfile
# [...]
gem "simple_form"
```

然后运行：

```bash
bundle install
rails generate simple_form:install --bootstrap
```

### 测试你的代码

每次在你添加了一个数据库迁移文件之后（比如说 运行了`rails g model ...`之后），不要忘了在**测试数据库**上运行数据库迁移：

```bash
rails db:migrate RAILS_ENV=test  # 添加了一个数据库迁移之后运行
```

测试你的代码是非常简单方便的

```bash
rspec
```

如果运行`rspec`不顺利的话，你需要运行`bin/rspec`。这意味着你的环境变量`$PATH`没有包含`./bin` 文件夹，你可以通过 dotfiles 的 zshrc 来修复这个问题(查看[我们的默认配置](https://github.com/lewagon/dotfiles/blob/master/zshrc#L16-L18))。

## 详细说明

### 模型 Models

#### 模式 Schema

- 一个 restaurant 有 `name`, `address`, `phone_number`, `category`这些字段，会有很多个 reviews。
- 一个 review 有 `rating`, `content`这些字段，而且属于一个 restaurant。

在你选择数据类型的时候一定要仔细思考一下，第一次想到的不一定是正确的。

**问题**: 你可以在这里画出这个简单的数据库模式吗[kitt.lewagon.com/db](http://kitt.lewagon.com/db)? 和你的伙伴讨论一下。

#### 验证 Validation

- 一个 restaurant 必须要有 name，address 和 category。
- 一个 restaurant 的 category 必须在这个固定的清单里: `["chinese", "italian", "japanese", "french", "belgian"]`。
- 一个 restaurant 被删除之后，它所有的 reviews 也必须被删除。
- 一个 review 必须属于一个 restaurant。
- 一个 review 必须要有 content。
- 一个 review 必须要有 rating。
- 一个 review 的 rating 必须介于 0 和 5 之间。
- 一个 review 的 rating 必须是个整数。比如，rating 如果是 2.5 就是无效的。

在开发路由层之前，验证所有的模型测试。你可以使用下面的命令：

```bash
rspec spec/01_models
```

来选择性地运行`spec/01_models`文件夹下面的测试。

你也可以使用`rails console` 来手动测试你的代码。在每次代码修改之后，不要忘了使用`reload!`!

```bash
rails c
> bristol = Restaurant.new(name: "Epicure", category: "french")
> bristol.valid?              # 应该返回 false
> bristol.address = "75008 Paris"
> bristol.valid?              # 应该返回 true
> bristol.save                # 写入数据库，并设置id
> yummy = Review.new(content: "yummy yummy", rating: 4)
> yummy.restaurant = bristol  # 设置外键restaurant_id
> yummy.save
> bristol.reviews             # 应该包含 yummy review
> yummy.restaurant            # 应该返回 bristol restaurant
```

### 初始化

- 在`db/seeds.rb`文件，使用至少 5 条有效的 restaurant 数据记录来初始化数据库。
- 运行 `rails db:seed` 命令来执行初始化代码。

### 用户故事

问问自己哪些用户故事将构成你的应用程序，你将需要哪些路由，这是网络应用程序构建过程中非常重要的一步。**路由应该直接反映你的产品的用户故事**。因此，让我们定义我们的最简可行产品(Minimum viable product)：

- 访客可以看到所有的 restaurants（餐厅）。

```
GET "restaurants"
```

- 访客可以添加一个新的 restaurant，而且会被重定向（redirect）到新添加的 restaurant 的`show` 页面。

```
GET "restaurants/new"
POST "restaurants"
```

- 访客可以看到一个 restaurant 的详细信息，包括它所有的 reviews。

```
GET "restaurants/38"
```

- 访客可以给一个 restaurant 添加一个新的 review。

```
GET "restaurants/38/reviews/new"
POST "restaurants/38/reviews"
```

- 就这么多了!

在我们的最小可行性产品 MVP, 访客不可以更新或者删除任何的 restaurant 或者 review。这是 admin 用户才可以做的 (比如说 **你**) - 如果你想更新/删除任何数据库记录的话，做为开发者你有权限从`rails console`去操作数据库。

我们知道这只是一个最基础的最小可行性产品，但是我们想让你理解的是**一个路由就是一个用户故事的体现**。在你的应用里，不要为所有的模型盲目地写下 7 个增删查改 CRUD 路由。这很容易让你被自己的产品搞糊涂，从而忘了你的最小可行性产品到底是什么。

### 模块式编程：路由/控制器/视图

分开实现每一个用户故事！从编写路由开始（你可以看看上面的路由 😉），然后编写相应的控制器（controller action），最后编写视图（view）。不要同时启动多个用户故事! 一次编写一个故事，通过运行`rails s`来测试你的代码，确保所有的功能都能完美运行。

记住，不同的模型（model）需要不同的控制器（controller）。你将需要在终端生成它们。这里有一个[小提醒](https://kitt.lewagon.com/knowledge/cheatsheets/rails_commands)：

```bash
rails generate controller restaurants
```

**提示:** 你需要使用[嵌套资源](http://guides.rubyonrails.org/routing.html#nested-resources)来处理路由`GET "restaurants/38/reviews/new"`。

### 视图 Views

#### 布局 Layout / 局部视图 partials

记得使用布局和局部视图来重构你的视图。就像这样：

- 应用布局 applicaton layout 可以包括一个 Bootstrap 导航栏，链接到 restaurants 的列表页面和创建 restaurant 的表单页面。
- 表单可以放到一个局部视图`partial`，这让你的 HTML 代码易读性更好。

#### 帮助方法 Helpers

使用 Rails 帮助方法的时候，就像`link_to`方法，你可以传递一个包括了 HTML 属性的哈希 hash 做为参数。这让你可以把 Bootstrap CSS 类名称添加到链接里。下面是一个例子：

##### [link_to](http://apidock.com/rails/ActionView/Helpers/UrlHelper/link_to)

```erb
<%= link_to "See details", restaurant_path(restaurant), class: "btn btn-primary"%>
```

生成以下的 HTML 代码：

```html
<a href="/restaurants/3" class="btn btn-primary">See details</a>
```

##### [simple_form_for](https://github.com/heartcombo/simple_form)

因为我们安装了 Simple Form， 我们将会从现在开始使用`simple_form_for`而不是`form_with`。

你的 reviews 链接是嵌套在`/restaurants/:restaurant_id`里面的。这意味着你不能像非嵌套资源那样使用`simple_form_for`。 如果你写了这样的代码:

```erb
<%= simple_form_for(@review) do |f| %>
  <!-- [...] -->
<% end %>
```

会生成这样的 HTML 代码：

```html
<form action="/reviews">
  <!-- [...] -->
</form>
```

这不是我们想要的结果，因为**我们没有一个路由是`POST "reviews"`**。我们必须要使用符合嵌套资源语法规则的`form_with`：

```erb
<%= simple_form_for [@restaurant, @review] do |f| %>
  <!-- [...] -->
<% end %>
```

这会生成这样的 HTML 表单：

```html
<form action="/restaurants/42/reviews">
  <!-- [...] -->
</form>
```

这个 URL 是和你在`routes.rb`里定义的路由`POST "restaurants/:restaurant_id/reviews"`保持一致的。可以看一下这篇[文章](http://stackoverflow.com/questions/2034700/form-for-with-nested-resources)，有更多的信息。

### 改进你的应用

**一旦完成了 restaurant-review 应用的第一个版本**, 尝试去改进它，把 review 表单嵌入 restaurant 的详细页面。这意味着你的路由看起来要像这样：

```
GET "restaurants"
GET "restaurants/new"
GET "restaurants/38"
POST "restaurants"
POST "restaurants/38/reviews"
```

请注意我们不再使用路由`GET "restaurants/38/reviews/new"`。这是因为 review 表单**现在已经被嵌入了`restaurants/show.html.erb` 视图**。 🛏

要为此版本运行适当的测试，请运行命令 `rspec -t refactoring`
