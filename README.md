## Création des hôtes

Nous allons utiliser le fichier docker-compose.yml pour créer le master, 2 hôtes ubuntu

```
docker-compose up -d
```

## Copier les fichier utiles dans les conteneurs master

Copiet le contenu du dossier ansible, src et bdd dans le conteneur master : 
```
docker cp ansible/. master01:/etc/ansible/


## Configuration des cibles

__1) Connexion au master__

```
docker exec -it master01 sh
```
Vous êtes désormais connecté dans le master, nous allons maintenant connecter le master aux 2 hôtes via ssh 

__2) Connexion en SSH :__ effectuer les commandes ci-dessous dans le master, une par une : (les deux dernières étapes sont là pour s'assurer que la clé ssh ait bien été ajoutée)

```
ssh-keygen
eval "$(ssh-agent)"
ssh-add /root/.ssh/id_rsa
```
*NB: penser à modifier /root/.ssh/id_rsa si vous avez enregistré votre clé ailleurs que dans le chemin par défaut*

__3) Copie de la clé sur les machines hôtes :__  il vous faudra effectuer les commandes suivantes (le mot de passe du root est *toor*)

```
ssh-copy-id root@dbubuntu 
ssh-copy-id root@appubuntu
```

__4) Lancement du playbook:__

```
ansible-playbook /etc/ansible/myplaybook.yml
```