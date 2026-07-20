# Steins;Gate — Traduction française

Patch de traduction française non officiel pour **Steins;Gate** (version Steam, *app id 412830*).

Le visual novel de MAGES./5pb./Nitroplus n'a jamais eu de version française officielle.
Ce patch comble le manque : tous les textes du jeu (scénario principal, TIPS, SMS, attachments,
interface) sont traduits depuis la version anglaise officielle, avec une police étendue pour
afficher les accents français.

> **Statut** — v1.0.1, jouable de bout en bout. La traduction couvre l'intégralité des chapitres
> du scénario (Prologue → Chapitre 11), les TIPS, l'interface et les SMS. Quelques imperfections
> subsistent (voir [limitations connues](#limitations-connues)), mais tout est lisible et
> cohérent. Les retours sont les bienvenus.

---

## Sommaire

- [Pré-requis](#pré-requis)
- [Installation](#installation)
- [Désinstallation](#désinstallation)
- [Ce qui est traduit](#ce-qui-est-traduit)
- [Limitations connues](#limitations-connues)
- [Signaler un problème](#signaler-un-problème)
- [Crédits](#crédits)
- [Mentions légales](#mentions-légales)

---

## Pré-requis

1. **Steins;Gate** sur Steam ([page du jeu](https://store.steampowered.com/app/412830/)).
   La version Steam (JAST/Nitroplus, *app id 412830*) est la seule prise en charge.
2. Windows 10 ou 11. (Linux/Steam Deck via Proton, voir [FAQ](docs/faq.md).)

Aucun patch tiers (Committee of Zero ou autre) n'est nécessaire : le patch FR est entièrement
autonome. Il remplace simplement deux fichiers du dossier `USRDIR/` du jeu.

> **Steins;Gate Elite (app 819030) n'est PAS supporté** — c'est un autre moteur, complètement
> différent. Idem pour les autres jeux de la série (Steins;Gate 0, Linear Bounded Phenogram,
> My Darling's Embrace).

## Installation

### Méthode automatique (recommandée)

1. [Téléchargez la dernière release](../../releases/latest) (fichier `.zip`).
2. Décompressez l'archive où vous voulez.
3. Double-cliquez sur **`install.bat`**.

Le script localise automatiquement votre installation Steam, sauvegarde les fichiers originaux
(`script.mpk.bak` et `system.mpk.bak`) et copie la VF par-dessus.

Si Steam est installé dans un endroit non standard, le script vous demandera le chemin du
jeu manuellement.

### Méthode manuelle

Si vous préférez tout faire à la main :

1. Trouvez le dossier d'installation du jeu, par exemple :
   `…\steamapps\common\STEINS;GATE\USRDIR\`
2. Sauvegardez les fichiers originaux :
   - `script.mpk` → `script.mpk.bak`
   - `system.mpk` → `system.mpk.bak`
3. Copiez `patch\script.mpk` et `patch\system.mpk` (de cette release) dans `USRDIR\`,
   en écrasant les anciens.

C'est tout. Lancez le jeu via Steam : le texte est en français.

## Désinstallation

Double-cliquez sur **`uninstall.bat`**. Le script restaure les `.bak`.

À défaut, vérifiez l'intégrité des fichiers via Steam (clic droit sur le jeu → Propriétés →
Fichiers installés → Vérifier l'intégrité).

## Ce qui est traduit

| Contenu | Statut |
|---|---|
| Scénario principal (Prologue + Chapitres 1 à 11) | Traduit (100 %) |
| TIPS (encyclopédie du jeu) | Traduit (~99 %) |
| Interface, menus, écrans système | Traduit (~99 %) |
| Attachments (documents, photos, mémos) | Traduit (~92 %) |
| SMS / Phone messages | Traduit (~80 %) |
| Sous-titres des cinématiques (OP/ED) | **Pas encore** |
| Images de fond avec texte (panneaux, journaux) | **Pas encore** |

**Total : 34 223 / 34 689 lignes traduites (98,7 %).**

Le delta sur les SMS et attachments correspond surtout à des lignes courtes que le pipeline
de traduction laisse en l'état (noms propres, codes, sigles).

## Limitations connues

- **Police étendue intégrée.** La police d'origine de Steins;Gate (Steam) ne contient pas
  les accents français au-delà de quelques caractères basiques. Le patch FR remplace
  également `system.mpk` pour fournir une police modifiée incluant `é`, `è`, `à`, `ç`, `ê`,
  `î`, `ô`, `û`, `ü`, `ï`, `œ`, etc. Le rendu est propre dans les boîtes de dialogue, mais
  certaines polices secondaires (TIPS, SMS) peuvent occasionnellement présenter un léger
  décalage de baseline sur les caractères ajoutés.
- **Pas de polish éditorial.** La traduction est cohérente, le glossaire des termes-clés
  (Reading Steiner, Lignes du monde, Convergence, D-mail, SERN, Lab Member, Future Gadget
  Lab, Hououin Kyouma, etc.) est respecté d'un fichier à l'autre, les voix des personnages
  sont distinctes — mais il reste sûrement des tournures perfectibles. Si vous voyez quelque
  chose qui pique, dites-le (voir plus bas).
- **Compatible uniquement avec la version Steam (app 412830).** Pas Elite, pas Switch,
  pas PS Vita, pas iOS.
- **Sauvegardes** — vos sauvegardes existantes restent compatibles. Vous pouvez basculer
  entre VF et VO sans rien perdre, mais la langue affichée est celle du fichier `script.mpk`
  installé au moment du chargement.

## Signaler un problème

- **Faute, contresens, formulation bizarre** : ouvrez une [issue](../../issues) avec si
  possible une capture d'écran et le passage concerné.
- **Crash ou bug technique** : précisez votre OS, la version exacte du jeu (Propriétés
  Steam → onglet Mises à jour → Build ID), et ce qui se passait au moment du crash.
- **Suggestion plus large** (terme à retraduire, ton à revoir sur un personnage…) : pareil,
  une issue fait très bien l'affaire.

Les corrections seront intégrées au fil des versions. La numérotation suit
[SemVer](https://semver.org/) — voir [CHANGELOG.md](CHANGELOG.md).

## Crédits

- **MAGES. / 5pb. / Nitroplus** — créateurs de Steins;Gate. Tous les droits sur le jeu,
  les personnages, les illustrations, la bande son et le scénario original leur appartiennent.
- **JAST USA / Nitroplus** — pour la localisation anglaise officielle qui sert de base à
  cette VF.
- **Committee of Zero** — pour leurs travaux de rétro-ingénierie sur le moteur MAGES
  (`coalesc3`, `MagesScriptTool`, `mgs-spec-bank`) qui rendent possibles toutes les
  traductions tierces, y compris celle-ci.
- **Contributeurs de la VF** — voir [docs/credits.md](docs/credits.md).

## Mentions légales

Patch fan-made, non officiel, gratuit, distribué sans aucun lien commercial avec les
ayants droit. Aucun fichier original du jeu n'est inclus dans cette release : seules les
versions modifiées (compilées sous forme de `script.mpk` et `system.mpk`) sont fournies.
Pour l'utiliser, il faut posséder le jeu sur Steam.

Le code de l'installeur (`install.ps1`, `uninstall.ps1`) est sous licence MIT — voir
[LICENSE](LICENSE). Le contenu textuel de la traduction est mis à disposition sous licence
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.fr) : libre à
quiconque de le reprendre, le corriger ou le redistribuer pour un usage non commercial,
à condition de créditer le projet et de partager les modifications dans les mêmes
conditions.

Si un ayant droit souhaite que ce patch soit retiré, qu'il ouvre une issue ou nous
contacte directement et il sera retiré sans discussion.

---

*El. Psy. Kongroo.*
