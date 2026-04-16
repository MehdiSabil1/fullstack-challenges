## Contexte et objectif

Tu sais ce qu'est le refrain d'une chanson ? C'est la partie qui se répète, souvent avec les mêmes paroles. Par exemple, dans la chanson "Hey Ya!" d'OutKast, le refrain est :

> "Hey ya! Hey ya! Hey ya! Hey ya!" 📢

Jette un œil à la méthode `#refrain` dans `lib/refrain.rb`. Elle "chante" le refrain d'une chanson : elle prend des paroles et des paramètres optionnels pour contrôler combien de fois les répéter, le niveau de vibrato, et si on les chante fort.

Le problème est que ces paramètres optionnels sont **dépendants de l'ordre** : pour mettre `strong` à `true`, tu dois d'abord passer des valeurs pour `number_of_times` et `vibrato`, même si elles ne t'intéressent pas :

```ruby
refrain("hey ya", 1, 0, true)  # obligé de mettre 1 et 0 juste pour arriver à strong
```

Inverser l'ordre entraîne un comportement inattendu. C'est la **dépendance séquentielle**, et c'est une source courante de bugs.

La solution est de remplacer les arguments optionnels par un seul hash `options`. L'appelant ne passe alors que les options qui l'intéressent, par nom, dans n'importe quel ordre :

```ruby
better_refrain("hey ya", strong: true)
better_refrain("hey ya", number_of_times: 4, vibrato: 10, strong: true)
```

Note que l'argument `lyrics` est **obligatoire**, il vient donc toujours en premier et ne fait pas partie du hash `options`.

## Spécification

`#refrain` est déjà implémentée pour toi. Ta tâche est d'en écrire une nouvelle version :

- Implémente `#better_refrain` dans `lib/refrain.rb` pour qu'elle produise le même résultat que `#refrain`, mais en acceptant ses paramètres optionnels sous forme de hash plutôt que d'arguments positionnels.

## Enseignements clé

- As-tu **vraiment** compris pourquoi `#better_refrain` est plus flexible ? Essaie de l'expliquer à ton ou ta buddy.
