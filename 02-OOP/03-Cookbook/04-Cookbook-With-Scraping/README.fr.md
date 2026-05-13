⚠️ Il n’y a **pas de `rake`** pour cet exercice. Désolé 😉

On va maintenant essayer d’améliorer l’application avec des recettes en ligne. Pour cela, on va utiliser [recipes.lewagon.com](https://recipes.lewagon.com). Si tu préfères utiliser un autre site Web de recettes, pas de problème ! Il doit simplement posséder une fonction de **recherche**, où les mots-clés recherchés passent dans la [chaîne de requête](https://en.wikipedia.org/wiki/Query_string).

## Configuration

Commence par copier-coller le code de ton Cookbook dans le dossier `lib` de l’exercice d’aujourd’hui :

```bash
# vérifie que tu es dans le bon répertoire
cd ~/code/<user.github_nickname>/fullstack-challenges/02-OOP/03-Cookbook/04-Cookbook-With-Scraping

# copie ton code de l’exercice 2 de Cookbook
cp -r ../03-Cookbook-With-CSV/lib .
```

Avant de commencer, exécute le code que tu as récupéré pour vérifier que les actions utilisateur implémentées (list / add / remove) fonctionnent bien !

```bash
ruby lib/app.rb
```

## Importer des recettes depuis le Web

Tu peux scraper n’importe quel site Web que tu connais, mais [recipes.lewagon.com](https://recipes.lewagon.com) est plutôt pas mal. Cette fonctionnalité devrait fonctionner comme suit :

```bash
-- My CookBook --
What do you want to do?

1. List all recipes
2. Add a recipe
3. Delete a recipe
4. Import recipes from the Internet
5. Exit

> 4
What ingredient would you like a recipe for?
> strawberry

Looking for "strawberry" recipes on the Internet...

1. Strawberry shortcake
2. Strawberry slushie
3. Strawberry martini
[...] display only the first 5 results

Which recipe would you like to import? (enter index)
> 2
Importing "Strawberry slushie"...
```

### Pseudo-code

Pour cette nouvelle **action utilisateur** (et donc cette nouvelle _route_), on a besoin de :

1.  demander à l’utilisateur un mot-clé à rechercher
2.  envoyer une requête HTTP au site Web de recettes avec le mot-clé
3.  parser le document HTML pour extraire les 5 premières recettes suggérées et les stocker dans un Array
4.  les afficher sous forme de liste indexée
5.  demander à l’utilisateur quelle recette il veut importer (demander un indice)
6.  l’ajouter au `Cookbook`

### Analyser le balisage de la page

Commence par réfléchir à la façon dont tu vas récupérer les informations du Web. Utilise [Nokogiri](https://nokogiri.org/) avec la bibliothèque `open-uri` pour obtenir la réponse HTML d’une URL donnée :

```ruby
require "nokogiri"
require "open-uri"
url = "https://recipes.lewagon.com/?query=strawberry"
doc = Nokogiri::HTML.parse(URI.parse(url).read, nil, "utf-8")
```

### Parser avec Nokogiri

Nokogiri est une gem utile et bien connue, qui sert à parser des documents HTML (mais elle ne fait pas que ça !) Voici comment tu peux l’utiliser pour parser un document une fois que tu connais les sélecteurs CSS des éléments qui t’intéressent. On abordera les sélecteurs CSS plus tard, mais grosso modo, ils permettent de sélectionner tous les éléments d’un attribut de `class` donné en créant la requête `.class`.

Par exemple, si on veut trouver tous les éléments de la classe `student` dans le document HTML suivant, on utilisera la requête `".student"`

```html
<ul>
 <li class="student">John</li>
 <li>Paul</li>
 <li class="student">Ringo</li>
</ul>
```

Tu peux travailler dans un fichier temporaire -- `parsing.rb` par exemple -- pour trouver les bons sélecteurs et le code Ruby pour obtenir toutes les données que tu veux extraire du contenu HTML. Tu peux commencer par afficher simplement les informations extraites avec `puts`. Une fois que tu as trouvé tous les sélecteurs dont tu as besoin, code l’action dans ton cookbook.

Aujourd’hui, tu vas utiliser la méthode Nokogiri `.search()`, qui prend un sélecteur CSS comme paramètre.

Si tu ne te souviens pas de la syntaxe, jette un œil à [notre antisèche](https://kitt.lewagon.com/knowledge/cheatsheets/nokogiri).

### `Controller` / `View` / `Router`

Maintenant que tu as la logique de parsing, le moment est venu d’ajouter une action utilisateur dans ton `Controller`. Utilise le pseudo-code ci-dessus pour te guider dans cette nouvelle méthode. Pour ton premier essai, tu peux copier-coller le code de parsing dans ton contrôleur.

Réfléchis à la **classe** que tu dois utiliser pour stocker des informations parsées depuis le Web. Laquelle est-ce ?

Essaie d’exécuter ton Cookbook en direct !

## Ajouter une propriété `@rating` à `Recipe`

Cette nouvelle propriété doit être :
- demandée à l’utilisateur lors de la création d’une nouvelle recette
- parsée depuis le Web lors de l’importation d’une nouvelle recette
- stockée dans le CSV
- imprimée lors de la création de la liste de recettes

## (Action utilisateur) Marquer une recette comme réalisée

Une fois que tu as fini avec la « Recherche », essaie d’ajouter une fonction pour marquer une recette comme réalisée :

```bash
-- Here are all your recipes --

1. [X] Crumpets (3 / 5)
2. [ ] Beans & Bacon breakfast (4 / 5)
3. [X] Plum pudding (3 / 5)
4. [X] Apple pie (4 / 5)
5. [ ] Christmas crumble (5 / 5)
```

## Ajouter une propriété `@prep_time` à `Recipe`

Cette nouvelle propriété doit également être :
- demandée à l’utilisateur lors de la création d’une nouvelle recette
- parsée depuis le Web lors de l’importation d’une nouvelle recette
- stockée dans le CSV
- imprimée lors de la création de la liste de recettes

## (Optionnel) Service

Essaie d’extraire la logique de **parsing** du contrôleur et de la placer dans un [**Service Object**](https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial) :

```ruby
class ScrapeRecipesService
 def initialize(keyword)
 @keyword = keyword
 end

 def call
    # TODO: return a list of `Recipe` built from scraping the web.
 end
end
```
