## Antecedentes y objetivos

¡Bienvenido a tu primer ejercicio de Vue!

[Vue](https://vuejs.org/guide/introduction.html) (pronunciado /vjuː/, como **view**) es un framework de JavaScript para construir interfaces de usuario. Se basa en HTML, CSS y JavaScript estándar y proporciona un modelo de programación declarativo y basado en componentes que te ayuda a desarrollar interfaces de usuario de manera eficiente, ya sean simples o complejas.

Aprenderás los conceptos básicos de Vue construyendo una aplicación de lista de tareas, con la que podrás hacer lo siguiente:

- Ver todos tus elementos de la lista de tareas
- Agregar un elemento de la lista de tareas (opcional)
- Eliminar un elemento de la lista de tareas (opcional)

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/frontend/to-do-list-vue-user-flow.gif)

### Configuración

#### Vue

Importamos Vue usando Import Maps. Asegúrate de tener el siguiente código en tu HTML y JS.

```html
<!-- index.html -->
<head>
  <script type="importmap">
    {
      "imports": {
        "vue": "https://unpkg.com/vue@3/dist/vue.esm-browser.js"
      }
    }
  </script>
</head>
```

```js
// lib/to-do-list.js
import { createApp } from "vue";
// ...
```

Lanza un servidor web local ejecutando el siguiente comando:

```bash
serve
```

