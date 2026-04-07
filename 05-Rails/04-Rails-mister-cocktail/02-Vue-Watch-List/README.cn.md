## 背景和目标

是时候开发一个有 3 个模型的应用了！就像你猜想的那样，我们将会引入多对多关系(`N:N`)。那将是什么呢，为你自己创建一个观影清单 Watch List 应用。你可以创建清单，在清单里保存你喜欢的电影。

## 生成 Rails 应用

**注意**: 下面的步骤你应该已经熟记于心了。今天别忘了加上`-d postgresql`（明天你就知道为什么了）😉

```bash
cd ~/code/<user.github_nickname>
rails new rails-watch-list -d postgresql --skip-action-mailbox --skip-ci -T
cd rails-watch-list
```

我们要给这个新的 rails 应用创建 postgresql 数据库。

```bash
rails db:create
```

我们需要设置 git，在 GitHub 上创建一个代码仓库，并且把我们的项目代码推送过去。

```bash
git add .
git commit -m "rails new"
gh repo create --public --source=.
git push origin main
```

我们导入老师写好的 spec 以便来`rake`我们的进度。

```bash
echo "gem 'rspec-rails', group: [ :test ]" >> Gemfile
echo "gem 'rails-controller-testing', group: [ :test ]" >> Gemfile
bundle install
rails db:migrate
rails db:test:prepare
git submodule add https://github.com/lewagon/fullstack-challenges-04-Rails-watch-list-specs.git spec
git add .
git commit -m "Prepare rails app with external specs"
```

你可以测试你的代码：

```bash
rails db:migrate RAILS_ENV=test  # 如果你已经添加了数据库迁移
rspec spec/models                # 运行测试
```

开始写代码之前，不要忘了设置 Rails 应用的前端。就像早上的课程里那样，移除 Stimulus，设置 Vue，Bootstrap 和它的 JavaScript 依赖。

让我们先来移除 Stimulus 相关的内容，并安装 Vue。

移除以下内容：

```rb
# config/importmap.rb
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
```

```js
// app/javascript/application.js
import "controllers";
```

以及，下面的文件夹

<pre class="bash hljs">
.
└── <strong style="color: #117B8D">app</strong>
    └── <strong style="color: #117B8D">javascript</strong>
        └── <strong style="color: #117B8D">controllers</strong>
</pre>

添加我们要用到的 gem：

```ruby
# Gemfile
gem "autoprefixer-rails"
gem "bootstrap"
gem "font-awesome-sass", "~> 6.1"
gem "simple_form"
gem "sassc-rails" # Uncomment this line
```

使用 importmap 安装 Bootstrap 和 Vue:

```bash
importmap pin bootstrap
```

```rb
# config/importmap.rb

# add these two lines
pin "vue", to: 'https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.esm.browser.min.js'
pin_all_from "app/javascript/components", under: "components"
```

```bash
mkdir app/assets/javascript/components
bundle install
rails generate simple_form:install --bootstrap
```

然后下载 Le Wagon 的样式表:

```bash
rm -rf app/assets/stylesheets
curl -L https://github.com/lewagon/stylesheets/archive/vue.zip > stylesheets.zip
unzip stylesheets.zip -d app/assets && rm stylesheets.zip && mv app/assets/rails-stylesheets-vue app/assets/stylesheets
```

最后我们需要导入 Boostrap JS 库：

```js
// app/javascript/application.js
import "bootstrap";
```

不要忘了经常`commit`和`push`你的代码。

## 详细说明 Specs

### 1 - 模型 Models

和你的同伴一起在[kitt.lewagon.com/db](http://kitt.lewagon.com/db)画出数据库模式。
我们需要三个数据库表，  电影`movies`，  清单`lists`和   书签`bookmarks`。思考这些表之间的关系和*哪一个表将会保存引用（references）*。😉

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/db.png)

**重要**
不要运行`rake`命令，而是运行:

```bash
rspec spec/models
```

这个命令只跑`spec/models`文件夹里的测试。在继续开发练习的应用性部分之前确保这些测试都通过了（是绿色的）。

#### 属性

- 一个 **电影 movie**  有一个 **标题 title** (就像  `"神奇女侠1984"`)，一个**概况 overview** (`"在1980年代的冷战期间，《神奇女侠与苏联发生了冲突！"`)，一个 **海报图片地址 poster url** 和一个 **评分 rating** (6.9)。
- 一个 **清单 list**  有一个 **name** (就像  `"Drama"`, `"Comedy"`, `"Classic"`, `"To rewatch"`, ... )
- 一个 **书签 bookmark** 把一个电影添加到一个清单 (就像 神奇女侠 被添加到了 "女性力量" 观影清单)。所以每一个**bookmark** 通过**评论 comment**关联了一个电影和一个清单。**评论 comment** 字段用于让用户给书签 bookmark 添加一个简短的注释（就像阿兰·图灵推荐了这部电影）。

#### 验证

- 一个电影（movie）必须要有一个唯一（unique）的标题（title）。
- 一个清单（list）必须要有一个唯一的名字（name）。
- 一个书签（bookmark）必须关联一个电影（movie）和一个清单（list），而且这个组合[电影 movie, 清单 list]必须要是唯一的。
- 书签（bookmark）的（comment）字段不能少于 6 个字符。

#### 关联

