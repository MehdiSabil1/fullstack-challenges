## Contexto y Objetivos

¿Sabes qué es el estribillo de una canción? Es la parte que se repite, a menudo con las mismas letras. Por ejemplo, en la canción "Hey Ya!" de OutKast, el estribillo es:

> "Hey ya! Hey ya! Hey ya! Hey ya!" 📢

Echa un vistazo al método `#refrain` en `lib/refrain.rb`. "Canta" el estribillo de una canción: toma una letra y parámetros opcionales para controlar cuántas veces repetirla, cuánto vibrato añadir y si cantarla con fuerza.

El problema es que esos parámetros opcionales son **dependientes del orden**: para que `strong` sea `true`, tienes que pasar valores para `number_of_times` y `vibrato` primero, aunque no te importen:

```ruby
refrain("hey ya", 1, 0, true)  # tuve que poner 1 y 0 solo para llegar a strong
```

Si el orden es incorrecto, obtendrás un comportamiento inesperado. Esto es la **dependencia de orden** y es una fuente común de bugs.

La solución es reemplazar los argumentos opcionales por un único hash `options`. Así, quien llame al método solo pasa las opciones que le interesan, por nombre, en cualquier orden:

```ruby
better_refrain("hey ya", strong: true)
better_refrain("hey ya", number_of_times: 4, vibrato: 10, strong: true)
```

Nota que el argumento `lyrics` es **obligatorio**, por lo que sigue siendo el primero y no forma parte del hash `options`.

## Especificaciones

`#refrain` ya está implementado para ti. Tu tarea es crear una nueva versión:

- Implementa `#better_refrain` en `lib/refrain.rb` para que produzca el mismo resultado que `#refrain`, pero aceptando sus parámetros opcionales como un hash en lugar de argumentos posicionales.

## Puntos clave de aprendizaje

- ¿Realmente entiendes por qué `#better_refrain` es una implementación más flexible? Trata de explicárselo a tu compañero/a.
