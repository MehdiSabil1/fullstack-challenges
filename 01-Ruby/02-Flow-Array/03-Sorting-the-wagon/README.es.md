## Contexto y Objetivos

La [clase `Array`](https://ruby-doc.org/3.3.5/Array.html) es una de las estructuras principales para resguardar y acceder a información en Ruby (la otra es [Hash](https://ruby-doc.org/3.3.5/Hash.html), la cual veremos mañana).

Un array se ordena de modo que se pueda acceder por su **index** (índice). Este ejercicio te ayudará a entender cómo crear un array, como guardar datos en él, y finalmente cómo recuperarlos usando el index. Recuerda que los índices de los arrays empiezan en `0`, y no `1`.

A menudo se les pide a los/as programadores/as que ordenen cosas. Por eso debes leer sobre [algoritmos de ordenamiento](http://en.wikipedia.org/wiki/Sorting_algorithm).

Esperemos que la documentación de Ruby te proporcione distintas maneras de ordenar un [Enumerable](http://ruby-doc.org/3.3.5/Enumerable.html). `Array` es una forma de `Enumerable`, así que puedes usar todos los métodos referenciados en la página de `Enumerable` en la documentación siempre y cuando uses un `Array`, porque `Array` **incluye** el módulo `Enumerable`.

## Especificaciones

- Implementa el método `wagon_sort` el cual toma un argumento, el array de nombres de estudiantes (los cuales son cadenas de caracteres `String`), y devuelve un array de los mismos nombres de estudiantes ordenados alfabéticamente.
- El método de ordenamiento debe ser sensible a mayúsculas y minúsculas e.g. escribe `bob` antes de `Felix` (revisa la [tabla ASCII](http://www.asciitable.com/)).
- El método debe mantener el deletreo original de los nombres.

### Método `wagon_sort`

El método `wagon_sort` debe tomar un array de nombres de estudiantes y devolver un nuevo array con los nombres ordenados alfabéticamente, ignorando mayúsculas y minúsculas. El array original debe permanecer sin cambios.

Por ejemplo, si pasas el array `["bob", "Felix", "Cedric"]` al método `wagon_sort`, debe devolver `["bob", "Cedric", "Felix"]`. Si pasas un array vacío, debe devolver un array vacío. Si pasas `["Alex", "Claire", "Toni"]`, debe devolver `["Alex", "Claire", "Toni"]`.

Tu trabajo es solo definir el método `wagon_sort` en el archivo `lib/wagon_sort.rb`. Pero si quieres probar tu método mientras trabajas, puedes intentar llamarlo en un array real como:

```ruby
wagon_sort(["bob", "Felix", "Cedric"])
# => ["bob", "Cedric", "Felix"]
```

No te preocupes por construir la interfaz todavía; eso vendrá más tarde. Por ahora, concéntrate en implementar el método `wagon_sort` correctamente.

### Programa interactivo

Ahora, construyamos un programa interactivo simple que use el método `wagon_sort`. El programa solicitará al usuario que ingrese nombres de estudiantes uno por uno, y cuando el usuario haya terminado, mostrará la lista ordenada de nombres.

Abre el archivo `interface.rb` y asegúrate de usar el método `wagon_sort`. La interfaz debe tener una output estilizada. Los nombres deben estar separados por comas (`, `) excepto los dos últimos que deben estar separados por la palabra `and`.

Debe funcionar de la siguiente manera:

```bash
ruby lib/interface.rb

Type a student name:
felix
Type another student name or press enter to finish:
Cedric
Type another student name or press enter to finish:
bob
Type another student name or press enter to finish:

Congratulations! Your Wagon has 3 students:
bob, Cedric and felix # Nota la separación adecuada de palabras.
```

💡 ¿Qué tipo de variable deberías usar para almacenar los nombres? ¿Debería ser un array, una cadena, un entero o algo más?

💡 ¿Cómo permitimos que el usuario ingrese datos? No olvides tus `gets` y `puts`.

💡 Cuando el usuario haya terminado de ingresar nombres, ¿cómo lo sabemos? Puedes verificar si la entrada está vacía (es decir, el usuario solo presionó enter sin escribir nada).

💡 ¿Cuándo queremos ordenar los nombres? Después de que el usuario haya terminado de ingresarlos, ¿verdad? Y tal vez ya lo hayas adivinado, pero has escrito algo de código que te ayudará a hacer eso 😉

💡 ¿Cómo mostramos los nombres? Puedes usar `puts` para imprimirlos, pero querrás formatearlos bien. Recuerda separar los nombres con comas y usar "and" para los dos últimos nombres.

## Puntos clave de aprendizaje

Familiarízate con las operaciones de array básicas. Ya debes conocer la sintaxis para:

- crear un array
- agregar un elemento al array
- acceder a un elemento n
- actualizar un elemento
- borrar un valor en un index específico.
