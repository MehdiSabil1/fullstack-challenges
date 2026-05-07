## Contexto y Objetivos

### Para discutir con tus compañeros/as

- ¿Qué es un Hash? ¿En qué se diferencia de un Array?
- ¿Cómo se almacenan y recuperan datos en un Hash?
- ¿Qué ocurre cuando accedes a una clave que no existe?

### Resumen técnico

Un **Hash** es una colección de pares clave-valor. A diferencia de un Array, que usa índices enteros, un Hash te permite buscar datos usando una clave significativa.

Aquí hay un ejemplo:

```ruby
person = { "name" => "Alice", "age" => 30, "city" => "Paris" }
```

Puedes acceder a un valor a través de su clave:

```ruby
person["name"]  # => "Alice"
person["age"]   # => 30
```

Si una clave no existe, Ruby devuelve `nil`:

```ruby
person["missing"]  # => nil
```

También puedes agregar o actualizar pares clave-valor de la misma manera:

```ruby
person["job"] = "Developer"
```

Lee la documentación sobre [Hashes](https://ruby-doc.org/3.3.5/Hash.html) — ¡los usarás constantemente!

## Especificaciones

Abre el archivo `lib/hashes.rb`. Verás un quiz de verdadero/falso y algunos métodos para evaluar tu comprensión de los Hashes.

## Puntos clave de aprendizaje

- ¿Cómo lees un valor de un Hash?
- ¿Qué devuelve Ruby cuando accedes a una clave que no existe?
- ¿Cómo añades un nuevo par clave-valor a un Hash?
- ¿Cómo actualizas un valor existente en un Hash?
- ¿Cómo eliminas una clave de un Hash?
