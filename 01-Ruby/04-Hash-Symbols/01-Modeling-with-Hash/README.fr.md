## Contexte et objectifs

Supposons que tu aies envie de garder la ligne tout en apprenant à coder :) Tu as une super idée : rédiger une méthode rapide pour calculer le nombre de calories d'une commande d'un restaurant. On va se servir du tableau ci-dessous comme d'un résumé de la carte du restaurant en question:

<table class="table">
  <thead>
    <tr>
      <th>Item</th>
      <th>Calories</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Hamburger</td>
      <td>250</td>
    </tr>
    <tr>
      <td>Cheese Burger</td>
      <td>300</td>
    </tr>
    <tr>
      <td>Veggie Burger</td>
      <td>540</td>
    </tr>
    <tr>
      <td>Vegan Burger</td>
      <td>350</td>
    </tr>
    <tr>
      <td>Sweet Potatoes</td>
      <td>230</td>
    </tr>
    <tr>
      <td>Salad</td>
      <td>15</td>
    </tr>
    <tr>
      <td>Iced Tea</td>
      <td>70</td>
    </tr>
    <tr>
      <td>Lemonade</td>
      <td>90</td>
    </tr>
  </tbody>
</table>

Tu vas stocker ces données dans une [constante](https://www.rubyguides.com/2017/07/ruby-constants/) Ruby. Une constante, c'est comme une variable, mais elle est faite pour contenir des données qui ne changent pas. Par convention, les noms de constantes s'écrivent en `MAJUSCULES`.

Voici un exemple de constante contenant un `Hash` d'étudiants et leurs âges :

```ruby
AGE_OF_STUDENTS = {
  "Laura" => 23,
  "Peter" => 20,
  "Mary" => 27
}
```

Tu pourrais ensuite récupérer une valeur à partir de sa clé :

```ruby
AGE_OF_STUDENTS["Laura"]  # => 23
```

Ta constante contiendra le menu ci-dessus sous forme de `Hash`, avec les noms des plats comme clés et les calories comme valeurs. Ta méthode cherchera alors chaque plat dans cette constante pour calculer le total.

Lis la documentation sur les [Hashes](https://ruby-doc.org/3.3.5/Hash.html).
Tu vas t'en servir tout le temps, alors apprends à les aimer 😊

**Pour cet exercice, utilise des `Strings` pour tes clés, plutôt que des `Symbols`. C'est plus simple**

## Spécifications

- Définis une constante `MENU` qui stocke le menu ci-dessus sous forme de `Hash`.
- Définis une méthode `#poor_calories_counter` qui prend trois noms de plats en arguments et retourne le nombre total de calories pour ces trois plats, **en les recherchant dans ta constante `MENU`**.

Exemple : `poor_calories_counter("Cheese Burger", "Sweet Potatoes", "Iced Tea")` doit retourner `600`.

## Enseignements clés

- Qu'est-ce qu'un hash ? - Comment l'utilise-t-on ?
- Comment récupérer une valeur stockée dans un `Hash` ?
