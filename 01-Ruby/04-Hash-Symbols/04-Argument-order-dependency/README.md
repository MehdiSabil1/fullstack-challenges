## Background & Objectives

Do you know what a song's refrain is? It's the part of the song that repeats, often with the same lyrics. For example, in the song "Hey Ya!" by OutKast, the refrain is:

> "Hey ya! Hey ya! Hey ya! Hey ya!" 📢

Take a look at the `#refrain` method in `lib/refrain.rb`. It "sings" a song's refrain: it takes some lyrics, and optional parameters to control how many times to repeat them, how much vibrato to add, and whether to sing them loudly.

The problem is that those optional parameters are **order-dependent**: to set `strong` to `true`, you have to pass values for `number_of_times` and `vibrato` first, even if you don't care about them:

```ruby
refrain("hey ya", 1, 0, true)  # had to fill in 1 and 0 just to get to strong
```

Get the order wrong and you'll end up with unexpected behaviour. This is **argument order dependency**, and it's a common source of bugs.

The fix is to replace the optional arguments with a single `options` hash. The caller then passes only the options they care about, by name, in any order:

```ruby
better_refrain("hey ya", strong: true)
better_refrain("hey ya", number_of_times: 4, vibrato: 10, strong: true)
```

Note that the `lyrics` argument is **required**, so it still comes first and is not part of the `options` hash.

## Specs

`#refrain` is already implemented for you. Your task is to refactor a new version:

- Implement `#better_refrain` in `lib/refrain.rb` so it produces the same output as `#refrain`, but accepts its optional parameters as a hash instead of positional arguments.

## Key learning points

- Do you **really** understand why `#better_refrain` is a more flexible implementation? Try explaining it to your buddy.
