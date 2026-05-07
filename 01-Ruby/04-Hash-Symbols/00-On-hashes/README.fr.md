## Contexte et objectifs

### À débattre avec ton buddy

- Qu'est-ce qu'un Hash ? En quoi est-il différent d'un Array ?
- Comment stocker et récupérer des données dans un Hash ?
- Que se passe-t-il si tu accèdes à une clé qui n'existe pas ?

### Synthèse technique

Un **Hash** est une collection de paires clé-valeur. Contrairement à un Array, qui utilise des index entiers, un Hash te permet de retrouver des données à l'aide d'une clé significative.

Voici un exemple :

```ruby
person = { "name" => "Alice", "age" => 30, "city" => "Paris" }
```

Tu peux accéder à une valeur par sa clé :

```ruby
person["name"]  # => "Alice"
person["age"]   # => 30
```

Si une clé n'existe pas, Ruby retourne `nil` :

```ruby
person["missing"]  # => nil
```

Tu peux aussi ajouter ou mettre à jour des paires clé-valeur de la même façon :

```ruby
person["job"] = "Developer"
```

Lis la documentation sur les [Hashes](https://ruby-doc.org/3.3.5/Hash.html) — tu les utiliseras tout le temps !

## Spécifications

Regarde le fichier `lib/hashes.rb`. Il contient un quiz dont la réponse est vraie ou fausse et quelques méthodes pour tester ta compréhension des Hashes.

## Enseignements clés

- Comment lire une valeur dans un Hash ?
- Que retourne Ruby si tu accèdes à une clé qui n'existe pas ?
- Comment ajouter une nouvelle paire clé-valeur à un Hash ?
- Comment mettre à jour une valeur existante dans un Hash ?
- Comment supprimer une clé d'un Hash ?
