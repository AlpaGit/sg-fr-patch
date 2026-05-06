# Contribuer

Merci de l'intérêt ! Les retours et corrections sont précieux pour faire évoluer la VF.

## Signaler un problème

Le moyen le plus simple, et celui qui aide le plus le projet : ouvrir une
[issue](../../issues).

Précisez :

- **Le contexte** — chapitre, scène, qui parle à qui (ou quel TIPS / quel SMS).
- **Le passage exact** — copier-coller du texte affiché, ou une capture d'écran.
- **Le souci** — faute de frappe, contresens, ton qui sonne faux, ambiguïté…
- **Une suggestion** si vous en avez une (pas obligatoire).

Plus c'est précis, plus c'est facile à corriger.

## Cas particuliers

### Glossaire / cohérence

Certains termes-clés ont été fixés en début de projet pour rester identiques d'un fichier
à l'autre. Si vous trouvez une occurrence qui sort du glossaire, c'est un bug — signalez-le.

Termes principaux :

| Terme | Traduction | Note |
|---|---|---|
| Reading Steiner | *Reading Steiner* | nom propre, conservé |
| Worldline | Ligne du monde | parfois "ligne univers" en français |
| Divergence | Divergence | + indicateur "Divergence Meter" → "Indicateur de Divergence" |
| Convergence | Convergence | |
| Attractor field | Champ d'attraction | "α", "β" notés en lettres grecques |
| D-mail | D-mail | nom propre du gadget |
| Lab Member | Lab Member | conservé en VO, suivi du numéro (n° 001, 002…) |
| Future Gadget Lab | Future Gadget Lab | nom propre, jamais traduit |
| Future Gadget #N | Gadget Futur n°N | "Future Gadget n° 8" → "Téléphone Micro-ondes" |
| SERN | SERN | (anagramme délibéré du CERN, conservé) |
| Hououin Kyouma | Hououin Kyouma | nom de scène d'Okabe, jamais traduit |
| Phone Microwave (name subject to change) | Téléphone Micro-ondes (nom susceptible de changer) | gadget n°8 |
| Operation Skuld / Verdandi / Eliade / Arc Light | Opération Skuld / Verdandi / Eliade / Arc Light | noms d'opérations |
| El. Psy. Kongroo | El. Psy. Kongroo | conservé (formule occulte d'Okabe) |
| Tuturu~ | Tuturu~ | onomatopée fétiche de Mayuri |

Si vous proposez un changement de traduction pour un terme du glossaire, ouvrez plutôt
une **discussion** : ça affecte des centaines d'occurrences et mérite débat.

### Voix des personnages

Chaque protagoniste a un registre de langue défini :

- **Rintaro Okabe / Hououin Kyouma** — alterne entre le théâtral pompeux ("Hmph !
  L'Organisation… ils nous traquent !") quand il joue son rôle, et le gars ordinaire
  paniqué quand il craque. Tutoie tout le monde sauf Mayuri (qu'il a toujours connue).
- **Mayuri** — naïve, enfantine, vouvoie tout le monde sauf Okabe. Onomatopées :
  "Tuturu~", "Mayushii…".
- **Kurisu Makise** — tsundere intellectuelle. Vouvoiement par défaut, glisse au tutoiement
  avec Okabe au fil du jeu. Déteste qu'on l'appelle "Christina", "L'Assistante" ou
  "L'Hime-sama". Phrases souvent cassantes, vocabulaire scientifique fluide.
- **Itaru Hashida / Daru** — otaku, geek, vulgaire à demi-mot. Tutoie Okabe (ami d'enfance).
  Beaucoup de jeu de mots informatique / 2chan / parodie d'animes. "Stp", "lol", "kof kof".
- **Suzuha Amane** — directe, garçonne, tutoie tout le monde. Mystérieuse en première
  partie, plus chaleureuse ensuite.
- **Faris NyanNyan** — surjoue le persona neko-girl jusqu'à la caricature. Termine ses
  phrases en "nya~", remplace les "na" par "nyan", etc. Vouvoie poliment ses clients,
  tutoie Okabe.
- **Ruka Urushibara** — timide, doux, féminin malgré son genre masculin. Vouvoiement,
  bafouille fréquemment, pause longue avant les phrases importantes.
- **Moeka Kiryuu** — texto-addict, presque mutique en face-à-face. La majorité de ses
  répliques apparaissent comme des SMS plutôt qu'à voix haute. Phrases très courtes,
  ponctuation minimale dans les SMS.
- **Maho Hiyajo** — pragmatique, scientifique. Vouvoiement professionnel.
- **Mr. Braun** — froid, agressif, parle peu. Vouvoiement glacial.

Si une réplique de personnage sonne complètement à côté de sa voix habituelle, ça
mérite une issue.

### Sous-titres des cinématiques

Pas encore traduits. Les fichiers vidéo sont dans `…\STEINS;GATE\USRDIR\movie\` au
format Bink (`.bk2`). Les pistes de sous-titres sont intégrées au conteneur, donc
extraire/réinjecter n'est pas trivial. Si vous voulez vous lancer là-dessus, contactez-nous
via une discussion avant de commencer.

## Pull Requests

Les PR sont ouvertes pour :

- Améliorations de l'installeur PowerShell (auto-détection plus robuste, support Steam
  Deck/Proton, vérifications supplémentaires).
- Compléments de doc (FAQ, guide, traductions de la doc en d'autres langues).

Pour les corrections de texte, l'idéal est de passer par une issue avant — la chaîne
de build (compilation `.sct` → `.scx` → `.mpk`) n'est pas dans ce dépôt et nécessite
quelques outils côté traducteur.

## Code de conduite

Pas de règle formelle, juste du bon sens :

- Restez courtois, même quand vous tombez sur une coquille frustrante.
- N'utilisez pas le tracker pour discuter du jeu lui-même (spoils, théories…), il y a
  des forums pour ça.
- Pas de partage de fichiers du jeu original (archives MPK vanilla, voix, vidéos…). Les
  issues qui en contiennent seront fermées.

Merci.
