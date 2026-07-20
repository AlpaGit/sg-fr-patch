# Guide d'installation détaillé

Ce document décrit l'installation pas à pas pour ceux qui préfèrent voir ce qui se passe
plutôt que de double-cliquer aveuglément sur l'installeur. Pour la version courte, voir
le [README](../README.md#installation).

## Pré-requis

- **Steins;Gate** sur Steam (app id 412830) — [page Steam](https://store.steampowered.com/app/412830/).
- Windows 10 ou 11. (Linux/Steam Deck en théorie ok via Proton, voir [FAQ](faq.md).)

Le patch FR est autonome : aucun patch tiers (CoZ ou autre) n'est requis. Vérifiez
simplement que votre installation contient bien le sous-dossier `USRDIR/` :

```
…\steamapps\common\STEINS;GATE\
├── Game.exe
├── Launcher.exe
├── bink2w32.dll
├── steam_api.dll
└── USRDIR\
    ├── bg.mpk
    ├── bgm.mpk
    ├── chara.mpk
    ├── manual.mpk
    ├── mask.mpk
    ├── mgsshader.mpk
    ├── movie\
    ├── script.mpk          ← celui qu'on va remplacer (#1)
    ├── se.mpk
    ├── shader.mpk
    ├── system.mpk          ← celui qu'on va remplacer (#2)
    ├── voice.mpk
    └── shader.mpk
```

Si `USRDIR\` est absent ou si vous voyez une structure radicalement différente, vous
n'avez probablement pas la bonne version (Elite, Switch, etc.) — voir [FAQ](faq.md).

## Installation automatique

1. Téléchargez la dernière release (`.zip`) depuis l'onglet
   [Releases](../../releases/latest) du dépôt.
2. Décompressez l'archive où vous voulez (`Documents`, `Téléchargements`, peu importe).
   La structure obtenue ressemble à ça :

   ```
   sg-fr-vX.Y.Z\
   ├── README.md
   ├── install.bat        ← celui qu'on va lancer
   ├── uninstall.bat
   ├── installer\
   │   ├── install.ps1
   │   └── uninstall.ps1
   └── patch\
       ├── script.mpk     (~6 Mo)
       └── system.mpk     (~133 Mo)
   ```

3. Double-cliquez sur **`install.bat`**.

   Une fenêtre PowerShell s'ouvre. Le script exécute quatre étapes affichées à l'écran :

   ```
   [1/4] Recherche du jeu...
         Jeu trouve : F:\SteamGames\steamapps\common\STEINS;GATE

   [2/4] Verification de la structure du jeu...
         Structure du jeu valide.

   [3/4] Sauvegarde des fichiers originaux...
         Sauvegarde creee : script.mpk.bak
         Sauvegarde creee : system.mpk.bak

   [4/4] Application du patch FR...
         script.mpk remplace (6 334 480 octets).
         system.mpk remplace (133 601 432 octets).
   ```

4. Appuyez sur **Entrée** pour fermer la fenêtre.

5. Lancez **Steins;Gate** par Steam, démarrez une partie et vérifiez que le texte
   s'affiche en français.

### Si l'installeur ne trouve pas le jeu

Le script lit le registre Windows pour trouver Steam, puis parcourt vos bibliothèques
Steam (`libraryfolders.vdf`). Si le jeu est installé via une méthode non standard
(symlink, montage manuel…), le script vous demande le chemin manuellement :

```
Detection automatique : echec.

Indiquez le chemin du jeu manuellement.
Exemple : G:\SteamLibrary\steamapps\common\STEINS;GATE

Chemin :
```

Tapez ou collez le chemin complet du dossier qui contient `Game.exe` et `USRDIR\`,
puis Entrée.

## Installation manuelle

Si vous ne voulez pas exécuter de PowerShell, c'est aussi simple :

1. Localisez votre dossier Steins;Gate (clic droit dans Steam → *Gérer* →
   *Parcourir les fichiers locaux*).
2. Ouvrez le sous-dossier `USRDIR`.
3. Renommez `script.mpk` en `script.mpk.bak` (sauvegarde).
4. Renommez `system.mpk` en `system.mpk.bak` (sauvegarde).
5. Copiez `patch\script.mpk` et `patch\system.mpk` (depuis l'archive de la release)
   dans `USRDIR\`.
6. Lancez le jeu.

C'est tout : deux fichiers remplacés, ~140 Mo au total.

## Vérification

- Le `script.mpk` du dossier `USRDIR` doit faire **6 828 048 octets** (~6,5 Mo, version FR
  v1.0.1).
  L'original anglais fait environ 6 Mo également mais avec une signature différente.
- Le `system.mpk` doit faire **133 601 432 octets** (~133 Mo, version FR avec police étendue).
  L'original fait à peu près la même taille — la différence porte sur les textures de
  police.
- Au lancement du jeu, le texte d'introduction (premières répliques d'Okabe) doit être en
  français : « Hé, vous. Vous nous voyez ? »

## Désinstallation

Double-cliquez sur **`uninstall.bat`**. Le script :

1. Localise à nouveau votre installation.
2. Restaure `script.mpk.bak` par-dessus `script.mpk`.
3. Restaure `system.mpk.bak` par-dessus `system.mpk`.

Si vous avez supprimé l'une des sauvegardes par accident, passez par Steam : clic droit
sur le jeu → *Propriétés* → *Fichiers installés* → *Vérifier l'intégrité des fichiers*.
Steam retéléchargera les versions vanille.
