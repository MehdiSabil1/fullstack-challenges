Asegurate de ejecutar lo comandos anteriores 👆

**IMPORTANTE** 👇

Copia el código de ayer:

```bash
cp -r ../../04-Food-Delivery-Day-One/01-Food-Delivery/{app,data,app.rb,router.rb} . # trailing dot is important
```

Luego, comprueba que todo todavía funciona antes de empezar iniciando tu aplicación:

```bash
ruby app.rb
```

Entonces, finalmente, puedes ejecutar:

```bash
rake
```

Ahora continúa con tu propio código y sigue agregando funcionalidades al router y haciendo que el `rake` siga saliendo verde.

¡Agreguemos más funcionalidades a nuestro programa de Entrega a Domicilio (Food Delivery)!

Aquí están todas la **acciones de usuario** de nuestra aplicación:
[] Como empleado, puedo iniciar sesión
[X] Como gerente, puedo agregar un nuevo plato
[X] Como gerente, puedo listar todos los platos
[X] Como gerente, puedo agregar un nuevo cliente
[X] Como gerente, puedo listar todos los clientes
[ ] Como gerente, puedo agregar un nuevo pedido
[ ] Como gerente, puedo listar de todos los pedidos no entregados
[ ] Como repartidor, puedo marcar uno de mis pedidos como entregado
[ ] Como repartidor, puedo mostrar la lista de todos mis pedidos no entregados

Por lo tanto, hay dos nuevos componentes:
- **Employees**: empleados
- **Orders**: pedidos

## Cómo vamos a construir esto

Mismo enfoque de dos fases que ayer:

1. **Primero la capa de datos** — modelo y repositorio de empleados, luego modelo y repositorio de pedidos. Usa `rake` para verificar cada parte.
2. **Luego las funcionalidades** — construye cada funcionalidad de una en una y testeala corriendo la aplicación.

También añadiremos una funcionalidad de login, que se comporta de manera un poco diferente de las demás, ya que tienes que estar logueado antes de poder hacer cualquier otra cosa.

## 1 - `Employee`

### 1.1 - Modelo de `Employee`

Comencemos con la capa de datos para los empleados.

Nuestro restaurante tiene dos tipos de empleados: **gerentes** y **repartidores**. Ambos tienen número de identificación `id`, usuario (`username`) y contraseña (`password`). Sin embargo, tienen privilegios diferentes dependiendo de sus roles (`role`).

Escribe el código para implementar esto y haz el crash test del modelo. Luego testea tu código corriendo `rake employee`.

¿Todo en verde? ¡Qué bueno! Es hora de hacer `git add`, `commit` y `push`.

### 1.2 - Repositorio de `Employee`

Ahora que tenemos un modelo que representa a nuestros empleados, necesitamos un repositorio para almacenarlos.

Este repositorio se inicializa con una ruta de archivo CSV. Tiene una lógica de **solo lectura** ya que solo el administrador de nuestra aplicación puede crear cuentas (no es necesario crear un método `add`). La interfaz de este repositorio permite lo siguiente:
- Recuperar a todos los repartidores del repositorio (`all_riders`)
- Encontrar a un empleado específico gracias a su número de identificación (`find`)
- Encontrar a un empleado específico gracias a su usuario (`find_by_username`)

Escribe el código para implementar esto y haz el crash test de tu repositorio en irb. Debes crear tu propio archivo CSV `employees.csv` dentro de la carpeta `data`. Luego testea tu código corriendo `rake employee`.

¿Todo en verde? ¡Qué bueno! Es hora de hacer `git add`, `commit` y `push`.

### 1.3 - Controlador de `Session`

Implementemos una lógica de **login** en nuestra aplicación.

Queremos tener dos menús en el router: uno que muestre la lista de tareas para los gerentes y otra que muestre las de los repartidores. También queremos direccionar la selección del empleado a la acción en el controlador correspondiente.

Para ello introduciremos la noción de una **session**. A nivel del ruteador, almacenaremos al usuario logueado en una sesión.

La secuencia de inicio de sesión debe ser de la siguiente manera:

```bash
> username?
paul
> password?
blablabla
Wrong credentials... Try again!
> username?
paul
> password?
secret
Welcome Paul!
```

Después de haber iniciado sesión, verás un tablero de comando **de acuerdo a tu rol en la empresa**.

Escribe el código para implementar este comportamiento.

No hay rake para esta parte del ejercicio. Corre tu aplicación ejecutando el siguiente comando en la Terminal:

```bash
ruby app.rb
```

¿Todo está funcionando bien? ¡Qué bueno! Es hora de hacer `git add`, `commit` y `push`.

## 2 - `Order`

### 2.1 - Modelo de `Order`

De vuelta a la capa de datos, esta vez para los pedidos.

Nuestro restaurante toma pedidos, así que tenemos que representar lo que es un pedido.

El pedido es lo que une a todos los elementos. Cada pedido tiene un número de identificación (id), un plato (Meal), un cliente (Customer), un empleado (Employee) y un booleano `delivered` para registrar si ha sido entregado.

