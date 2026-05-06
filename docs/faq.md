# FAQ

### Le jeu est toujours en anglais après installation, qu'est-ce qui se passe ?

Vérifiez plusieurs choses :

1. Le `script.mpk` du dossier `USRDIR` est bien la version française (faisable en
   regardant la date de modification : doit correspondre à celle indiquée par
   `install.bat`).
2. Vous avez bien Steins;Gate (app id 412830), pas Elite ni un autre jeu de la série.
3. Vous avez bien lancé le jeu via **Steam** (et pas un raccourci pointant sur un ancien
   binaire).

### Pourquoi le `system.mpk` pèse 133 Mo dans le patch ?

Parce qu'il contient toutes les textures système du jeu, dont les polices d'affichage
(`FONT.PNG` et `FONT2.PNG`). Pour faire afficher les accents français (`é`, `è`, `à`,
`ç`, `ê`, `î`, `ô`, `û`, `œ`, etc.), il faut modifier ces textures. Le moteur du jeu
charge tout le `system.mpk` d'un bloc, donc on est obligé de fournir le fichier
complet (pas juste les textures modifiées).

C'est pour ça que la release fait ~140 Mo total au lieu de ~6 Mo.

### Est-ce qu'il faut le patch Committee of Zero (CoZ) ?

**Non**, contrairement au patch CHN. La version Steam de Steins;Gate est déjà localisée
en anglais à la base (par JAST/Nitroplus, en 2016) et son moteur lit nativement les
fichiers `USRDIR/*.mpk`. La VF se contente de remplacer les MPK : aucun hook, aucune DLL
injectée.

Si vous avez par ailleurs installé un patch CoZ pour Steins;Gate (rare, surtout pour les
améliorations Steam Deck), il devrait cohabiter sans problème — mais nous n'avons pas
testé toutes les combinaisons.

### Mes sauvegardes sont-elles compatibles ?

Oui. Les sauvegardes ne contiennent que des index de scènes/de scripts, pas le texte
lui-même. Vous pouvez basculer entre la VO et la VF à tout moment sans perdre votre
progression.

Petite nuance : le contenu déjà déroulé (backlog, lectures précédentes) sera affiché dans
la langue du `.mpk` actif au moment où vous le consultez — pas dans celle d'origine.

### J'ai trouvé une faute / un contresens / une formulation pas claire.

Bienvenue ! Ouvrez une [issue GitHub](../../issues) avec :

- Une capture d'écran si possible.
- Le chapitre / la scène / le contexte (par ex. "Chapitre 3, Okabe parle à Kurisu au labo").
- La phrase telle qu'affichée et votre proposition.

C'est exactement le genre de retour qui permet de faire évoluer la VF.

### La VF est-elle une retraduction depuis le japonais ?

Non — c'est une traduction depuis l'anglais officiel (JAST/Nitroplus), pas depuis le
japonais original. Les choix d'adaptation faits par les traducteurs anglais (jeux de
mots geek, références internet, ton chuunibyou d'Okabe…) sont conservés et ré-adaptés
en français.

C'est un compromis assumé : retraduire ~34 000 lignes depuis le japonais aurait pris des
années avec une équipe entière. Passer par l'anglais permet d'avoir une VF complète et
cohérente. Les éventuelles libertés prises par JAST par rapport à l'original japonais
sont conservées dans la VF.

### Je peux jouer en streaming / faire un Let's Play ?

Aucun problème côté patch. Côté jeu, vérifiez les conditions du studio MAGES./5pb. (en
général permissif sur Steins;Gate, mais le True End peut avoir des restrictions de
spoil).

### Je veux participer à corriger / améliorer la traduction.

Voir le [README](../README.md#signaler-un-problème) et [CONTRIBUTING.md](../CONTRIBUTING.md).
Les corrections passent par des issues ou des pull requests sur le dépôt. Le glossaire
des termes-clés (Reading Steiner, Lignes du monde, D-mail, SERN, Future Gadget Lab,
Hououin Kyouma…) est partagé pour garder la cohérence.

### Compatible Linux / Steam Deck ?

En théorie oui : le moteur de SG tourne via Proton sans souci, et le patch ne fait que
remplacer deux fichiers. L'installeur `.bat` est en revanche prévu pour Windows. Sur
Linux/Steam Deck, copiez à la main `patch/script.mpk` et `patch/system.mpk` dans
`…/STEINS;GATE/USRDIR/` après avoir sauvegardé les originaux.

Chemin typique sur Steam Deck :
```
~/.local/share/Steam/steamapps/common/STEINS;GATE/USRDIR/
```

### Quel est le poids du patch ?

Environ **140 Mo** au total :
- `script.mpk` : ~6 Mo (les scripts traduits)
- `system.mpk` : ~133 Mo (les textures système avec la police étendue)

Aucune dépendance externe, aucun runtime à installer, aucun service tiers.

### Je veux jouer en anglais OU en français à la volée, sans réinstaller.

Le moteur de SG ne supporte qu'une seule langue par installation (pas de menu
multi-langue interne comme certains jeux Steam). Pour basculer rapidement, vous pouvez :

1. Garder les `.bak` en place.
2. Renommer manuellement les fichiers selon la langue voulue :
   ```
   # Pour passer en anglais :
   ren script.mpk script.mpk.fr
   ren script.mpk.bak script.mpk
   ren system.mpk system.mpk.fr
   ren system.mpk.bak system.mpk
   ```
3. Inverser pour repasser en français.

Pas très ergonomique, mais ça marche. Une vraie solution multi-langue demanderait de
hooker le chargement, ce qui dépasse le scope de ce patch.

### Steins;Gate Elite / Steins;Gate 0 / Linear Bounded Phenogram, c'est prévu ?

**Non, pas par ce projet.** Ce sont des jeux différents (moteur différent pour Elite),
chacun nécessite son propre travail de traduction. Pour ces titres, voir les patchs CoZ
(en anglais) : [committeeofzero.com](https://committeeofzero.com/).
