## Contexto y Objetivos

El objetivo de este desafío es crear una API Rails de dos modelos (como `Story` y `Comment`).
Esto es similar al [MVP de Yelp](https://kitt.lewagon.com/camps/194/challenges?path=05-Rails/03-Rails-story-Comments/02-Yelp-MVP) que creaste durante la semana Rails.



## Generación de la app Rails

Aquí no hay `rake`. También recuerda no crear tu app Rails en `fullstack-challenges` ⛔️

Vas a usar la plantilla minimal. Aquí está la configuración que necesitas:

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

Antes de empezar a trabajar en tu app, asegúrate de haber completado tu programa WeChat Mini del curso WeChat Front-end con todas las user stories especificadas en los [desafíos de ese día](https://kitt.lewagon.com/camps/236/challenges?path=04-Front-End/09-WX-MP-Frontend/01-WX-MP-Frontend-01). Esta es la aplicación front-end para la cual harás la API.

## Especificaciones

### 1 - Modelos

Genera el modelo `Story` por medio del generador Rails adecuado. Debe tener las siguientes columnas. ¡Puedes agregar todas las columnas que tu app front-end necesite! 😊

- Nombre (`name`), como una cadena de caracteres (`string`)
- Texto (`text`), como una cadena de caracteres (`string`)

Genera el modelo `Comment` model (Los Comments solo son comentarios de los visitantes) con las siguientes columnas:

- Nombre (`name`), como una cadena de caracteres (`string`) para el nombre de la persona que comenta
- Contenido (`content`), como una cadena de caracteres (`string`)
- Historia (`story`), como `references` para enlazarla al comentario

No olvides agregar `has_many` para enlazar los modelos en el código y también en la base de datos.¡También sería bueno agregar algunas validaciones!

### 2 - Seed

Crea algunas historias en la `rails console`. Mejor aún, crea un pequeño seed para nuestra app.

Esto nos ayudará a comenzar el diseño de los endpoints de la  API que se mostrarán en la app front-end a pesar de que todavía no podemos agregar un comentario por medio de nuestro front-end.

En el archivo `db/seeds.rb`, crea algunas historias con comentarios.

Consejo: Usa la gema [Faker](https://github.com/stympy/faker/) para darle un poco de gusto a tus datos 🌶️🌶️🌶️ . Por ejemplo:

```ruby
Faker::TvShows::GameOfThrones.character #=> "Tyrion Lannister"

Faker::TvShows::GameOfThrones.quote #=> "Never forget who you are. The rest of the world won't. Wear it like an armor and it can never be used against you."
```

### 3 - Controlador y Rutas

Podemos empezar agregando todas las rutas CRUD en nuestro `config/routes.rb` pero ¿crees que las necesitamos todas?¿Cuáles son las cuatro acciones que se necesitan para una API? (pista: no es necesario enviar formularios a `EDIT` o `NEW`. Lee los otros pasos para más información).

Genera el `StoriesController` con las cuatro acciones API usando el generador Rails o creándolas manualmente.

Agrega espacios en los nombres de los endpoints correctamente e.g. `/api/v1/stories` Hay un comando de ruta simple para esto. También lo puedes usar para especificar el formato de la petición (html o json).

Dado que vamos a usar endpoints de historias para los comentarios, no necesitamos un `CommentsController`.

### 4 - Página Index de las Historias

Agrega la acción adecuada en nuestro `StoriesController` (Pista: Es `index` 😉). Dicha acción debe recuperar todas las historias en nuestra base de datos (¡para eso tenemos Active Record!) y pasarla a la vista json:

```ruby
# app/views/api/v1/stories/index.json.jbuilder
json.stories do
  #Use jbuilder functions to show story data in an json array
end
```

Consejo: Familiarizate con jbuilder mostrando la primera historia con los campos necesarios para el endpoint (e.g. no hay `created_at`). Luego intenta mostrar todas las historias en un arreglo (array).

También actualiza la vista de la app front-end (`index.js`) para llamar a la API y obtener datos dinámicos:

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

### 5 - Página Show de la Historia

Es hora de agregar la acción adecuada para mostrar toda la información de una historia dada.¿Cómo podemos saber qué historia el/la usuario/a quiere ver?

Los comentarios serán incluidos con los datos de la historia:

```ruby
# app/views/api/v1/stories/show.json.jbuilder
json.extract! @story #... the story data
json.comments @story.comments do |comment|
   #... the comment data
end
```

Si muestras la hora en la que se hizo el comentario, no olvides usar `strftime` para darle formato a la marca de tiempo (timestamp).

Aprovecha y actualiza la vista (`show.js`) de la app front-end para llamar la API y obtener datos dinámicos.

### 6 - Página Create de la Historia

Recuerda que para crear una historia en una API solo necesitamos una ruta. No necesitamos una ruta para mostrar el formulario de una nueva historia, solo una nueva ruta para manejar la petición `POST` generada cuando se envía el formulario.

Aprovecha y actualiza la vista  (`create.js`) de la app front-end para llamar a la API y enviar datos generados por el usuario.¿Cual es el verbo adecuado para crear datos? (GET, POST, PUT, o DELETE).


### 7 - Página Edit de la Historia

También podemos hacer que se pueda editar una historia para remover errores ortográficos luego de haber creado la historia.¿Y qué hay de refactorizar el formulario front-end `create.wxml` en un partial `form.wxml` para usarlo en `new.wxml` también?

¡No olvides actualizar el `show.wxml` y `show.js` con nuevo botón de edición!

### 8 - Funcionalidad para Borrar una Historia Function

Aprovechemos y agreguemos la posibilidad de eliminar una historia de nuestra app.¿Cómo podemos crear un botón para borrar un recurso y que acción y verbo se necesitan para el controlador?

Una vez más, actualiza la vista show para ponerla en el botón de eliminación.


### 9 - Adición de comentarios (Opcional)

Agrega un endpoint de API para crear comentarios desde el controlador de historias (almacenando dicha historia como a la que pertenece el comentario). También actualiza la página show con un botón para permitirle al/la usuario/a agregar un comentario con su nombre y foto mostrándose al lado del comentario. También podemos agregar una nueva página en el front-end para un formulario que usará este endpoint de creación de comentarios.

En cuanto a tus rutas, piensa en usar rutas anidadas para especificar la historia a la que el comentario pertenece.


### 10 - Filtro de historias (Opcional)

¡Intenta agregar una barra de búsqueda para poder filtrar historias en el index y poder encontrar la historia perfecta!

- ¿Cómo podemos encontrar la historia que el/la usuario/a busca?
- ¿Qué método Active Record podemos usar para crear un buscador simple? Esto te ayudará a empezar `@stories = Story.where("name LIKE '%garden%'")`. Asegúrate de que entiendes esta línea de código antes de dar un paso más.
- ¿Cómo podemos asegurarnos de que la página index todavía funciona, inclusive cuando el/la usuario/a no está buscando nada?
- ¿Cómo podemos asegurarnos de que la entrada se complete parcialmente en la consulta de búsqueda cuando el/la usuario/a la esté haciendo?
