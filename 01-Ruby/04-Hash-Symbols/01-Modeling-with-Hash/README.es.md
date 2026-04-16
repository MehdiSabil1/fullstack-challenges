## Antes de comenzar

No olvides que a las 2 p.m. tendrás tu primer quiz. Sin computadora. Sin Google. Solo lápiz y papel. No es un examen y no será evaluado con una nota así que no te preocupes por eso 😊, pero será útil identificar los puntos donde tienes dificultades y trabajarlos antes de ir más lejos. Solo tómate el tiempo necesario para responder todo con la mayor precisión posible.

Cuando el quiz termine, los/as profesores/as se tomarán 15 minutos con cada uno/a de ustedes para revisar las respuestas y explicar lo que sea necesario. Esta conversación te ayudará a identificar qué es lo que debes estudiar nuevamente durante el fin de semana y si deberás formar parte del equipo de Reboot el próximo lunes y martes.

¡Buena suerte! ¡Que lo disfrutes!

## Contexto y Objetivos

Digamos que quieres mantenerte en forma mientras aprendes a programar :)  Se te ocurre la excelente idea de escribir un método rápido que calcule el número de calorías de un pedido de restaurante. Usemos la tabla siguiente como nuestro menú resumido:

<table class="table">
  <thead>
    <tr>
      <th>Item</th>
      <th>Calories</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Hamburger</td>
      <td>250</td>
    </tr>
    <tr>
      <td>Cheese Burger</td>
      <td>300</td>
    </tr>
    <tr>
      <td>Veggie Burger</td>
      <td>540</td>
    </tr>
    <tr>
      <td>Vegan Burger</td>
      <td>350</td>
    </tr>
    <tr>
      <td>Sweet Potatoes</td>
      <td>230</td>
    </tr>
    <tr>
      <td>Salad</td>
      <td>15</td>
    </tr>
    <tr>
      <td>Iced Tea</td>
      <td>70</td>
    </tr>
    <tr>
      <td>Lemonade</td>
      <td>90</td>
    </tr>
  </tbody>
</table>

Guardarás estos datos del menú en una [constante](https://www.rubyguides.com/2017/07/ruby-constants/) Ruby. Una constante es como una variable, pero está pensada para contener datos que no cambiarán. Por convención, los nombres de las constantes se escriben en `MAYÚSCULAS`.

El siguiente es un ejemplo de una constante que contiene un `Hash` de estudiantes y sus edades:

```ruby
AGE_OF_STUDENTS = {
  "Laura" => 23,
  "Peter" => 20,
  "Mary" => 27
}
```

Luego podrías obtener un valor por su llave:

```ruby
AGE_OF_STUDENTS["Laura"]  # => 23
```

Tu constante contendrá el menú anterior como un `Hash`, con los nombres de los platos como llaves y los conteos de calorías como valores. Tu método buscará cada plato en esa constante para calcular el total.

Lee la documentación sobre [Hashes](https://ruby-doc.org/3.3.5/Hash.html). Lo usarás todo el tiempo así que hazte amigo de ellos 😊.

**Para este ejercicio, usa `Strings` para tus llaves (keys) en vez de `Symbols`, por cuestiones de simplicidad**

## Especificaciones

- Define una constante `MENU` que almacene el menú anterior como un `Hash`.
- Define un método `#poor_calories_counter` que tome tres nombres de platos como argumentos y devuelva el número total de calorías de esos tres platos, **buscándolos en tu constante `MENU`**.

Por ejemplo, `poor_calories_counter("Cheese Burger", "Sweet Potatoes", "Iced Tea")` debe devolver `600`.

## Puntos clave de aprendizaje

- ¿Qué es un hash? ¿Cuándo lo usas?
- ¿Cómo recuperas el valor almacenado en un `Hash`?
