## Contexte et objectifs

Tu vas continuer avec ton application Hacker News. Aujourd’hui, tu vas ajouter une couche utilisateur ; pour cela, tu dois te connecter avant de publier un nouveau post.

(Mais tu n’as pas besoin de te connecter pour voir les posts.)

## Configuration

On t’a donné une première migration pour créer la table `posts`.

```bash
rake db:create
rake db:migrate
```

## Spécifications

### Ajouter un modèle `User`

On te fournit le schéma de base des posts (regarde la migration existante dans le dossier `db/migrate`).

Commence par générer une nouvelle migration pour créer le modèle `User`. Le modèle doit contenir les champs suivants :
- `username`
- `email`

### Migration : un User a plusieurs posts

Tu dois maintenant lier les posts aux utilisateurs. Génère une nouvelle migration pour ajouter une clé étrangère `user_id` à la table `posts` existante (conseil : tu mets à jour une table existante, tu n’en crées pas une nouvelle à partir de zéro. Relis la section "Adding a foreign key" du cours d’aujourd’hui).

Mets ensuite à jour les deux fichiers de modèles pour déclarer l’association, de façon à pouvoir appeler `user.posts` et `post.user`.

### Alimenter avec des utilisateurs et des posts

Écris une seed pour remplir ta base de données avec 5 utilisateurs ayant chacun entre 5 et 10 posts. Tu peux utiliser la stratégie de ton choix (faker ou API).

Ne passe pas trop de temps à essayer d’utiliser l’API. Souviens-toi que l’objectif ici est de travailler avec les associations.
