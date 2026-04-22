## Background & Objectives

### Discuss with your buddy

- What is a Hash? How is it different from an Array?
- How do you store and retrieve data in a Hash?
- What happens when you access a key that doesn't exist?

### Technical overview

A **Hash** is a collection of key-value pairs. Unlike an Array, which uses integer indexes, a Hash lets you look things up by a meaningful key.

Here's an example:

```ruby
person = { "name" => "Alice", "age" => 30, "city" => "Paris" }
```

You can access a value by its key:

```ruby
person["name"]  # => "Alice"
person["age"]   # => 30
```

If a key doesn't exist, Ruby returns `nil`:

```ruby
person["missing"]  # => nil
```

You can also add or update key-value pairs in exactly the same way:

```ruby
person["job"] = "Developer"
```

Read the documentation about [Hashes](https://ruby-doc.org/3.3.5/Hash.html) — you'll use them constantly!

## Specs

Look at `lib/hashes.rb`. You will find a true/false quiz and a few methods to test your understanding of Hashes.

## Key learning points

- How do you read a value from a Hash?
- What does Ruby return when you access a key that doesn't exist?
- How do you add a new key-value pair to a Hash?
- How do you update an existing value in a Hash?
- How do you remove a key from a Hash?
