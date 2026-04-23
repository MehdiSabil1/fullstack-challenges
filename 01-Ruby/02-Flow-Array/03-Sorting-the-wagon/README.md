## Background & Objectives

The [`Array` class](https://ruby-doc.org/3.3.5/Array.html) is one of the two main structures used to store and access data in Ruby (the other being [Hash](https://ruby-doc.org/3.3.5/Hash.html), which we'll see in the next session).

An array is ordered, so each element can be accessed by its **index**. This exercise will help you understand how to create an array, how to store data in it, and finally, how to retrieve that data using the index. Remember, array indexes start at `0`, not `1`.

Programmers are often asked to sort things, that's why you should read about some [sorting algorithms](http://en.wikipedia.org/wiki/Sorting_algorithm).

Hopefully, the Ruby doc will give you several ways of sorting an [Enumerable](http://ruby-doc.org/3.3.5/Enumerable.html). `Array` is a form of `Enumerable`, so you can use all methods referenced on the `Enumerable` doc page while using an `Array`, because `Array` **includes** the module `Enumerable`.

## Specs

- Implement a `wagon_sort` method which takes one argument, an array of student names (`String`), and returns an array of those student names sorted alphabetically.
- The sorting method should be case insensitive, e.g. put `bob` before `Felix` (look at the [ASCII table](http://www.asciitable.com/))
- The method should keep the original spelling of the names.

### `wagon_sort` Method

The `wagon_sort` method should take an array of student names and return a new array with the names sorted alphabetically, ignoring case. The original array should remain unchanged.

For example, if you pass the array `["bob", "Felix", "Cedric"]` to the `wagon_sort` method, it should return `["bob", "Cedric", "Felix"]`. If you pass an empty array, it should return an empty array. If you pass `["Alex", "Claire", "Toni"]`, it should return `["Alex", "Claire", "Toni"]`.

Your job is just to define the `wagon_sort` method in the `lib/wagon_sort.rb` file. But if you want to test your method, while you work, you can try calling it on an actual array like:

```ruby
wagon_sort(["bob", "Felix", "Cedric"])
# => ["bob", "Cedric", "Felix"]
```

Don't worry about building the interface yet; that will come later. For now, focus on implementing the `wagon_sort` method correctly.

### Interactive Program

Now, let's build a simple interactive program that uses the `wagon_sort` method. The program will prompt the user to enter student names one by one, and when the user is done, it will display the sorted list of names.

Open the `interface.rb` file and make sure to use the `wagon_sort` method. The interface should have a properly stylized output. The names should be separated by commas (`, `) except for the last two that must be separated by the word `and`.

It should work like this:

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
bob, Cedric and felix # Notice the proper word separation.
```

💡 What kind of a variable should you use to store the names? Should it be an array, a string, an integer, or something else?

💡 How do we let the user input data? Don't forget your `gets` and `puts`.

💡 When the user is done entering names, how do we know that? You can check if the input is empty (i.e., the user just pressed enter without typing anything).

💡 When do we want to sort the names? After the user has finished entering them, right? And, maybe you've already guessed it, but you've written some code that will help you do that 😉

💡 How do we display the names? You can use `puts` to print them out, but you will want to format them nicely. Remember to separate the names with commas and use "and" for the last two names.

## Key learning points

Get familiar with basic array operations. You should now know the syntax used to:

- create an array
- append a new element to the array
- access the nth element
- update an element
- delete an element at a given index
