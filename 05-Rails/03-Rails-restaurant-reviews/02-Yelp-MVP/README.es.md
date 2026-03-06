## Contexto y Objetivos

El objetivo de este desafío es crear una app Rails de dos modelos con un restaurante y reviews anónimos.
Puedes ver la [guía Rails](http://guides.rubyonrails.org/getting_started.html#adding-a-second-model) para ver un ejemplo similar usando artículos y comentarios.

## Generación de la app Rails

Vas a usar especificaciones externas que fueron escritas por los profesores para testear tu app Rails. Por eso especificamos `-T` lo que significa "no generes los tests integrados de Rails". Aquí está la configuración que necesitamos:

```bash
cd ~/code/<user.github_nickname>
rails new rails-yelp-mvp --skip-active-storage --skip-action-mailbox --skip-ci -T
cd rails-yelp-mvp
git add .
git commit -m "rails new"
gh repo create --public --source=.
git push origin master
echo "gem 'rspec-rails', group: [ :test ]" >> Gemfile
echo "gem 'rails-controller-testing', group: [ :test ]" >> Gemfile
bundle install
git submodule add git@github.com:lewagon/fullstack-challenges-03-Rails-restaurant-reviews-specs.git spec
git add .
git commit -m "Prepare rails app with external specs"
```

## Configuración del Front-end

### Instala las hojas de estilo de Bootstrap

Siguiendo las instrucciones de [la documentación](https://getbootstrap.com/docs/5.3/getting-started/introduction/#css), instala las hojas de estilo de Bootstrap en tu Rails app copiando y pegando el link tag en el `head` del layout en `application.html.erb`:

```erb
<!-- app/views/layouts/application.html.erb -->
<!-- [...] -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
```

Ahora puedes usar cualquier clase Bootstrap en cualquier lugar de tus vistas de Rails 🎉

### La gema Simple Form

Para agregar [Simple Form](https://github.com/heartcombo/simple_form) a tu aplicación, agrega la gema en tu Gemfile:

```ruby
# Gemfile
# [...]
gem "simple_form"
```

Luego ejecuta esto:

```bash
bundle install
rails generate simple_form:install --bootstrap
```

### Testeo de tu código

Siempre que agregues migraciones a tu app (e.g. después de un `rails g model ...`), no olvides también correr las migraciones **en la base de datos de testeo** que usamos en nuestras especificaciones:

```bash
rails db:migrate RAILS_ENV=test  # If you added a migration
```

Luego verás que testear tu código será tan simple como con el viejo'

```bash
rspec
```

Si tienes problemas corriendo `rspec`, tal vez tengas que correr `bin/rspec`. Eso significa que tu `$PATH` no contiene la carpeta `./bin`. Esto lo puedes arreglar en los zshrc de tus dotfiles (lee [nuestra configuración por defecto](https://github.com/lewagon/dotfiles/blob/master/zshrc#L16-L18)).

## Especificaciones

### Modelos

#### Esquema

- Un restaurante tiene un nombre (`name`), una dirección (`address`), un número de teléfono (`phone_number`), una categoría (`category`) y puede tener muchos reviews.
- Un review tiene una calificación (`rating`), un contenido (`content`) y pertenece al restaurante.

Asegúrate de pensarlo dos veces antes de seleccionar el tipo de datos.¡No siempre resulta ser la primera selección!

**Pregunta**:¿Puedes dibujar este esquema simple en [kitt.lewagon.com/db](http://kitt.lewagon.com/db)? Háblalo con tu compañero (buddy).

#### Validación

- Un restaurante tiene que tener un nombre (name), una dirección (address) y una categoría (category).
- La categoría de un restaurante debe pertenecer a esta lista fija: `["chinese", "italian", "japanese", "french", "belgian"]`.
- Cuando un restaurante es eliminado, todos sus reviews también deben ser eliminados
- Un review debe pertenecer a un restaurante.
- Un review debe tener un contenido (content).
- Un review debe tener una calificación (rating).
- La calificación de un review debe ser un número entre 0 y 5.
- La calificación de un review debe ser un número entero. Por ejemplo, un review con una calificación de 2,5 no debería ser válida.

Valida todos los tests de los modelos antes de empezar a trabajar con las rutas. Puedes usar el siguiente comando:

```bash
rspec spec/01_models
```

Para correr tests selectivamente en la carpeta `spec/01_models`.

También puedes testear tu código manualmente con la `rails console`.¡No olvides hacer `reload!` entre cada cambio que hagas en el código!

```bash
rails c
> bristol = Restaurant.new(name: "Epicure", category: "french")
> bristol.valid?              # Should return false
> bristol.address = "75008 Paris"
> bristol.valid?              # Should return true
> bristol.save                # Insert into DB and set id
> yummy = Review.new(content: "yummy yummy", rating: 4)
> yummy.restaurant = bristol  # Set foreign key restaurant_id
> yummy.save
> bristol.reviews             # Should contain the yummy review
> yummy.restaurant            # Should return the bristol restaurant
```

### Seed

- Alimenta tu base de datos de restaurante en `db/seeds.rb` con al menos 5 registros de restaurantes válidos.
- Corre `rails db:seed` para iniciar el script del seed.

### Historias de usuarios

Preguntarse qué historias de usuario compondrán su aplicación y qué rutas necesitará es un paso muy importante en el proceso de creación de su aplicación web. **Las rutas deben reflejar exactamente las historias de usuario de tu producto**. Así que vamos a definir nuestro producto mínimo aquí:

- Un visitante puede ver la lista de todos los restaurantes.

```
GET "restaurants"
```

- Un visitante puede agregar un nuevo restaurante y ser redireccionado a la vista `show` de ese nuevo restaurante.

```
GET "restaurants/new"
POST "restaurants"
```

- Un visitante puede ver los detalles de un restaurante con todos sus reviews.

```
GET "restaurants/38"
```

- Un visitante puede agregar un review a un restaurante.

```
GET "restaurants/38/reviews/new"
POST "restaurants/38/reviews"
```

- ¡Y eso es todo!

En nuestro MVP, un visitante no puede actualizar / borrar un restaurante ni un review. Este es el papel del administrador (e.g. **tú**). Como programador/a tienes el poder de manipular la base de datos (DB) desde la `rails console` si quisieras actualizar / borrar algún registro.

Sabemos que es un MVP muy básico pero solo debemos entender que **cada ruta es una representación de un user story**. No escribas las 7 rutas CRUD ciegamente para cada modelo de tu app. Esa es la mejor manera de confundirse con tu propio producto y olvidar lo que el MVP realmente es.

### Codificación en Silo: Route/Controller/View

¡Implementa cada historia de usuario por separado! Empieza escribiendo la ruta (puedes mirar las rutas más arriba 😉 ), luego codifica la acción del controlador correspondiente y finalmente la view. ¡No empieces varias historias de usuario a la vez! Codifica una historia cada vez, asegurándote de que todo funciona perfectamente ejecutando el `rails s` y probando tu código.

Recuerda, necesitarás diferentes controladores para los diferentes modelos que usarás en este ejercicio y necesitas generarlos en la terminal. Aquí tienes un [recordatorio útil](https://kitt.lewagon.com/knowledge/cheatsheets/rails_commands):

```bash
rails generate controller restaurants
```

**Pista:** para manejar la ruta `GET "restaurants/38/reviews/new"`, tendrás que usar [nested resources](http://guides.rubyonrails.org/routing.html#nested-resources).

### Vistas

#### Layouts / partials

Recuerda refactorizar tus vistas usando distribuciones y partials. Por ejemplo:

- La distribución de la aplicación puede incluir una barra de navegación Bootstrap con enlaces a la lista de restaurantes y al formulario de creación de un restaurante.
- Los formularios pueden colocarse en un `partial` para hacer que tu código HTML sea más legible.

#### Helpers

Cuando uses helpers de Rails como `link_to`, puedes pasarle un hash de atributos HTML. Esto te permite agregarle clases CSS de Bootstrap a tus enlaces. Por ejemplo:

##### [link_to](http://apidock.com/rails/ActionView/Helpers/UrlHelper/link_to)

```erb
<%= link_to "See details", restaurant_path(restaurant), class: "btn btn-primary"%>
```

Esto genera el siguiente HTML:

```html
<a href="/restaurants/3" class="btn btn-primary">See details</a>
```

##### [simple_form_for](https://github.com/heartcombo/simple_form)

Dado que instalamos Simple Form, de ahora en adelante vamos a utilizar el helper `simple_form_for` en lugar de `form_with`.

Las URLs de tus reviews ahora están anidadas en `/restaurants/:restaurant_id`. Esto significa que no puedes usar `simple_form_for` de la misma manera que lo hiciste con elementos no anidados (non-nested resources). Si escribes:

```erb
<%= simple_form_for(@review) do |f| %>
  <!-- [...] -->
<% end %>
```

Generará este HTML:

```html
<form action="/reviews">
  <!-- [...] -->
</form>
```

Eso no es lo que queremos porque **no tenemos una ruta para `POST "reviews"`**. En cambio, tendrás que usar la sintaxis de recursos anidados para el `form_with`:

```erb
<%= simple_form_for [@restaurant, @review] do |f| %>
  <!-- [...] -->
<% end %>
```

Eso generará el siguiente formulario HTML:

```html
<form action="/restaurants/42/reviews">
  <!-- [...] -->
</form>
```

Ahora esta URL es consistente con la ruta `POST "restaurants/:restaurant_id/reviews"` que definiste en `routes.rb`.¡Siii! Para obtener más información al respecto, lee [este post](http://stackoverflow.com/questions/2034700/form-for-with-nested-resources).

### Mejora tu app

**Una vez que hayas terminado tu primera versión de tu resto-review app**, intenta mejorarla metiendo tu formulario de reviews dentro de cada vista show de "restaurant". Esto quiere decir que tus nuevas rutas serán:

```
GET "restaurants"
GET "restaurants/new"
GET "restaurants/38"
POST "restaurants"
POST "restaurants/38/reviews"
```

Date cuenta que eliminamos la ruta `GET "restaurants/38/reviews/new"`. Esto se debe a que el formulario de review **ahora está incrustado en la vista `restaurants/show.html.erb`**. 🛏

Para correr las pruebas correspondientes a esta versión, ejecuta el comando `rspec -t refactoring`.
