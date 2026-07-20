# Changelog

Le format suit [Keep a Changelog](https://keepachangelog.com/fr/1.1.0/) et la numérotation
suit [SemVer](https://semver.org/lang/fr/).

## [1.0.1] — 2026-07-20

### Corrigé
- Remplacement du `script.mpk` publié par erreur dans la v1.0.0, qui ne contenait
  qu'un seul script traduit sur 190. Le scénario, les TIPS, les SMS, les attachments
  et l'interface utilisent maintenant bien les tables françaises.
- Le patch public conserve les voix japonaises d'origine ; aucun doublage expérimental
  n'est inclus.

## [1.0.0] — 2026-05-06

### Ajouté
- Première release publique du patch FR pour Steins;Gate (Steam, app id 412830).
- Traduction complète du scénario (Prologue + Chapitres 1 à 11), soit ~32 200 lignes.
- Traduction des TIPS (~99 %), de l'interface et des écrans système (~99 %).
- Traduction des attachments (documents, mémos) à ~92 % et des SMS à ~80 %.
- Police étendue (`system.mpk` modifié) avec accents français : `é`, `è`, `à`, `ç`, `ê`,
  `î`, `ô`, `û`, `ü`, `ï`, `œ`, `É`, `È`, etc.
- Installeur PowerShell + wrapper `.bat` avec auto-détection de l'installation Steam.
- Désinstalleur qui restaure les `.bak` (`script.mpk.bak` et `system.mpk.bak`).
- Documentation complète : guide d'installation détaillé, FAQ, crédits.

### Limitations
- Les sous-titres des cinématiques (OP, ED, vidéos `.mp4`) ne sont pas encore traduits.
- Les images de fond contenant du texte (panneaux, journaux, écrans d'ordi) restent en
  anglais.
- Quelques lignes d'attachments et SMS restent en anglais (noms propres, codes, sigles).

### Compatibilité
- Compatible Steins;Gate Steam build 2014 (JAST/Nitroplus).
- Compatible Windows 10 et 11.
- Pas testé sur Steam Deck / Proton (devrait fonctionner via copie manuelle).
- **Incompatible avec Steins;Gate Elite, Steins;Gate 0, et les autres jeux de la série.**
