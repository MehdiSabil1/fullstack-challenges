## Background & Objectives

Now, let's say you want to improve your calorie counter, so that it can accept a list of drinks, burgers, sides, **and MEALS**. Let's add these 3 meals to our menu:

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

## Specs

Store these meals in a second constant. For a meal like the "Cheesy Combo", you'd want to know that it consists of "Cheese Burger", "Sweet Potatoes", and "Lemonade". So, your goal is to be able to go from the name of a meal to the three menu items that come with it. You can then use each of those menu items to calculate the total calories. What data structure would you use to describe the meals in a `MEALS` constant?

Let's now create a complete `#calories_counter` that will enable us to calculate calories by running:

```ruby
orders = ["Sweet Potatoes", "Cheesy Combo", "Lemonade", "Vegan Combo"]
puts calories_counter(orders)
# => 1395
```

## Key learning points

- How do you retrieve a value stored in an `Array` within a `Hash`?

Imagine we're building an application for a zoo:
- Which data structure would you use to store animal names, alphabetically sorted?
- Which data structure would you use to store animal names and colors?
