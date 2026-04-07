## Contexte et objectifs

On veut créer un clone simple d'Airbnb (comme [celui-ci](https://rails-simple-airbnb.lewagon.com)). Les stories utilisateurs de ton application doivent être les suivantes :

- En tant qu'utilisateur, je peux voir tous les appartements disponibles sur notre site Web
- En tant qu'utilisateur, je peux poster un appartement sur le site Web, en précisant son nom et son adresse
- En tant qu'utilisateur, je peux voir les détails d'un appartement donné
- En tant qu'utilisateur, je peux modifier les détails d'un appartement si j'ai fait une erreur
- En tant qu'utilisateur, je peux supprimer un appartement du site Web si je ne veux plus le louer

Il n'y a pas de `rake` pour cet exercice.

## Génération de l'application Rails

Crée une nouvelle application Rails dans le dossier dont le nom est celui de ton compte GitHub :

```bash
cd ~/code/<user.github_nickname>
rails new rails-simple-airbnb --skip-active-storage --skip-action-mailbox --skip-ci
cd rails-simple-airbnb
git add .
git commit -m "rails new"
gh repo create --public --source=.
git push origin master
echo "gem 'rspec-rails', group: [ :test ]" >> Gemfile
echo "gem 'rails-controller-testing', group: [ :test ]" >> Gemfile
bundle install
git submodule add git@github.com:lewagon/rails-simple-airbnb-specs.git spec
git add .
git commit -m "Prepare rails app with external specs"
rspec # to run the tests
```

## Configuration front-end

### Feuille de style Bootstrap

En suivant [la documentation](https://getbootstrap.com/docs/5.3/getting-started/introduction/#css), installe Bootstrap dans ton application Rails en copiant-collant la balise `link` dans le `head` de ton layout `application.html.erb` :

```erb
<!-- app/views/layouts/application.html.erb -->
<!-- [...] -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
```

Tu peux désormais utiliser n'importe quelle classe Bootstrap dans les vues de ton application Rails 🎉

### Font Awesome

Ajoute la balise `link` de Font Awesome dans le `head` de ton layout :

```erb
<!-- app/views/layouts/application.html.erb -->
<!-- [...] -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.2/css/all.css">
```

Tu peux désormais utiliser n'importe quel [icône Font Awesome gratuit](https://fontawesome.com/search?m=free) 🎉

### Gemme Simple Form

Pour ajouter [Simple Form](https://github.com/heartcombo/simple_form) à ton application, ajoute la gemme à ton Gemfile :

```ruby
# Gemfile
# [...]
gem "simple_form"
```

Puis exécute :

```bash
bundle install
rails generate simple_form:install --bootstrap
```

### Tester ton code

Chaque fois que tu ajoutes des migrations à ton application (par exemple, après un `rails g model ...`), n'oublie pas d'exécuter également les migrations **sur la base de données de test** que nous utilisons dans nos spécifications :

```bash
rails db:migrate RAILS_ENV=test  # Si tu as ajouté une migration
```

Ensuite, teste ton code avec :

```bash
rspec
```

## Spécifications

### 1 - Modèle

Génère le modèle `Flat` avec le bon générateur Rails. Il doit avoir les colonnes suivantes. N'hésite pas à en ajouter autant que tu veux ! 😊

- `name`, sous forme de `string`
- `address`, sous forme de `string`
- `description`, sous forme de `text`
- `price_per_night`, sous forme d'`integer`
- `number_of_guests`, sous forme d'`integer`

### 2 - Contrôleur et routes

Génère un contrôleur `FlatsController` vide (sans action) avec le bon générateur Rails.

On peut commencer par ajouter nos 7 routes CRUD dans `config/routes.rb`, car on va toutes les construire ! Quel mot-clé peux-tu utiliser pour toutes les générer directement ?

### 3 - Seed

On va créer quelques appartements dans la console `rails console`. Encore mieux : crée une seed pour notre application. Cela te permettra de commencer à créer les vues, bien qu'on ne puisse pas vraiment ajouter d'appartement sur le site Web. Dans le fichier `db/seeds.rb`, on va créer 4 appartements. En voici un pour commencer :

```ruby
Flat.create!(
  name: 'Light & Spacious Garden Flat London',
  address: '10 Clifton Gardens London W9 1DT',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price_per_night: 75,
  number_of_guests: 3
)
```

Te souviens-tu pourquoi on utilise `.create!` au lieu de `.create` ? Si tu as oublié, pose la question autour de toi. 😊

### 4 - En tant qu'utilisateur, je peux voir tous les appartements disponibles

On va ajouter l'action correcte dans le contrôleur `FlatsController` (indice : il s'agit d'`index` 😉). L'action dans le contrôleur doit récupérer tous les appartements dans la base de données (pour cela, on a Active Record !) et les passer à la vue.

La vue doit faire une boucle dessus pour les afficher, comme sur la capture d'écran ci-dessous. On va tout créer depuis le début. Tu peux utiliser [font awesome](https://fontawesome.com/search?m=free) pour les icônes.

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/index.png)

### 5 - En tant qu'utilisateur, je peux ajouter un appartement

Souviens-toi que pour créer un appartement, on a besoin de deux routes. Une route sert à afficher le formulaire du nouvel appartement, l'autre à gérer la requête `POST` générée à l'envoi du formulaire. Essaie d'utiliser directement l'objet d'aide `simple_form` dans ta vue et de créer un joli formulaire !

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/new.png)

