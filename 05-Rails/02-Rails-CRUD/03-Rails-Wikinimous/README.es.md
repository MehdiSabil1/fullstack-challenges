## Contexto y Objetivos

Queremos construir un wiki anónimo (como [este](https://wikinimous.lewagon.com)) donde cualquier persona pueda crear un nuevo artículo o actualizar uno existente.

Aquí no hay `rake`. También recuerda no crear tu app Rails en `fullstack-challenges` ⛔️


```bash
cd ~/code/<user.github_nickname>
rails new rails-wikinimous --skip-active-storage --skip-action-mailbox --skip-ci
cd rails-wikinimous
git add .
git commit -m "rails new"
gh repo create --public --source=.
git push origin master
```

## Especificaciones

### 1 - Modelo

Genera el modelo `Article` a través del generador Rails adecuado. Debe tener por lo menos las siguientes columnas:

- `title`, como una cadena de caracteres (`string`)
- `content`, como `text`

No dudes en hacer el crash test de tu nuevo modelo en `rails console`:

```ruby
new_article = Article.new(title: 'The meaning of life', content: "It's 42!")
new_article.valid?  # => should be `true`
new_article.save    # => should not display rollback warnings
Article.last        # => should be the one you just saved
```

### 2 - Seed

Agrega la [gema `faker`](https://github.com/stympy/faker) a tu `Gemfile` y corre `bundle install`. Usa esta gema para generar 10 artículos falsos en
`db/seeds.rb`. Cuando tu código esté listo, corre lo siguiente:

```bash
rails db:seed
```

### 3 - Rutas, Controlador y Vistas

Genera tu controlador e implementa las 7 acciones CRUD por defecto para listar, mostrar, crear, actualizar y eliminar un artículo como lo hicimos en el task manager.

Ahora sí puedes usar el atajo `resources` directamente en tus rutas.

Échale un vistazo a la [live app](https://wikinimous.lewagon.com) para tener una idea de cómo debe lucir. 😉

### 4 - Front-end

**Instala las hojas de estilo de Bootstrap**

Sigue las instrucciones de [la documentación](https://getbootstrap.com/docs/5.3/getting-started/introduction/#css) e instala Bootstrap en tu Rails app copiando y pegando el link tag en el `head` del layout en `application.html.erb`:


```erb
<!-- app/views/layouts/application.html.erb -->
<!-- [...] -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
```

Ahora puedes usar cualquier clase Bootstrap en cualquier lugar de tus vistas de Rails 🎉

**Instala Font Awesome**

Agrega el `link` tag en el `head` de tu layout:


```erb
<!-- app/views/layouts/application.html.erb -->
<!-- [...] -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.2/css/all.css">
```

Ahora puedes usar cualquiera de los [íconos gratuitos de Font Awesome](https://fontawesome.com/search?m=free) 🎉
