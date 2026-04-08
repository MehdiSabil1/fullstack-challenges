## Semana de IA - Sigue construyendo

En este punto, ya deberías tener una aplicación Rails básica desplegada en Heroku, con un modelo principal. Si este no es el caso, por favor crea un ticket.

#### Crear una nueva rama para tu función

Recuerda que quieres trabajar construyendo historias de usuario 💡 No tendrás mucho éxito si intentas que un compañero construya los controladores y otro construya las vistas por separado 😠 Por lo general, construir una historia de usuario hasta completarla requerirá una ruta, una acción de controlador y una vista. Entonces, es hora de mirar las historias de usuario listadas en tu hoja de cálculo, determinar cuáles quieres construir primero, y luego distribuirlas entre tus compañeros de equipo para comenzar a programar:

```bash
git checkout -b <feature-name>
code .
```

> [!WARNING]
> A partir de ahora no deberías hacer commit en `master`.

Una vez que tu equipo haya generado los archivos del modelo, todos deberían poder comenzar a construir sus funciones. Los ámbitos a continuación son sugerencias sobre cómo podrías dividir el trabajo entre tus compañeros de equipo. Para cada uno de ellos (excepto las seeds), necesitarás construir rutas, acciones de controlador y vistas. Ten en cuenta que decimos "challenge" como modelo de ejemplo para nuestra aplicación de prueba de las clases, pero siempre debes reemplazar esa palabra con el nombre del modelo principal de tu proyecto:

**Ámbito 0: Seed**
Antes de poder trabajar en los Ámbitos 1 y 3, necesitas registros de tu modelo principal en tu base de datos. Puedes crear registros en tu `rails console`, pero tener un archivo seed es muy útil para el desarrollo. Consulta [este tutorial](https://kitt.lewagon.com/knowledge/cheatsheets/rails_seeds?course_ats_slug=web).

**Ámbito 1: Index + Show**
- Como visitante, puedo ver una lista de ejercicios para navegar al ejercicio que quiero explorar.
- Como visitante, puedo hacer clic en un ejercicio para ver sus detalles

**Ámbito 2: New + Create**
- Como usuario, puedo mostrar un formulario para completar la información requerida para crear un nuevo ejercicio
- Como usuario, puedo enviar el formulario para crear el nuevo ejercicio

**Ámbito 3: Edit + Update**
- Como usuario, puedo mostrar un formulario para editar un ejercicio que he creado
- Como usuario, puedo enviar el formulario para actualizar el ejercicio

### Agregando IA
Ahora que tienes una aplicación Rails básica con un modelo principal, es hora de agregar capacidades de IA.
Configura RubyLLM en tu aplicación, siguiendo la clase de Introducción a LLM.

Este es el punto de partida para agregar las historias de usuario relacionadas con IA:
- Como usuario, puedo crear un chat con el Asistente de IA sobre un ejercicio.
- Como usuario, puedo ver la lista de chats que creé con el Asistente de IA sobre un ejercicio.
- Como usuario, puedo navegar a un chat que creé con el Asistente de IA sobre un ejercicio.
- Como usuario, puedo enviar un mensaje al Asistente de IA en el contexto de un chat.

En esta parte, cada clase de la Semana de IA te guiará sobre cómo progresar. Dicho esto, no esperes para comenzar a implementar estas acciones.

Como recordatorio, recomendamos agregar una tabla `chats` y una tabla `messages` con los siguientes campos 👇 para anticipar futuras mejoras.

<details><summary markdown='span'>Ver esquema de BD
</summary>
  <img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/3h0por8ku29vrntndn0ci30fobb7" alt="Esquema de base de datos mostrando cuatro tablas: users, challenges, chats y messages, sus relaciones y columnas">
</details>

Recuerda que los **chats** se crean dentro del contexto de un "ejercicio", y que los **messages** se crean dentro del contexto de un **chat**. Si necesitas un repaso sobre este tipo de relación, vuelve a la sección **Nested Resources** de la clase **Advanced Routing**.

Y por supuesto, si tienes dificultades, ¡crea un ticket!

### System Prompt
A continuación, trabajarás en el **system prompt** de tu Asistente de IA y te asegurarás de que cada solicitud de API se envíe con el `with_instructions(system_prompt)` apropiado, para dar forma al comportamiento de tu Asistente de IA según tu persona y objetivo.

Recuerda que un buen prompt debe incluir:
- **Persona**: ¿Cómo quién debe actuar la IA?
- **Contexto**: Para qué se usará la salida y por quién (es decir, el usuario), y cualquier dato relevante para pasar junto con la entrada del usuario.
- **Tarea**: generalmente definida por el usuario, pero debe ser clara, directa y específica.
- **Formato**: Cómo debe estructurarse la salida (por ejemplo, JSON, Markdown, etc.).
