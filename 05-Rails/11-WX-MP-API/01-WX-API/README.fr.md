## Contexte et objectifs

L'objectif de ce challenge est de créer une API Rails à deux modèles (comme `Story` et `Comment`).
Ce challenge est similaire au [MVP Yelp](https://kitt.lewagon.com/camps/194/challenges?path=05-Rails/03-Rails-story-Comments/02-Yelp-MVP) que tu as construit pendant la semaine Rails.



## Générer l'application Rails

Tu n'utiliseras pas `rake` ici. Et ne crée pas ton application Rails dans `fullstack-challenges` ⛔

Tu vas utiliser le modèle minimal. Voici la configuration dont tu as besoin :

```bash
cd ~/code/<user.github_nickname>
rails new \
  --skip-ci \
  --database postgresql \
  --skip-action-mailbox \
  stories-api
cd stories-api
git add .
git commit -m "rails new"
gh repo create --public --source=.
git push origin master
```

Avant de commencer à coder ton application, assure-toi d'avoir terminé ton mini programme WeChat du cours de front-end WeChat avec toutes les user stories spécifiées dans les [challenges de cette journée](https://kitt.lewagon.com/camps/236/challenges?path=04-Front-End/09-WX-MP-Frontend/01-WX-MP-Frontend-01). Il s'agit de l'application front-end pour laquelle tu vas créer l'API.

## Spécifications

### 1 - Modèles

Génère le modèle `Story` avec le bon générateur Rails. Il doit avoir les colonnes suivantes. N'hésite pas à en ajouter autant que nécessaire pour ton application front-end ! 😊

- `name`, sous forme de `string`
- `text`, sousforme de `string`

Génère le modèle `Comment` (les commentaires sont uniquement ceux des visiteurs), avec les colonnes suivantes.

- `name`, sous forme de `string` pour le nom du commentateur
- `content`, sous forme de `string`
- `story`, sous forme de `references` pour lier le commentaire à la story à laquelle il correspond

N'oublie pas d'ajouter `has_many` pour lier les modèles ensemble dans le code et dans la base de données. Certaines validations pourraient être utiles !

### 2 - Seed

On va créer quelques stories dans la console `rails console`. Encore mieux : crée une seed pour ton application.

Cela te permettra de commencer à créer les endpoints de l'API à afficher dans l'application front-end, même si on ne peut pas (encore) ajouter de commentaire via le front-end.

Dans le fichier `db/seeds.rb`, on va créer des stories avec des commentaires.

Conseil : utilise la gem [Faker](https://github.com/faker-ruby/faker/) pour épicer tes données 🌶️🌶️🌶️  Par exemple :

```ruby
Faker::TvShows::GameOfThrones.character #=> "Tyrion Lannister"

Faker::TvShows::GameOfThrones.quote #=> "Never forget who you are. The rest of the world won't. Wear it like an armor and it can never be used against you."
```

### 3 - Contrôleur et routes

On peut commencer par ajouter toutes les routes du CRUD dans `config/routes.rb`. Mais a-t-on vraiment besoin de toutes les routes ? Quelles sont les quatre actions nécessaires avec une API ? (indice : on n'a pas besoin d'envoyer de formulaire pour `EDIT` ou `NEW` ; jette un œil au reste des étapes pour obtenir toutes les actions.)

Génère le contrôleur  `StoriesController` avec les quatre actions de l'API en utilisant le générateur Rails ou en les créant manuellemment.

Ajoute les espaces de noms des endpoints de l'API : ex. : `/api/v1/stories` - il existe une commande de routage simple pour cela. Tu peux aussi t'en servir pour spécifier le format de la requête (html ou json).

Puisqu'on utilisera les endpoints des stories pour les commentaires, on n'aura pas besoin de contrôleur `CommentsController`.


### 4 - Page d'indice des stories

On va ajouter l'action correcte dans le contrôleur `StoriesController` (indice : il s'agit d'`index` 😉). L'action dans le contrôleur doit récupérer toutes les stories dans la base de données (pour cela, on a Active Record !) et les passer à la vue json :

```ruby
# app/views/api/v1/stories/index.json.jbuilder
json.stories do
  #Use jbuilder functions to show story data in an json array
end
```

Conseil : familiarise-toi avec jbuilder en affichant seulement la première story avec les champs nécessaires pour l'endpoint (ex. : `created_at` est inutile). Après cela, essaie d'afficher toutes les stories dans un array.

On va également mettre à jour la vue (`index.js`) de l'application front-end pour appeler l'API et obtenir les données dynamiques :

```js
wx.request({
  url: YOUR_API_ROUTE,
  method: AN_HTTP_VERB(like GET, POST, PUT, DELETE),
  success(res) {
    // what to do with the API data
    // 1. save it to a local variable
    // 2. set page's data with that local variable
  }
})
```


### 5 - Page d'affichage de la story

On va maintenant ajouter l'action correcte pour afficher toutes les informations d'une story donnée. Comment savoir quelle story l'utilisateur souhaite consulter ?

Les commentaires seront inclus avec les données de la story :

```ruby
# app/views/api/v1/stories/show.json.jbuilder
json.extract! @story #... the story data
json.comments @story.comments do |comment|
   #... the comment data
end
```

Si tu affiches l'heure du commentaire, n'oublie pas d'utiliser `strftime` pour mettre en forme le timestamp.

On va également mettre à jour la vue (`show.js`) de l'application front-end pour appeler l'API et obtenir les données dynamiques.

### 6 - Page de création d'une story

Souviens-toi que pour créer une story dans une API, on a uniquement besoin d'une route. On n'a pas besoin d'une nouvelle route pour afficher le formulaire de nouvelle story, uniquement d'une nouvelle route pour gérer la requête `POST` générée à l'envoi du formulaire.

On va également mettre à jour la vue (`create.js`) de l'application front-end pour appeler l'API et envoyer les données générées par l'utilisateur. Quel verbe HTTP permet de créer des données ? (GET, POST, PUT, or DELETE)


### 7 - Page de modification des stories

On peut aussi ajouter la possibilité d'éditer une story, pour supprimer des coquilles après la création d'une story. Et si l'on refactorisait le formulaire `create.wxml` front-end en partial `form.wxml` à utiliser dans `new.wxml` ?

N'oublie pas de mettre à jour `show.wxml` et `show.js` avec le nouveau bouton d'édition de la story !

### 8 - Fonction de suppression d'une story

On va aussi ajouter la possibilité de supprimer une story de l'application. Comment créer un bouton pour supprimer une ressource ? Sur quelle action et quel verbe cela va-t-il avoir un effet dans le contrôleur ?

Une fois encore, mets à jour la vue de la show pour ajouter le bouton de suppression.


### 9 - Ajouter des commentaires  (optionnel)

On va ajouter un point de terminaison d'API pour créer des commentaires à partir du contrôleur (en stockant cette story comme celle à laquelle l'endpoint appartient). On va mettre à jour la page d'affichage avec un bouton permettant à l'utilisateur d'ajouter un commentaire avec son nom et une photo à afficher à côté du commentaire. On peut également ajouter une nouvelle page au front-end pour un formulaire qui utilisera cet endpoint de création de commentaires.

Pour tes routes, réfléchis à tes routes imbriquées pour spécifier la story à laquelle le nouveau commentaire appartient.


### 10 - Filtrer les stories (optionnel)

On va essayer d'ajouter une barre de recherche pour filtrer les stories dans l'index afin de trouver la story parfaite !

- Comment trouver ce que l'utilisateur recherche ?
- Quelle méthode Active Record peut-on utiliser pour créer un moteur de recherche simple ? Pour commencer, tu peux utiliser `@stories = Story.where("name LIKE '%garden%'")`. Assure-toi de bien comprendre cette déclaration avant d'aller plus loin.
- Comment t'assurer que la page fonctionne comme un index traditionnel, même si l'utilisateur ne recherche rien ?
- Comment t'assurer que le champ input est pré-rempli avec la recherche une fois que l'utilisateur a effectué sa recherche ?
