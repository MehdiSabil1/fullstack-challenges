## 背景和目标

我们将要开发一个简单的类似于爱彼迎airbnb的克隆版应用，(就像[这个](https://rails-simple-airbnb.lewagon.com))。这是我们应用的所有的用户故事：

- 做为用户，我可以在网站浏览所有的公寓
- 做为用户，我可以在网站发布一个公寓，指定公寓的名字和地址
- 做为用户，我可以查看一个公寓的详细信息
- 做为用户，如果我不小心输入了错误的信息，我可以修改公寓的详细信息
- 做为用户，一旦我不想继续出租了，我可以从网站删除一个公寓

## 生成一个Rails应用

在你Github用户名的文件夹里创建一个Rails应用：

```bash
cd ~/code/<user.github_nickname>
rails new rails-simple-airbnb --skip-active-storage --skip-action-mailbox --skip-ci
cd rails-simple-airbnb
git add .
git commit -m "rails new"
gh repo create --public --source=.
git push origin master
echo "gem 'rspec-rails', group: [ :test ]" >> Gemfile
echo "gem 'rails-controller-testing', group: [ :test ]" >> Gemfile
bundle install
git submodule add git@github.com:lewagon/rails-simple-airbnb-specs.git spec
git add .
git commit -m "Prepare rails app with external specs"
rspec # to run the tests
```

## 前端设置

### 安装Bootstrap样式

跟着[这个文档](https://getbootstrap.com/docs/5.3/getting-started/introduction/#css)来安装Bootstrap在你的Rails应用上。你可以复制粘贴下方代码在`application.html.erb`的`head`中添加一个`link`标签：

```erb
<!-- app/views/layouts/application.html.erb -->
<!-- [...] -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
```

你现在可以在你Rails应用的各个页面里使用Bootstrap class啦！🎉

## Font Awesome

在你的layout里的`head`中添加下方的`link`标签：

```erb
<!-- app/views/layouts/application.html.erb -->
<!-- [...] -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.2/css/all.css">
```

你现在可以随意使用任何[免费的Font Awesome图标](https://fontawesome.com/search?m=free)啦！ 🎉

### Simple Form库

加入下方gem到你的Gemfile里，来将[Simple Form](https://github.com/heartcombo/simple_form)加到你的应用中：

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

每当你向应用程序添加迁移（例如，在 `rails g model ...` 后），不要忘记在我们规范中使用的**测试数据库**上运行迁移：

```bash
rails db:migrate RAILS_ENV=test  # 如果你添加了迁移
```

然后使用以下命令测试你的代码：

```bash
rspec
```

## 详细说明

### 1 - 模型Model

使用正确的Rails生成器来生成`Flat`模型。它应该包括以下字段。你也可以自行添加一些字段！😊

- `name`, 数据类型是字符串`string`
- `address`, 数据类型是字符串 `string`
- `description`, 数据类型是文本 `text`
- `price_per_night`, 数据类型是整数 `integer`
- `number_of_guests`, 数据类型是整数 `integer`

### 2 - 控制器Controller 和 路由Routes

使用正确的Rails生成器来生成一个空的（没有任何动作的）控制器`FlatsController` 。

既然我们将要开发所有的增删查改CRUD路由，我们可以添加所有的7个增删查改CRUD路由到`config/routes.rb`。你可以用哪一个关键词来直接生成这些路由？

### 3 - 初始化Seed

我们在控制台`rails console`里创建一些公寓，或者更好的方法是为我们的应用创建一个种子文件（seed file)。尽管我们暂时不能通过网站来添加公寓，这仍然会帮助我们设计视图。我们在`db/seeds.rb` 文件里创建大约4个公寓。你可以从这一个开始：


```ruby
Flat.create!(
  name: 'Light & Spacious Garden Flat London',
  address: '10 Clifton Gardens London W9 1DT',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price_per_night: 75,
  number_of_guests: 3
)
```

你还记得为什么我们使用`.create!` 而不是`.create`？如果你已经忘了就问一下旁边的人 😊

### 4 - 做为用户, 我可以浏览所有的公寓

我们在控制器`FlatsController`里添加正确的动作 (提示: 是 `index` 😉)。控制器里的动作应该读取数据库里所有的公寓flats（我们使用Active Record）并且传递给视图。

视图应该循环遍历并显示这些公寓，就像下面的截图那样。我们从头开始设计。我们可以使用[font awesome](https://fontawesome.com/icons) 或 [materialize](http://materializecss.com/icons.html) 图标。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/index.png)

### 5 - 做为用户，我可以添加一个公寓

一定要记得，我们需要两个路由来创建一个公寓。一个路由是用来显示添加新公寓的表单，另外一个路由是用来处理提交表单时产生的`POST` 请求。尝试在视图里直接使用`simple_form`帮助方法，而且要让表单好看一些。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/new.png)

### 6 - 做为用户，我可以查看一个公寓的详细信息

添加正确的动作来显示一个给定公寓的所有的信息。我们如何知道用户想看哪一个公寓呢？

我们也要使用`link_to`帮助方法创建动态链接，并更新`index.html.erb`视图。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/show.png)

### 7 - 做为用户，我可以编辑一个公寓的详细信息

我们也要添加编辑一个公寓的选项，以便在创建公寓后可以去除拼写错误。重构`new.html.erb`，把它做成一个局部视图（view partial）怎么样？

别忘了使用新的编辑公寓的链接来更新`index.html.erb` 和 `show.html.erb`视图！

### 8 - 做为用户，我可以从网站删除一个公寓

我们也要添加从网站删除一个公寓的功能。我们如何创建一个链接来删除一个资源，这个链接要触发控制器里的哪一个动作？

再一次，让我们更新所有的视图，加入这个删除链接。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/index_2.png)

### 9 - 在公寓模型flat model添加`picture_url` （选做）

我们在公寓模型添加一个图片链接地址的属性（仅需要保存图片链接地址的字符串）。更新我们的新建公寓表单和编辑公寓表单，让用户可以指定用来显示在网站上的公寓的图片。我们也可以更新我们的index和show页面来显示这个图片。


你可以在这里找到精美的公寓图片[unsplash](https://unsplash.com/s/photos/house)。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/show_2.png)

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/index_3.png)

### 10 - 过滤公寓（选做）

我们来尝试添加一个搜索框，可以在index页面过滤公寓以便找到符合要求的公寓！

- 我们如何知道用户在搜索什么？
- 我们可以用哪一个active record 方法来创建一个简单的搜索引擎？ 你可以从这里开始`@flats = Flat.where("name LIKE '%garden%'")`，在进一步开发之前确保你弄懂了这个语句声明。
- 我们如何确保当用户没有搜索的时候页面还是像原来的index页面一样？
- 我们如何确保在用户搜索之后搜索框里已经有搜索查询内容了？

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/index_4.png)