Escribe el código para implementar esto y haz el crash test del modelo en `irb`. Luego testea tu código corriendo `rake order`.

¿Todo en verde? ¡Qué bueno! Es hora de hacer `git add`, `commit` y `push`.

### 2.2 - Repositorio de `Order`

Ahora que ya tenemos un modelo que representa a nuestros pedidos, tenemos la necesidad de un repositorio para almacenarlos.

Este repositorio se inicializa con una ruta de archivo CSV, lee/escribe los pedidos del archivo CSV y los almacena en memoria. La interfaz del repositorio permite lo siguiente:
- Agregar un nuevo pedido
- Listar todos los pedidos no entregados

Ya que nuestro pedido tiene las **instancias** `meal`, `customer` y `employee`, también tenemos que inicializar nuestro repositorio de pedidos (orders) con el repositorio de los platos (meals), el repositorio de los clientes (customers) y el repositorio de los empleados (employees).

Escribe el código para implementar esto y haz el crash test del repositorio en `irb`. Tienes que crear tu propio archivo  CSV `orders.csv` dentro de la carpeta `data`. Luego testea tu código corriendo `rake order`.

**Importante**: los tests de `order_repository` que corre `rake` **solo funcionan si defines los parámetros en `#initialize` en el mismo orden que el que está en los tests**:

```ruby
class OrderRepository
  def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    # [...]
  end

  # [...]
end
```

A su vez, asegurate que tu CSV de Orders guarde la informacion utilizando los siguientes headers, dado que serán necesarios para pasar los tests:
`id, delivered, meal_id, customer_id, employee_id`


¿Todo en verde? ¡Qué bueno! Es hora de hacer `git add`, `commit` y `push`.

### 2.3 Funcionalidades de `Order`

Ahora vayamos al `OrdersController`. Las siguientes son las **acciones de usuario** que queremos implementar:
- Como gerente, puedo agregar un pedido (`add`) *(pista: los pedidos solo son asignados a repartidores)*
- Como gerente, puedo mostrar la lista de todos los pedidos que no han sido entregados (`list_undelivered_orders`)
- Como repartidor, puedo mostrar la lista de todos mis pedidos no entregados (`list_my_orders`)
- Como repartidor, puedo marcar uno de mis pedidos como entregado (`mark_as_delivered`)

⚠️ **Codea en silo** — implementa una acción a la vez y testeala corriendo tu aplicación antes de pasar a la siguiente.

¡Recuerda que el rol del controlador es delegar el trabajo a los otros componentes de nuestra aplicación (modelo, repositorio y vistas)!

Comienza escribiendo el **pseudocódigo** separando cada acción de usuario en pasos básicos y delegando cada uno de ellos a un componente (modelo, repositorio, vista). Luego escribe el código correspondiente para cada paso. Crea la vista y escribe su código paso por paso.

Para testear el controlador, conectalo a tu aplicación instanciandolo en `app.rb` y pasándoselo al ruteador. Luego haz el crash test del código corriendo tu aplicación:

```bash
ruby app.rb
```

`rake order` también te debería ser de utilidad en estos pasos. ¡Sigue la guía!

Asegurate que cada una de las cuatro acciones de usuario para pedidos funcione bien antes de trabajar en la siguiente funcionalidad.

**Importante**: los tests de `orders_controller` que corre `rake` **solo funcionan si defines los parámetros en `#initialize` en el mismo orden que el que está en los tests**:

```ruby
class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    # [...]
  end

  # [...]
end
```

**Atención** ⚠️ Dado que los **ids** no empiezan necesariamente por 1 y no son necesariamente continuos, es una **mala práctica pedir a un usuario un id**.

Imaginemos que tenemos 3 meals, con id `1234`, `4242` y `987654`. **No** los queremos mostrar:

```bash
1234 - pizza
4242 - burger
987654 - salad

Please choose an id:
>
```

Pero queremos utilizar **índices** para mejorar la experiencia del usuario:

```bash
1 - pizza
2 - burger
3 - salad

Please choose an index:
>
```

¿Todo en verde? ¡Qué bueno! Es hora de hacer `git add`, `commit` y `push`.

## 3 - Opcionales

### 3.1 - Implementa las acciones `edit` y `destroy` para los pedidos.

Por ahora en nuestra aplicación los gerentes aún no pueden editar o borrar pedidos actuales.

Implementa las siguientes acciones de usuarios adicionales:
- Como gerente, puedo editar un pedido actual
- Como gerente, puedo borrar un pedido actual

¿Listo? ¡Qué bueno! Es hora de hacer `git add`, `commit` y `push`.

### 3.2 Oculta la contraseña del/de la usuario/a

Por ahora, la contraseña se guarda directamente en el CSV y es cualquier persona la puede ver ¿Crees que esto es buena idea? ¿Cómo podemos cambiar esto?

¿Listo? ¡Qué bueno! Es hora de hacer `git add`, `commit` y `push`.

¡Has terminado el Food Delivery!
