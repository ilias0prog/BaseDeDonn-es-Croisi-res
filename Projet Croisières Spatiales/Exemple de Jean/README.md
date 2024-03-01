# Exemple - Travail de groupe

Lors de la réalisation de votre projet, vous serez amené à devoir déployer cette base de données (DB) via Docker. Ce repository contient un exemple de déploiement d'une base de données MySQL, vous permettant ainsi de vous familiariser avec Docker.\
Deux composants permettent le déploiement de cette base de données : Le code d’initialisation `data.sql` et le 'docker file' `docker-compose.yml`.

Si vous parcourez le fichier `data.sql`, vous y trouverez les instructions d’initialisation, le code DDL ainsi que le code d’initialisation des données (l'encodage de certaines données les rend illisible, c'est normal pas d'inquiétude).

Le fichier docker-compose.yml permet de configurer l’environnement docker dans lequel votre base de données sera déployée. Cet environnement est appelé un container. On retrouve dans ce fichier un service nome ‘mysql’ (ligne 3) utilisant l’image MySQL (ligne 4), il s’agit d’un environnement de base MySQL préconfiguré.\
Nous le paramétrons via plusieurs variables d’environnement (lignes 7 à 11). Vous pouvez vous referez à la documentation de [l’image mysql](https://hub.docker.com/_/mysql) afin d’obtenir la liste exhaustive de ces variables.\
Le paramètre `ports` nous permet d'ouvrir les ports du container nécessaire pour nous connecter.\
Et enfin le `volumes` nous permet de lien de dossier ou fichier entre notre machine et le container, dans ce cas nous ajoutons le fichier data.sql dans le dossier docker-entrypoint-initdb.d du container. La documentation de l'image mysql nous indique que les fichiers de code contenu dans ce dossier seront exécutés lors de la création de la base de données. Le code d'initialisation contenu dans le fichier `data.sql` initialisera donc bien la base de données lors de sa création.

## Getting started
### Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (Optional)

### Setup
1) Utiliser la commande `git clone https://gitlab.unamur.be/info-db/infob212/exemple-travail-groupe.git` afin de télécharger le repository. Vous pouvez également le télécharger directement depuis Gitlab via le bouton 'Code'
2) Lancer Docker Desktop
3) Ouvrez un terminal dans le dosier racine du projet et executez la commande `docker compose up -d`.
4) Ouvrez votre logiciel de gestion de base de données (par exemple: Mysql workbench ou Datagrip)
5) L'interface de connexion change d'un logiciel a l'autre mais vous serez toujours amené à entrer l'adresse (localhost), le port (3306), le nom de la base de données (northwind), un username (admin) et un password (password). Toutes ces valeurs peuvent être trouvées dans le fichier docker-compose.yml
    - Tutoriel MySQL Workbench: https://www.mysql.com/products/workbench/
    - Tutoriel Datagrip: https://www.jetbrains.com/help/datagrip/postgresql.html#connect-to-postgresql-database

Je ne peux que vous conseiller de consulter les documentations de docker et mysql afin que votre projet se déroule dans les meilleures conditions.

Bon travail.
