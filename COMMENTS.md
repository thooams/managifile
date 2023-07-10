Le besoin, c'est une solution sour forme d'une Gem ou Engine pour gérer des documents.
Le but, c'est de créer une gem qui permet de configurer l'attribut d'un model comme type file (unique ou multiple) pour enregistrer des documents:
- Différents types (pdf, doc, csv...),
- Différentes restrictions (taille, crypté...)
- Une gestion de status (draft, complete, shared...)
- Une gestion de version (un plus)
- Une gestion des droits d'accès (un plus)
- Les documents peuvent être enregistrés localement ou dans un bucket S3.

## Feedback

- La réponse au besoin est présente dans cette gem, mais il aurait été plus
  judicieux de pouvoir créér un model, "Document" par exemple, à travers la gem pour mieux
  maitriser la notion de versionning, de status, de droits pour chacun des
  documments que l’on souhaite uploader.

## Les amiliorations de la gem

- Mettre en place un système plus fin pour activer l’une ou l’autre des
  fonctionnalités prévu pour la gem. Pour cela il faut :
  - [ ] Mettre un système pour activer l’une ou l’autre des fonctionalités sur le
    fichier managifile_attachable.rb
  - [ ] Mettre en place un système qui installe les gems au besoin/ à la demande.
  - [x] Créer des générateurs par fonctionnalité

## Améliorations futures
- Vérifier le contenu du document
- Vérifier si le document n’est pas un virus
- Cryptage du fichier bout en bout
- Notion de temps de partage de fichiers
- Signature de document
- Modification de document
- Création de document
- ...