### 6 - En tant qu'utilisateur, je peux voir les détails d'un appartement donné

On va maintenant ajouter l'action correcte pour afficher toutes les informations d'un appartement donné. Comment savoir quel appartement l'utilisateur souhaite consulter ?

On va également mettre à jour la vue `index.html.erb` avec le fichier d'aide `link_to` pour créer les liens dynamiques.

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/show.png)

### 7 - En tant qu'utilisateur, je peux modifier les détails d'un appartement

On peut aussi ajouter la possibilité de modifier un appartement, pour supprimer des coquilles après la création d'un appartement. Et si l'on refactorisait le formulaire `new.html.erb` en partial ?

N'oublie pas de mettre à jour `index.html.erb` et `show.html.erb` avec les nouveaux liens de l'appartement modifié !

### 8 - En tant qu'utilisateur, je peux supprimer un appartement du site Web

On va également ajouter la possibilité de supprimer un appartement de notre site Web. Comment créer un lien pour supprimer une ressource ? Sur quelle action cela va-t-il avoir un effet dans le contrôleur ?

Encore une fois, mets à jour toute ta vue pour ajouter ce lien de suppression.

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/index_2.png)

### 9 - Ajouter `picture_url` au modèle d'appartement (optionnel)

On va ajouter un attribut URL d'image au modèle d'appartement (simplement en stockant une string avec l'URL d'une image). On va mettre à jour nos formulaires de création et de modification afin de permettre à l'utilisateur de spécifier l'image d'un appartement à afficher sur le site Web. On peut également mettre à jour nos pages d'index et de show avec la nouvelle image.

Pour ta seed, tu peux trouver de jolies images de maisons sur [unsplash](https://unsplash.com/s/photos/house).

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/show_2.png)

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/index_3.png)

### 10 - Filtrer les appartements (optionnel)

On va essayer d'ajouter une barre de recherche pour filtrer les appartements dans l'index et trouver l'appartement idéal !

- Comment trouver ce que l'utilisateur recherche ?
- Quelle méthode Active Record peut-on utiliser pour créer un moteur de recherche simple ? Pour commencer, tu peux utiliser `@flats = Flat.where("name LIKE '%garden%'")`. Assure-toi de bien comprendre cette déclaration avant d'aller plus loin.
- Comment t'assurer que la page fonctionne comme un index traditionnel, même si l'utilisateur ne recherche rien ?
- Comment t'assurer que le champ input est pré-rempli avec la recherche une fois que l'utilisateur a effectué sa recherche ?

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/simple-airbnb/index_4.png)
