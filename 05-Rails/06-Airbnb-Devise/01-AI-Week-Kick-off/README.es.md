## Semana de IA - Inicio

Pasarás las próximas sesiones con tu Grupo de Proyecto trabajando en un Asistente de IA para un **Usuario** con un **Objetivo**. Por ejemplo, Wott es un Asistente de IA para **estudiantes aprendiendo a programar**. Querrás pensar en el "persona" de tu usuario principal ("estudiante aprendiendo a programar") y su objetivo ("Estoy atascado en un problema y quiero que la IA lo resuelva por mí"). Esto te ayudará a definir el alcance de tu aplicación.

Haz una lluvia de ideas con tu grupo y crea un ticket para validar tu idea con un profesor.

### Demos

¡Demostrarás tu trabajo (en producción, no demos en `localhost`!) durante las sesiones de **Inferencia multi-modal** y **Tools & Agents**. ¡Los plazos importan!

### Parte I

Trabaja en los siguientes pasos y valídalos con un profesor al inicio de la sesión antes de crear tu aplicación Rails y pasar a la Parte II. Ahorrarás mucho tiempo haciendo esto, confía en nosotros.

#### 1 - Historias de usuario

Duplica esta [hoja de cálculo](https://docs.google.com/spreadsheets/d/1Kh4r-r5ZDyaWSfJdvW1NQJEfqt-wO3ExFR9SVp29lpY/edit?gid=0#gid=0) (1 por equipo) e invita a tus compañeros de equipo a colaborar.

![duplicate](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/user-stories/duplicate.png)
![rename](https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/user-stories/rename.png)

Comienza pensando en los **recorridos del usuario** que mostrarás durante la demo. Hay muchos casos de uso posibles para un Asistente de IA, pero trata de reducirlos a los recorridos viables mínimos para resolver un problema específico.

<details><summary markdown='span'>Ver solución
</summary>

- 1 recorrido del usuario para navegar en los ejercicios (o el contexto de tu elección)
- 1 recorrido del usuario para agregar nuevos ejercicios
- 1 recorrido del usuario para editar o eliminar ejercicios que ha creado
- 1 recorrido del usuario para chatear con la IA sobre un ejercicio (o el contexto de tu elección)
</details>

Cada recorrido del usuario contiene varias **historias de usuario**: escríbelas en la hoja de cálculo usando la terminología correcta. Cuando termines, crea un ticket para validarlas con un profesor.

Puedes hacer bocetos rápidos con lápiz y papel de las diferentes pantallas y los elementos aproximados que contienen. Esto te ayudará a visualizar tus recorridos del usuario. ¡Ten cuidado, no necesitas ser demasiado específico en este punto! Esto es un sprint, necesitas asignar tu tiempo y recursos sabiamente.

<details><summary markdown='span'>Ver solución
</summary>
- Como visitante, puedo visitar la página de inicio para ver la propuesta de valor de la aplicación
- Como visitante, puedo ver la lista de ejercicios para navegar al ejercicio que me gustaría tomar
- Como visitante, puedo hacer clic en un ejercicio para ver sus detalles
- Como usuario, puedo mostrar un formulario para completar la información requerida para crear un nuevo ejercicio
- Como usuario, puedo enviar el formulario para crear el nuevo ejercicio
- Como usuario, puedo mostrar un formulario para editar un ejercicio que he creado
- Como usuario, puedo enviar el formulario para actualizar el ejercicio
- Como usuario, puedo eliminar un ejercicio que he creado
- Como usuario, puedo crear un chat con el Asistente de IA sobre un ejercicio
- Como usuario, puedo ver la lista de chats que creé con el Asistente de IA sobre un ejercicio
- Como usuario, puedo navegar a un chat que creé con el Asistente de IA sobre un ejercicio
- Como usuario, puedo enviar un mensaje al Asistente de IA en el contexto de un chat
- Como usuario, puedo enviar un mensaje con un archivo adjunto al Asistente de IA
- Como usuario, puedo enviar un mensaje de seguimiento al Asistente de IA
</details>

#### 2 - Esquema de base de datos

Dibuja tu esquema de base de datos usando [nuestra herramienta db](https://kitt.lewagon.com/db/new) y **crea un ticket para validarlo con un profesor**. Dibuja solo lo mínimo viable para que tu aplicación funcione. Usa las convenciones correctas (nombres en plural para las tablas... etc - cf. las clases de BD).

💡 Para armonizar la forma de almacenar las preguntas del usuario y las respuestas del asistente, puedes incluir la siguiente tabla, así como la tabla de usuarios para manejar los registros e inicios de sesión.

<details><summary markdown='span'>Ver solución
</summary>
  <img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/3h0por8ku29vrntndn0ci30fobb7" alt="Esquema de base de datos mostrando cuatro tablas: users, challenges, chats y messages, sus relaciones y columnas">
</details>

#### 3 - Rutas

Vuelve a tu hoja de cálculo de historias de usuario y agrega la siguiente información:
- Ruta: Verbo + Path
- Acción
- Controlador

Crea un ticket para validarlas con un profesor. ¿Todo bien? ¡Es hora del `rails new`!

### Parte II

Antes de dividir las tareas entre el equipo, configuren el proyecto juntos. El **desarrollador principal** (y solo él) debe:

#### 1. Crear el proyecto Rails con una configuración de Postgres

Usa la plantilla mínima de Le Wagon, que ya tiene una buena configuración de front-end:

```bash
cd ~/code/<user.github_nickname>
rails new \
  -d postgresql \
  -m https://raw.githubusercontent.com/lewagon/rails-templates/master/minimal.rb \
  CAMBIA_ESTO_POR_EL_NOMBRE_DE_TU_APP_RAILS
```

De nuevo, ¡solo el **desarrollador principal** hará esto! No todos en el equipo...

#### 2. Push del proyecto en Github

```bash
cd tu-nombre-de-app-rails
gh repo create --public --source=.
git push origin master
```

#### 3. Deploy en Heroku

Aunque sea solo una aplicación esqueleto, es importante hacer deploy en Heroku **desde el primer día**, y luego hacer deploy continuamente todos los días con cada nueva función.

```bash
heroku create ai-assistant-<user.lower_github_nickname> --region=REEMPLAZA_CON_REGION # (eu, us, o cualquier región disponible en la lista de `heroku regions`)
heroku config:set WEB_CONCURRENCY=1 # soluciona un error temporal de Heroku
heroku addons:create heroku-postgresql:essential-0 # agrega el add-on de PostgreSQL
git push heroku master
heroku run rails db:migrate
```

### 4. Tablero Kanban

Un [tablero Kanban](https://en.wikipedia.org/wiki/Kanban_board) es una herramienta ágil de gestión de proyectos diseñada para ayudar a visualizar el trabajo, seguir el progreso y maximizar la eficiencia (o flujo). Hay muchos recursos diferentes ([Trello](https://trello.com/), [Github Projects](https://github.com/features/project-management/), [Notion](https://www.notion.so/), por nombrar algunos).

Hemos preparado tres borradores para que comiences si eliges Trello, Github Projects o Notion, pero siéntete libre de usar otra herramienta si estás más familiarizado con ella:

1. Borrador de Trello - Haz una copia de [este tablero de Trello](https://trello.com/b/WB3fRTj2) (menú > más opciones > copiar tablero > nombre del tablero para tu proyecto). Luego agrega a todos los miembros del equipo al tablero y comienza a importar todas tus historias de usuario y tareas (ordenar por prioridad).

2. Borrador de Github Projects - Para configurar tu tablero kanban en Github, necesitarás tener el repositorio ya creado y tener todos los colaboradores agregados. Luego, un miembro del equipo puede usar [este tablero](https://github.com/orgs/lewagon/projects/117) como base para el tablero de tu proyecto. Sigue las instrucciones [aquí](https://docs.github.com/en/issues/planning-and-tracking-with-projects/creating-projects/copying-an-existing-project) para ver cómo copiar y agregar el tablero al repositorio de tu propio proyecto. Dos cosas a tener en cuenta: Github no copia las tarjetas del tablero original, así que tendrás que agregarlas tú mismo. Siéntete libre de copiar/pegar las tarjetas para comenzar, o simplemente comienza desde cero. Segundo, Github usa sintaxis markdown para formato de texto como encabezados, estilo de fuente y casillas de verificación. No es obligatorio, pero puede ser bueno agregar formato a tus tarjetas. Puedes leer más sobre esto [aquí](https://guides.github.com/features/mastering-markdown/).

3. Borrador de Notion - Haz una copia de [esta página de Notion](https://www.notion.com/lewagon/Project-Weeks-a3961a7da7324637bea441832becb3ad) seleccionando la opción `Duplicate` en la barra de navegación. Luego agrega a todos los miembros del equipo al tablero (haciendo clic en `Share` y luego invitándolos por correo electrónico) y comienza a importar todas tus historias de usuario y tareas, ordenando por prioridad. La sección superior derecha de la página debe albergar todos los enlaces relevantes de tu aplicación. Los que están allí deben usarse como guía para los que necesitarás incluir, pero desafortunadamente no puedes editarlos, así que tendrás que recrearlos tú mismo con los enlaces correctos. Sigue [esta guía](https://www.notion.com/help/embed-and-connect-other-apps#web-bookmarks) para agregar correctamente los `Web bookmarks`. Si eres nuevo en Notion, siéntete libre de consultar [esta página](https://www.notion.com/help/start-here) para aprender más y convertirte en un experto en Notion en poco tiempo 💯

Desde este punto pueden comenzar a dividir las tareas. **Dedica tiempo a la configuración, porque todo será más simple si lo haces correctamente al principio**.

### Algunas pautas para la gestión de proyectos

#### Inicio

Ahora, pongamos al equipo a trabajar en el proyecto. El desarrollador principal ya ha creado la aplicación Rails, la ha subido a Github y la ha desplegado en Heroku.

#### Agrega a tus compañeros de equipo como colaboradores en el repo de Github

Ve a la configuración de tu repo de Github (`https://github.com/<user.github_nickname>/rails-airbnb-clone/settings/collaboration`) y agrega a tus compañeros de equipo como **colaboradores**.

Los otros compañeros de equipo ahora pueden **clonar** el proyecto:

```bash
gh repo clone <owner-github-nickname>/<rails-app-name>
```

Luego navega al directorio y ejecuta:

```bash
cd <rails-app-name>
rails db:create db:migrate
bundle install
```

Ahora pueden dividir su equipo en dos grupos para comenzar a programar en pareja en algunas características principales de tu aplicación. Esta es una buena manera de comenzar y asegurarse de que todos están en la misma página.

Esta es una oportunidad para aprender sobre [Programación en pareja](https://es.wikipedia.org/wiki/Programaci%C3%B3n_en_pareja):

> La programación en pareja es una técnica de desarrollo de software en la que dos programadores trabajan juntos en una estación de trabajo. Uno, el conductor, escribe código mientras que el otro, el observador o navegador, revisa cada línea de código a medida que se escribe. Los dos programadores intercambian roles con frecuencia.

Aquí hay 3 ámbitos en los que pueden empezar a trabajar:

**Ámbito 1: Configuración de Devise**:
- Configura Devise y genera el modelo `User` con devise. ¡Asegúrate de usar `rails g devise User` (no `rails g model`)!
- Repasa la clase de la mañana para agregar la barra de navegación, las páginas de registro e inicio de sesión (envueltas en cols de Bootstrap), y configura los filtros apropiados de `before_action` y `skip_before_action`.

**Ámbito 2: Inicio de front-end**:
- Construye una página de inicio simple y atractiva con un container de Bootstrap, contenido centrado y una propuesta de valor clara.

**Ámbito 3: Generación de modelos**:
- _Nota: ¡Devise debe estar configurado primero! (Ámbito 1)_
- Generar los otros tres modelos te permitirá dividir el trabajo más fácilmente después de la clase de **Programando en equipo**.

**(Opcional) Ámbito 4: Acciones Read del modelo principal**:
¡Felicitaciones si llegas a este paso! Comencemos a programar las siguientes historias de usuario en el modelo principal de tu proyecto (reemplazando "ejercicios" con el tuyo):
- Como visitante, puedo ver una lista de ejercicios para navegar al ejercicio que quiero explorar.
- Como visitante, puedo hacer clic en un ejercicio para ver sus detalles

Para cada ámbito en el que trabajes, no olvides:

```bash
git checkout -b <feature-name>
```

Y luego abrir un pull request en Github cuando hayas terminado.

No olvides hacer deploy de tu trabajo en Heroku continuamente, y compartir tu URL de producción en Slack antes de irte.

#### Organización de tareas

En las ~10 historias de usuario listadas en la hoja de cálculo, **algunas de estas características son más importantes que otras**. ¡Es tu rol priorizarlas para obtener un MVP al final de la semana!

#### Código en silo, del modelo a la vista

Cuando trabajes en una función, trabájala **conscientemente desde la base de datos hasta el HTML/CSS**. Tomemos el ejemplo de crear un ejercicio:

*Modelo*
- Generaré un modelo `Challenge` y su migración asociada.
- Luego escribiré un modelo funcional con asociaciones y validaciones.
- Luego probaré mi modelo desde la `rails console` para asegurarme de que todo en el modelo funciona.

*Enrutamiento*:
- Agregaré las rutas new/create en `routes.rb`

*Controlador*:
- Agregaré dos acciones `new` y `create` en el `ChallengesController`

*Vistas*:
- Programaré el formulario del ejercicio en `views/challenges/new.html.erb`
- La acción create redirige a la vista `show`, con un aviso de confirmación

*Enlaces*:
- Agregaré un enlace para crear un ejercicio en la barra de navegación.

*HTML/CSS*:
- Mis formularios están limpios con las clases correctas de Bootstrap para los inputs y botones.
- Mi página de nuevo ejercicio está limpia con un `container` para centrar el contenido, encabezados claros y un diseño limpio para cada reserva.
- Tomaré tiempo para refactorizar mi HTML usando parciales si mi código HTML es demasiado largo y difícil de leer.

**Prográmalo perfectamente, del modelo a la vista**

- Prueba todas las asociaciones y validaciones de tu modelo en la rails console.
- No descuides la vista. Si agregas un formulario, hazlo un formulario Bootstrap bonito, centrado y responsive. Si programas una lista de apartamentos, construye una bonita cuadrícula Bootstrap (por ejemplo, con la imagen del apartamento a la izquierda y la información del apartamento a la derecha..).
- Usa parciales para refactorizar tu HTML y hacerlo más legible y mantenible.
