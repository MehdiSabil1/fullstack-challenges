## Contexte et objectifs

Construisons un puzzle! 🧩
Une fois que tu auras déplacé toutes les pièces du puzzle pour ordonner les nombres dans le bon ordre, tu recevras une notification t'indiquant que tu as gagné le jeu.

![js-puzzle](https://raw.githubusercontent.com/lewagon/fullstack-images/master/frontend/js_puzzle.gif)

## Mise en place

Comme d'habitude, tu vas pouvoir tester ton code en lançant cette commande :

```bash
serve
```

Ouvre ensuite [`localhost:8000`](http://localhost:8000) dans ton navigateur.

## Spécifications

Pour ce challenge, nous allons utiliser un nouveau concept JavaScript: un écouteur d'évènements (*event listener*). Tu en apprendras davantage dans la leçon suivante donc pour le moment il a été écrit pour toi dans le challenge.
Comment est-ce que cela fonctionne ? Nous souhaitons exécuter notre code JavaScript seulement lorsqu'un évènement en particulier se passe, pas directement lorsque la page se charge (ce que nous faisions jusqu'à présent). Dans notre cas, nous souhaitons déplacer notre emplacement de puzzle vide uniquement lorsque l'utilisateur clique sur une autre pièce du puzzle, autrement rien ne doit se passer. C'est ce que nous allons faire avec le code suivant :

```js
tiles.forEach((tile) => {
  tile.addEventListener('click', () => {
    if (canMove(tile)) {
      moveTile(tile);
      checkIfPlayerWins();
    }
  });
});
```

Ne change pas ce code à la fin de ton fichier, tu dois seulement coder les fonctions qui sont à l'intérieur.

## Vérifier si la pièce peut bouger

Le code qui se passe à l'intérieur d'un écouteur d'évènements est appelé **callback**.
Nous souhaitons déplacer la pièce dans le callback, mais avant tout nous devons vérifier si la pièce peut bouger. Une pièce peut seulement bouger si elle a un voisin vide (verticalement ou horizontalement).

Implémentons la fonction `canMove` pour vérifier si une pièce a un espace vide à côté d'elle.
Cette fonction doit prendre 1 paramètre - la pièce elle-même.

Pour vérifier si une pièce a un espace vide à côté d'elle, tu peux regarder le [cellIndex](https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableCellElement/cellIndex) et le [rowIndex](https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableRowElement/rowIndex) pour calculer la position de la pièce.
Fais attention si tu as besoin d'appeler ces méthodes sur un `tr` ou un `td`!

## Déplacer la pièce

Si tu peux déplacer la pièce, alors déplaçons-la. Implémentons la fonction `moveTile` qui doit échanger la pièce vide avec celle à côté. Tu dois échanger la classe `.empty` de la pièce vide avec celle que tu viens de cliquer et échanger le nombre de la pièce que tu as cliqué avec la pièce vide.

## Notifier le joueur lorsqu'il gagne le jeu

Pour finir, nous devons implémenter après chaque mouvement si le joueur a gagné le jeu. "Gagner" dans ce jeu signifie que les pièces sont ordonnées par ordre croissant.

Codons la fonction `checkIfPlayerWins` qui doit montrer une alerte si les pièces sont dans le bon ordre.

Maintenant tu peux essayer de résoudre le puzzle!
