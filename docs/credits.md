# Crédits

## Jeu original

**Steins;Gate** — © MAGES. / 5pb. / Nitroplus.
Tous les droits sur le scénario, les personnages, les illustrations, la musique et le
moteur du jeu appartiennent à leurs ayants droit respectifs.

## Localisation anglaise officielle

**JAST USA / Nitroplus** — pour la version anglaise Steam (2016) sur laquelle se base
toute cette VF. Sans leur travail de traduction et d'adaptation, ce patch n'existerait
pas. Une partie des choix de ton et de registre (notamment le chuunibyou d'Okabe et les
jeux de mots geek de Daru) sont des décisions JAST qu'on a essayé de conserver
fidèlement en français.

## Outils utilisés

- **[coalesc3](https://github.com/CommitteeOfZero/coalesc3)** — toolchain de packaging
  Committee of Zero, utilisée pour décompiler/recompiler les scripts `.scx`.
- **[MagesScriptTool](https://github.com/CommitteeOfZero/MagesScriptTool)** — décompilateur
  de scripts MAGES (formats `.scx`/`.scs`) avec support du profil `steins_gate_hd`.
- **[mgs-spec-bank](https://github.com/CommitteeOfZero/mgs-spec-bank)** — banque de
  spécifications du moteur MAGES (opcodes, charsets, flags).
- **MagesPack** — empaqueteur/désempaqueteur des archives `.mpk` du moteur.

Sans le travail de rétro-ingénierie du **Committee of Zero**, aucune traduction tierce
de jeu MAGES ne serait possible. Énorme respect pour leur écosystème ouvert.

## Traduction française

Liste des contributeurs (par ordre chronologique d'arrivée) :

- *(à compléter — ouvrez une PR pour vous ajouter)*

## Police étendue

Les textures de police du jeu (`FONT.PNG`, `FONT2.PNG`) ont été étendues avec 27 glyphes
français additionnels rendus depuis Arial. Les caractères ajoutés sont : `é`, `è`, `ê`,
`ë`, `à`, `â`, `ä`, `î`, `ï`, `ô`, `ö`, `ù`, `û`, `ü`, `ç`, `œ`, `É`, `È`, `Ê`, `À`,
`Â`, `Î`, `Ï`, `Ô`, `Ù`, `Û`, `Ç`, plus quelques ligatures/typographie française
(guillemets `« »`, espaces fines insécables là où le moteur le permet).

Le charset associé (`steins_gate_hd-fr`) re-pointe les caractères Unicode FR vers les
nouveaux unit IDs dans la police modifiée. Voir
[font_patch_sg.py](../tools/font_patch_sg.py) côté monorepo de build (privé) pour les
détails techniques.

## Remerciements

Merci à tous les joueurs qui ont signalé des coquilles, des contresens ou des
formulations à revoir. C'est ce qui fait avancer le projet entre deux versions.

*El. Psy. Kongroo.*
