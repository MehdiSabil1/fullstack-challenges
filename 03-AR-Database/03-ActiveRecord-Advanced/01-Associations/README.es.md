## Contexto y Objetivos

Continuemos con nuestra aplicación clon de Hacker News. Hoy queremos agregar la funcionalidad de usuario para que la gente tenga que iniciar sesión antes de subir un post.

(Sin embargo, no tendrán que iniciar sesión para leerlos).

## Configuración

Te hemos dado la primera migración para crear la tabla `posts`.

```bash
rake db:create
rake db:migrate
```

## Especificaciones

### Agregar un modelo de usuario (`User`)

También te damos un esquema básico de posts (ve la migración actual en la carpeta `db/migrate`).

Primero genera la nueva migración para crear el modelo del usuario (`User`). Dicho modelo debe tener los siguientes campos:

- `username`
- `email`

### Migración: un usuario (User) tiene muchos (has many) posts

Ahora necesitas vincular los posts a los usuarios. Genera una nueva migración para agregar una clave foránea `user_id` a la tabla `posts` existente (pista: estás actualizando una tabla existente, no creando una nueva desde cero. Vuelve a revisar la sección "Adding a foreign key" del curso de hoy).

Luego actualiza los dos archivos de modelos para declarar la asociación, de modo que puedas llamar a `user.posts` y `post.user`.

### Seed con usuario y posts

Escribe el código del seed para poblar tu base de datos con 5 usuarios (users) quienes tienen entre 5 y 10 posts cada uno. Siéntete libre de usar cualquier estrategia que quieras, ya sea Faker o API.

No dediques mucho tiempo tratando de usar una API. Recuerda que nuestro objetivo en este ejercicio es practicar las asociaciones.