Luego, abre [`localhost:8000`](http://localhost:8000) en tu navegador. Si ves un mensaje sobre Vue, ¡eso significa que tu proyecto está configurado con Vue!

#### Resaltador de sintaxis de Vue para VSCode

Instalemos el resaltador de sintaxis de Vue para que nuestro código se vea mejor 💅

```bash
code --install-extension Vue.volar
```

## La aplicación de lista de tareas

### Calentamiento de Vue

Echa un vistazo al archivo `lib/to-do-list.js`.

```js
createApp({
  data() {
    return {
      message:
        "Si ves este mensaje en tu navegador, ¡significa que Vue está montado correctamente! 🙌",
    };
  },
}).mount("#todosContainer");
```

Ya se ha creado una instancia de Vue con la función `createApp()`. Codificarás tu componente dentro de `createApp()`.

Se llama `.mount("#todosContainer")` en la instancia de Vue. Significa que esta instancia de Vue se montará en el elemento HTML que tiene el selector CSS `#todosContainer`.

[`data`](https://vuejs.org/api/options-state.html#data) es una opción del componente. Devuelve un objeto JavaScript plano. Las propiedades, como `message`, están disponibles en HTML mediante `{{}}`.

```html
<div id="app">{{message}}</div>
```

### 1. Ver todos los elementos de la lista de tareas

#### Datos

<details>
<summary markdown='span'>En una instancia de Vue, ¿dónde colocamos los datos de los elementos de la lista de tareas?</summary>

Tienes los elementos de la lista de tareas en un arreglo.

```js
[
  { title: "Codificar una lista de tareas", done: false },
  { title: "Desayunar", done: true },
  { title: "Hacer ejercicio", done: false },
  { title: "Regar las plantas", done: true },
];
```

Podemos colocar esta lista en la opción `data` como datos iniciales y asignarla a una propiedad significativa, como `todos` o `items`. Es importante dar un nombre significativo a las cosas, para que tu código sea legible para tu futuro yo y otras personas.

```js
createApp({
  data() {
    return {
      todos: [
        { title: "Codificar una lista de tareas", done: false },
        { title: "Desayunar", done: true },
        { title: "Hacer ejercicio", done: false },
        { title: "Regar las plantas", done: true },
      ],
    };
  },
}).mount("#todosContainer");
```

</details>

#### Representación de lista

<details>
<summary markdown='span'>¿Cómo renderizamos dinámicamente la lista?</summary>

Podemos usar una directiva incorporada [`v-for`](https://vuejs.org/api/built-in-directives.html#v-for). Es similar a `.each` en Ruby. Lee la documentación y escribe tu código en `index.html` para renderizar tu lista de tareas basada en `todos`.

ℹ️ Ya has codificado una lista de tareas en el primer ejercicio, así que siéntete libre de reutilizar parte del HTML que escribiste anteriormente.

</details>

#### Vinculación de atributos

<details>
<summary markdown='span'>¿Cómo vinculamos `done` con la casilla de verificación?</summary>

Podemos usar [`v-bind`](https://vuejs.org/api/built-in-directives.html#v-bind) para renderizar dinámicamente los atributos HTML. En el caso de la casilla de verificación, podemos hacer lo siguiente:

```html
<input type="checkbox" v-bind:checked="theDoneBooleanGoesHere" />
```

Por ejemplo, si tuvieras datos como estos:
```javascript
data() {
  return {
    username: "alice"
  }
}
```

Podrías vincularlos al valor de un campo de texto:
```html
<input type="text" v-bind:value="username">
```

De manera similar, para una casilla de verificación, vinculas a `checked` con un valor booleano. ¡Ahora piensa en cómo acceder al valor booleano para cada elemento de tu lista de tareas!

</details>

#### v-cloak 🧥

<details>
<summary markdown='span'>¿Notaste que cada vez que actualizas la página hay un destello de elementos HTML no cargados?</summary>

![](https://raw.githubusercontent.com/lewagon/fullstack-images/master/frontend/vue-un-compiled-flash.gif)

Eso se debe a que el HTML aún no se ha compilado cuando actualizamos. Podemos usar `v-cloak` para ocultar temporalmente el HTML no compilado. Lee [la documentación](https://vuejs.org/api/built-in-directives.html#v-cloak) e implementa esto en tu aplicación. Recuerda hacer una **recarga completa** cuando cambies el archivo CSS.

¡Eso es todo! ¡Felicidades por tu primer aplicación de Vue! 🥂 ¡Continúa con las opciones para intentar implementar las acciones **Crear** y **Eliminar**!

</details>

### 2. Agregar una tarea (opcional)

Primero, deberías agregar un nuevo botón que diga "Agregar Tarea". Puedes usar clases de Bootstrap para esto y darle estilo como desees.

<details>
<summary markdown='span'>¿Qué sucede cuando un usuario agrega una tarea?</summary>

1. El usuario completa el título de la tarea
2. El usuario hace clic en un botón
3. La tarea se agrega y aparece en la lista.

Cuando se hace clic en el botón, la instancia de Vue debe encargarse de obtener los datos y agregarlos a la lista. Crearemos un [método](https://vuejs.org/api/options-state.html#methods) llamado `addTodo()` para encargarse de todo esto.

Los métodos se definen en la opción `methods`:

```js
createApp({
  data() {
    // ...
  },
  methods: {
    addTodo() {
      console.log("Agregando una tarea...");
    },
  },
}).mount("#todosContainer");
```

</details>

#### Vinculación de eventos

`addTodo()` debe activarse cuando se hace clic en el botón de agregar.

<details>
<summary markdown='span'>¿Cómo podemos vincular el evento de clic al botón?</summary>

Podemos usar [`v-on`](https://vuejs.org/api/built-in-directives.html#v-on) para escuchar el evento de clic.

```html
<button v-on:click="addTodo">Agregar</button>
```

Verifica en la consola de tu navegador, ¿puedes ver el `console.log` que agregaste en tu método? Si es así, ¡entonces tu vinculación de eventos es exitosa!

</details>

#### Vinculación de entrada del formulario

<details>
<summary markdown='span'>Ahora, ¿cómo pasamos los datos de entrada a la instancia de Vue?</summary>

Podemose usar [`v-model`](https://vuejs.org/guide/essentials/forms.html#form-input-bindings). Es parecido a `v-bind`. `v-bind` crea una vinculación en una dirección - de la instancia Vue al HTML. `v-model` vincula en dos direcciones. Se usa mucho en los formularios, porque necesitamos sincronizar el estado de un `<input>` con el estado correspondiente en JavaScript.

Para usar `v-model`, tenemos que haber declarado una propiedad de `data()`.

```js
data() {
  return {
    // ...
    newTodo: null
  }
},
```

</details>

Nota que cada propiedad en `data()` se puede accesar con `this.propertyName`. Ahora puedes usar la entrada del usuario con `this.newTodo` en la instancia Vue. Pruébalo.

##### Pseudo-código para addTodo()

1. Construye un objeto de tarea basado en la entrada del usuario.
2. Agrégalo a la lista `todos`.

Algo genial acerca de Vue es su [**reactividad**](https://vuejs.org/guide/extras/reactivity-in-depth.html). `data()` es reactivo, lo que significa que los cambios en `data()` desencadenan una actualización en el DOM. Observa cómo al cambiar `this.todos`, se actualiza automáticamente el DOM.

También puedes notar que después de agregar una tarea, la entrada del usuario permanece en el campo de texto. Considerando que la vinculación de `v-model` es bidireccional, ¿cómo restablecerías la entrada?

</details>

### 3. Eliminar una tarea (Opcional)

Primero, asegúrate de agregar un botón de eliminar al elemento de la tarea. Puedes utilizar el [botón de cierre de Bootstrap](https://getbootstrap.com/docs/5.0/components/close-button/) o el [ícono de basura de Font Awesome](https://fontawesome.com/search?q=trash&o=r).

El resto es muy similar a la adición de una tarea. Aprovecha [la documentación de Vue](https://vuejs.org/guide/introduction.html) para implementar los siguientes pasos:

1. Vincula un evento al botón de eliminar que active un método.
2. El método elimina la tarea de `todos`.

<details>
<summary markdown='span'>Pregunta y Pista</summary>

❓ ¿Cómo sabe este método qué tarea eliminar?
❓ ¿Cuál es el identificador único de cada tarea? Puedes usar esto para identificar qué tarea eliminar.

💡 Puedes pasar un argumento a un método.
💡 Tienes acceso al índice en `v-for`.

</details>

¡Buena suerte!
