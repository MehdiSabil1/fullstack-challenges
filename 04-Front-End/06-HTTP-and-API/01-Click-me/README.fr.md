## Avant de commencer

Pour le challenge sur l'API Météo, tu auras besoin d'une clé API pour faire des appels à l'API OpenWeatherMap. Parfois, Open Weather met un peu de temps à activer la clé, en particulier quand beaucoup d'étudiants créent des clés depuis le même endroit 🙀 Pour éviter ce problème, **partage ta clé API avec ton buddy** pour limiter le nombre de clés nécessaires.

Faisons-en la demande maintenant pour éviter tout délai plus tard ! Note-la bien quelque part pour être prêt(e) pour ce challenge 💪

Va sur [OpenWeatherMap API](https://home.openweathermap.org/) et crée un compte pour obtenir ta clé API. Tu devrais la trouver [ici](https://home.openweathermap.org/api_keys).

## Contexte et objectifs

Dans ce petit challenge pour s'échauffer, on va revenir sur la façon de lier un événement du DOM à une action en JavaScript !

C'est toujours le même processus en 3 étapes :

- **Sélectionner** l'élément que tu souhaites rendre interactif
- **Écouter** l'élément sur l'événement
- Écrire le **callback** (le code qui s'exécute quand l'événement se produit)

## Spécifications

Lance ton serveur Web local avec :

```bash
serve
```

Ouvre [`localhost:8000`](http://localhost:8000) dans ton navigateur.

Tu devrais voir apparaître un gros bouton vert disant `Click me!`. L'objectif de ce challenge est d'afficher une [`alert`](https://developer.mozilla.org/en-US/docs/Web/API/Window/alert) disant `Thank you!` quand tu cliques dessus.

Ouvre le fichier `lib/index.js` et suis le pseudo-code !

Il n'y a pas de test pour cet exercice, mais on vérifiera ton style ! Lance `rake`.
