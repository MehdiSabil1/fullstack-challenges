## 背景和目标

我们来开发一个具有基本增删查改功能的任务管理应用(To Do Manager)：

1. 做为用户，我可以浏览所有的任务(tasks)
2. 做为用户，我可以查看一个task的详细信息
3. 做为用户，我可以添加一个新的task
4. 做为用户，我可以编辑一个task（标记为已完成 / 更新标题和详细信息等）
5. 做为用户，我可以删除一个task

在这个练习，你会再一次见到老朋友[**Active Record**](http://guides.rubyonrails.org/active_record_basics.html)，它是Rails的对象关系映射(ORM)。

现在没有`rake`了，所以不要在`fullstack-challenges`里面创建你的Rails应用⛔。请遵守以下步骤：

```bash
cd ~/code/<user.github_nickname>
rails new rails-task-manager --skip-active-storage --skip-action-mailbox --skip-ci
cd rails-task-manager
git add .
git commit -m "rails new"
gh repo create --public --source=.
git push origin master
```

## 详细说明

### 1 - 模型Model

使用正确的rails生成器来生成`Task`模型。`Task`模型至少应该有以下字段：
- `title`, 数据类型是字符串`string`
- `details`, 数据类型是文本 `text`
- `completed`, 数据类型是布尔值`boolean` (默认值: `false`)

### 2 - 控制器Controller

使用正确的rails生成器来生成一个空的（没有任何动作的）`TasksController`控制器。

在这个练习里， **不要在 `config/routes.rb`文件里使用`resources`**。这个练习的目标是从零开始重新开发基本的增删查改CRUD功能。

### 3 - 做为用户，我可以查看所有的任务

首先，添加一个新路由来显示所有的任务，记得遵守课件里的rails约定。然后添加一个控制器动作和对应的视图。这个动作应该读取**所有的**任务，视图应该循环遍历并显示这些任务，就像下面的截图那样。

你的数据库需要有一些tasks用来测试你的视图！新开一个终端标签，并运行`rails console`，然后运行以下代码来创建一些tasks：

```ruby
Task.create title: '洗衣服', details: '不要把不同颜色衣服的混洗!'
Task.create title: '学习', details: '有很多卡片要学习', completed: true
```

⚠️ 现在先不要急着在视图里开发复选框的外观视觉效果。在选做练习你有机会来开发的。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/tasks-manager/index.png)

### 4 - 做为用户，我可以查看一个task的详细信息

我们现在有一个任务列表，我们想点击任务标题后跳转到一个新页面，显示了这个任务的详细信息。遵守课件里的rails约定，添加一个新的路由，控制器动作和视图。多亏了来自于参数`params`里的`id`，这个动作应该**读取**一个特定的任务。

使用`link_to`帮助方法创建链接并更新`index.html.erb`。

⚠️ 再一次，现在先不要急着在视图里开发复选框的外观视觉效果。在选做练习中你会有机会来开发的。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/tasks-manager/index_show.gif)

### 5 - 做为用户，我可以添加一个新任务

遵守课件里的rails约定，添加2个路由来创建一个新任务。一个路由用来显示添加任务的表单，另外一个路由用来处理提交表单的时候产生的`POST`请求。尝试在视图里直接使用`form_with`帮助方法。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/tasks-manager/new.gif)

### 6 - 做为用户，我可以更新一个任务

我们想让这个应用可以更新一个任务，修改任务标题，详细信息，特别是**把它标记为已完成**。遵守课件里的rails约定，添加2个路由来完成这个功能。实现控制器动作和视图。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/tasks-manager/edit.gif)

### 7 - 做为用户，我可以删除一个任务

最后，我们想要从任务列表里删除任务的功能。一个JavaScript验证是很有用的。

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/tasks-manager/destroy.gif)

### 8 - 重构（选做）

仔细研究你的代码，并且引入以下重构：

1. 在`config/routes.rb`使用`resources`
2. 在`TasksController`使用`before_action`
3. 我们可以在`new` 和 `edit`视图不要重复自己`DRY`吗？我们如何让新建任务的表单**不要**显示已完成？([提示](http://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-new_record-3F))

### 9 - 前端（选做）

**安装Bootstrap样式**

跟着[这个文档](https://getbootstrap.com/docs/5.3/getting-started/introduction/#css)来安装Bootstrap在你的Rails应用上。你可以复制粘贴下方代码在`application.html.erb`的`head`中添加一个`link`标签：

```erb
<!-- app/views/layouts/application.html.erb -->
<!-- [...] -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
```

你现在可以在你Rails应用的各个页面里使用Bootstrap class啦！🎉

**安装Font Awesome**

在你的layout里的`head`中添加下方的`link`标签：

```erb
<!-- app/views/layouts/application.html.erb -->
<!-- [...] -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.2/css/all.css">
```

你现在可以随意使用任何[免费的Font Awesome图标](https://fontawesome.com/search?m=free)啦！ 🎉尝试找找一些好看的选项框图标吧！

然后，在你的view里，使用条件语句。如果该任务是已完成状态，显示选中的方块。如果是未完成状态，则显示空的方块。