- 一个清单（list）有多个书签（bookmarks）
- 一个清单（list）通过书签（bookmarks）有多个电影 movies
- 一个电影（movie）有多个书签（bookmarks）
- 一个书签（bookmark）属于一个电影 （movie）
- 一个书签（bookmark）属于一个清单（list）
- 如果一个电影（movie）被一个或一个以上的书签（bookmark）引用了，这个电影不能被删除
- 如果要删除一个清单（list），也需要删除所有关联的书签 bookmark（但是不能删除关联的电影 movies，因为这些电影可能被其它清单 list 引用）

### 2 - 初始化电影 movies

**我们的应用不允许用户创建电影**。
相反，我们会生成一些固定的电影供用户选择。
就像这样：

```ruby
# db/seeds.rb
Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
```

### 选做:

使用[faker gem](https://github.com/faker-ruby/faker)创建一些有趣的电影。

或者更好的办法是使用这个 API 接口来创建一些真实的电影[this API](https://developers.themoviedb.org/3/movies/get-top-rated-movies)(使用 ruby 的 `open-uri` 和 `json` 库)。

**API 设置**

使用这个 API 需要你注册并且生成一个 API 密钥。这个过程实在是太长了，在 Le Wagon，我们给你提供了一个访问这个 API 的**代理**。多亏了这个代理，你可以使用这个 API 而不需要生成你自己的 API 密钥。在这个练习里你要使用这个代理工具。我们信任你！

如何使用:

1. API 要求使用：`https://api.themoviedb.org/3/movie/top_rated?api_key=<你的API密钥>`
2. 你要做的是使用`http://tmkitt.lewagon.com/db`来替换链接里的`https://api.themoviedb.org/3`
3. 在[这里](http://tmkitt.lewagon.com/db/movie/top_rated)试一下

**电影的图片 Movie Images**

仔细阅读这篇[文章](https://developers.themoviedb.org/3/getting-started/images)来理解如何从 API 获取电影的图片。

### 3 - 清单 Lists 的路由，控制器和视图

**重要**
不要使用`rake`命令来开发应用部分。是时候在终端里运行`rails s`了，然后在浏览器打开[http://localhost:3000/](http://localhost:3000/)。始终要这样开发：

- 从**路由 route**开始,
- 然后再是**控制器 controller**,
- 最后才开发**view 视图**，并且刷新浏览器

一个功能已经开发好了（而且前端页面看起来也很好），重复以上流程，继续开发下一个功能！

你觉得你已经完成了**整个**挑战，运行`rake`命令确保开发的应用满足了详细说明里的所有要求。

**功能**
再次强调，要开发路由，你必须要对应用的功能有一个非常明确的认识。以下是功能列表：

- 用户可以看到所有的清单 lists

```
GET "lists"
```

- 用户可以看到一个给定清单 list 的详细信息和名称

```
GET "lists/42"
```

- 用户可以创建一个新的清单 list

```
GET "lists/new"
POST "lists"
```

### 4 - 书签 bookmarks 的路由，控制器和视图

- 用户可以给一个现有的清单添加一个新的书签（电影/清单 组合）
- 阅读  `simple_form`[文档](https://github.com/heartcombo/simple_form#associations)里关于`f.association`的部分，给我们的电影列表创建一个下拉选择框。

```
GET "lists/42/bookmarks/new"
POST "lists/42/bookmarks"
```

- 用户可以从清单 list 里面删除一个书签 bookmark。如何创建一个删除链接？

```
DELETE "bookmarks/25"
```

我们需要一个`MoviesController`控制器吗?

### 5 - 设计

开发一个非常好看的前端！和 CSS 好好玩一玩！😊 去 [dribbble](https://dribbble.com/) 或者 [onepagelove](https://onepagelove.com/) 找一些灵感。

不要忘了也可以在`app/assets/images`文件夹里使用本地图片。或者更好的办法是，当用户创建一个新的清单 list 的时候，让用户填入图片地址`image_url`。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/homepage.png)

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/showpage.png)

### 6 - 新建书签 bookmark 的表单放在清单 list 的 show 页面（选做）

尝试把"新建书签 bookmark 的表单"放在清单 list 的 show 页面，而不是一个单独的页面。这样你就不需要离开清单 list 页面来添加一个新的电影了！路由会有哪些改变？控制器有哪些改变？

### 7 - 电影的下拉选择框使用 Tom Select(选做)

我们在 Rails 应用里添加一个包！我们看看课件，如何把`tom-select`添加到电影的下拉选择框里。

使用 importmap 安装`tom-select`：

```bash
importmap pin tom-select
```

在 Vue 里使用：

- 设置 Vue，创建一个 Vue 实例并在`el`中选中相应页面
- 应用`select`标签
- 使用[基本案例](https://tom-select.js.org/examples/)代码片段中的一个来在 Vue 中实例化一个 Tom Select。

### 8 - 清单的点评(选做)

任何用户都可以对我们的电影收藏做评价（告诉我们他们的想法）。给我们的清单添加一些点评 reviews！

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/watch-list/reviews.png)

### 9 - 更进一步

- 添加搜索电影的功能。
- 使用`typed.js`在主页添加一些有趣的标题。
- 当我们在清单 list 的 show 页面向下滚动的时候，可以使用一些用于书签 bokmarks 的非常好的[滚动动画](https://michalsnik.github.io/aos/)
- 在点评 reviews 表单里使用[`star-rating.js`](https://github.com/pryley/star-rating.js/blob/master/README.md) 来显示星级，而不是常规的输入框。

注意，请在你的应用中使用 Vue 来应用 JavaScript ⚠️
