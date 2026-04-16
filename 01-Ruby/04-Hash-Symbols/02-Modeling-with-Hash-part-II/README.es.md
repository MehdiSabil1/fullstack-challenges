## Contexto y Objetivos

Ahora digamos que quieres mejorar tu contador de calorías para que acepte una lista de bebidas, hamburguesas, acompañamientos **y PLATOS**. Agreguemos los siguientes 3 platos al menú:

<table class="table">
  <thead>
    <tr>
      <th>Meal</th>
      <th>Items in Meal</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Cheesy Combo</td>
      <td>Cheese Burger, Sweet Potatoes, Lemonade</td>
    </tr>
    <tr>
      <td>Veggie Combo</td>
      <td>Veggie Burger, Sweet Potatoes, Iced Tea</td>
    </tr>
    <tr>
      <td>Vegan Combo</td>
      <td>Vegan Burger, Salad, Lemonade</td>
    </tr>
  </tbody>
</table>

## Especificaciones

Guarda estas comidas en una segunda constante. Para una comida como el "Cheesy Combo", querrías saber que está compuesto por "Cheese Burger", "Sweet Potatoes" y "Lemonade". Entonces, tu objetivo es poder ir desde el nombre de una comida hasta los tres ítems del menú que la componen. Luego puedes usar cada uno de esos ítems para calcular el total de calorías. ¿Qué estructura de datos usarías para describir las comidas en una constante `MEALS`?

Creemos un `#calories_counter` completo que nos permitirá calcular las calorías al correr siguiente código:

```ruby
orders = ["Sweet Potatoes", "Cheesy Combo", "Lemonade", "Vegan Combo"]
puts calories_counter(orders)
# => 1395
```

## Puntos clave de aprendizaje

- ¿Cómo recuperas el valor guardado en un `Array` dentro de un `Hash`?

Imagina que estamos construyendo una aplicación para un zoológico:
- ¿Qué estructura de datos usarías para guardar nombres de animales ordenados alfabéticamente?
- ¿Qué estructura de datos usarías para guardar nombres de animales y colores?

