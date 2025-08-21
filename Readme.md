# Génération d'attestations

Ce projet permet de générer automatiquement des attestations pour les étudiants à partir de leur numéro de matricule.
Les informations nécessaires sont récupérées depuis GesEtu.

L’application est accessible à l’adresse suivante :
https://esibru.github.io/generateur-attestations/

## Guide d’utilisation

Avant de commencer, assurez-vous :

- d'être sur une machine de l'ESI
- que chrome soit installé à l'adresse ´C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"´
- d'être connecté au réseau administratif en vérifiant si http://gesetu.intranet.he2b.be est accessible,
- de disposer de vos identifiants GesEtu,
- d'avoir sous la main les matricules des étudiants concernés.

Étapes à suivre :

- Lancez le Chrome via le script ´chrome-dev.bat´
- Accédez dans ce browser à la page de l’application.
- Renseignez vos identifiants :
   - ´Login´ : votre identifiant utilisateur
   - ´Password´ : votre mot de passe GesEtu

- Cliquez sur le bouton ´Login´.

En cas d’erreur de connexion, un message d’alerte apparaît : ´Error: NetworkError when attempting to fetch resource.´.

- Vérifiez que vous êtes bien connecté au réseau administratif.
- Assurez-vous que vos identifiants sont corrects.
- Vérifiez que Chrome a été lancé avec le script.

Une fois connecté :

- Le bouton ´Show PDF´ devient disponible.
- Saisissez le matricule de l’étudiant dans le champs ´matricule´, puis cliquez sur ´Show PDF´.
- L’attestation est générée et s’affiche dans la zone prévue sous le formulaire.

Ensuite :

- Enregistrez le fichier PDF via le bouton de sauvegarde.
- Imprimez l’attestation et faites-la valider via le cachet de la direction.
- Remettez l'attestation à l'étudiant.

## Détails techniques

La génération des PDF repose sur pdfkit.

    - adapté depuis https://codepen.io/blikblum/pen/YboVNq?editors=1010
    - pdfkit.standalone.js downloaded from: https://github.com/devongovett/pdfkit/releases/download/v0.10.0/pdfkit.standalone.js
    - blob-stream.js downloaded from: https://github.com/devongovett/blob-stream/releases/download/v0.1.3/blob-stream.js

Les serveurs GesEtu n’autorisent pas le CORS. 
Pour contourner cette limitation :

- Sous Firefox :
   - Téléchargez l’extension disponible dans ´./firefox_extension_mv2´
   - Consultez la page ´about:debugging#/runtime/this-firefox´ 
   - Cliquez sur le bouton ´Load Temporary Add-On´
   - Sélectionnez le fichier ´manifest.json´ du dossier ´./firefox_extension_mv2´
- Sous Chrome/Chromium :    
    - lancer chrome/chromium avec un profil temporaire sans les sécurités : chrome --disable-web-security --user-data-dir=/tmp/devprofile
    
Afin d'éviter cette configuration à chaque impression, les scripts suivants lancent un browser pré-configuré : 

- ´chrome-dev.bat´ : exécute Google Chrome sur les machines de l'ESI
- ´chrome-dev.sh´ : exécute Chromium sur une machine linux

