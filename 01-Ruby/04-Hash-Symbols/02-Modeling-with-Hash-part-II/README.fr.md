## Contexte et objectifs

Maintenant, supposons que tu veuilles améliorer ton compteur de calories de façon à ce qu'il accepte une liste de boissons, burgers, garnitures **et MENUS** (meals). On va ajouter ces 3 menus à notre carte :

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

## Spécifications

Stocke ces repas dans une deuxième constante. Pour un repas comme le "Cheesy Combo", tu voudrais savoir qu'il est composé d'un "Cheese Burger", de "Sweet Potatoes" et d'une "Lemonade". Ton objectif est donc de pouvoir passer du nom d'un repas aux trois plats qui le composent. Tu pourras alors utiliser chacun de ces plats pour calculer le total de calories. Quelle structure de données utiliserais-tu pour décrire les repas dans une constante `MEALS` ?

On va maintenant créer une méthode `#calories_counter` complète, qui nous permettra de calculer les calories en exécutant :

```ruby
orders = ["Sweet Potatoes", "Cheesy Combo", "Lemonade", "Vegan Combo"]
puts calories_counter(orders)
# => 1395
```

## Enseignements clés

- Comment récupérer une valeur stockée dans un `Array` à l'intérieur d'un `Hash` ?

Imagine que nous construisons une application pour un zoo:
- Quelle structure de données utiliserais-tu pour stocker des noms d'animaux, triés par ordre alphabétique ?
- Quelle structure de données utiliserais-tu pour stocker des noms d'animaux et leurs couleurs ?
