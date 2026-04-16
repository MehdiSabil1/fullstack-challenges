## Contexto y Objetivos

Este ejercicio está diseñado para validar conceptos fundamentales que ya has visto y que son comunes en lenguajes de programación.

- Leer entradas de usuario / imprimir información al usuario
- Variables y métodos
- Flujo de programas y estructuras de control
- Manipulación de strings y arrays

### Reglas de Black Jack

Implementaremos una versión simplificada de Black Jack:

- El jugador empieza sin cartas (marcador en 0)
- El croupier empieza con una puntuación entre `16` y `21`
- Para cada ronda, el jugador puede:
  - Tomar una carta con un valor aleatorio entre `1` y `11`. Este número será incluido en su marcador.
  - Tomar otra carta o conformarse con el puntaje actual y terminar el juego.
- Finalmente hay 5 posibilidades:
  - Si el marcador del/de la jugador/a es > 21, él/ella pierde `"Lose"`.
  - Si el marcador del/de la jugador/a es 21, tiene `"Black Jack"` y gana.
  - Si el marcador del/de la jugador/a es > que el del croupier, él/ella gana `"Win"`.
  - Si el marcador del/de la jugador/a es < que el del croupier, él/ella pierde `"Lose"`.
- Si el marcador del/de la jugador/a es == al del croupier, es un empate `"Push"`. Al/a la jugador/a se le devuelve su dinero.

## Especificaciones

### `black_jack.rb`

- Implementa el método `#pick_bank_score` el cual devuelve un puntaje aleatorio entre 16 y 21.
- Implementa el método `#pick_player_card` el cual devuelve un valor de carta aleatorio entre 1 y 11.

### `croupier.rb`

- Implementa el método `#state_of_the_game` el cual construye un mensaje que contiene los puntajes del croupier y del jugador. ej. `"Your score is 6, bank is 17"`
- Implementa el método `#end_game_message` que será llamado al final del juego y que tendrá el resultado del mismo: ganó/perdió/empate (win/lost/push). ej. `"You beat the bank! You win."` o `"Bust! You lose."` o `"Push. You get your money back."`

### `interface.rb`

- Implementa el método principal que correrá el juego de Black Jack desde la Terminal. Debe funcionar de la siguiente manera:

```bash
ruby lib/interface.rb

Card? 'y' or 'yes' to get a new card
> yes
Your score is 6, bank is 17

Card? 'y' or 'yes' to get a new card
> yes
Your score is 16, bank is 17

Card? 'y' or 'yes' to get a new card
> yes
Your score is 19, bank is 17

Card? 'y' or 'yes' to get a new card
> no
You beat the bank! You win.
```
⚠️ ¡El ejercicio no termina cuando `rake`esta todo en verde! Debes asegurarte de que realmente puedas jugar al correr `ruby lib/interface.rb` 😉.

## Puntos clave de aprendizaje

- ¿Cuáles son las distintas maneras de hacer loops (bucles)?
- ¿Cuáles son las estructuras condicionales disponibles?
- ¿Qué es una interpolación de string?

## Recomendaciones y recursos adicionales

- Tal vez quieras utilizar la [clase Random](https://ruby-doc.org/3.3.5/Random.html).
- Cuando ejecutes bucles (loops) necesitas una condición para detener el juego en cierto momento.
