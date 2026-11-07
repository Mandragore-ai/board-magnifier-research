# Plan de validation du prototype

## État des fichiers R09

La [notice R09](../prototype/R09/LIRE-AVANT-IMPRESSION.html) décrit le Galaxy A13 SM-A137F/DSN sans coque, les deux modules optiques ronds supposés Ø32 mm, leur entraxe de 82 mm, le boîtier, les attaches TPU, la LilyGo et la batterie. Les STL ont fait l'objet d'un contrôle automatique de fermeture des maillages, du nombre de composants et des intersections entre enveloppes nominales. Le fichier [`validation.json`](../prototype/R09/validation.json) donne le détail. **Aucune impression ni mesure de montage réel n'est attestée par ces contrôles.**

## Séquence minimale

1. Imprimer d'abord les quatre `TEST-*.stl`. Contrôler le téléphone réel, la carte optique et sa lentille, l'accès USB, les boutons et la retenue. Documenter les écarts de dimensions et ajuster le modèle avant d'imprimer le coffrage complet.
2. Monter un capteur, sans batterie, et lire ses déplacements sur plusieurs zones d'un plateau imprimé. Mesurer la hauteur de fonctionnement et les pertes de suivi. Ajouter le second capteur et vérifier le sens et l'échelle des deux axes.
3. Tracer sur le plateau des trajets connus : segment, rectangle, rotation sur place, retour au départ, passage sur zones peu texturées et zones chargées, puis soulèvement/repose du téléphone. Relever position et orientation vraies à la règle/gabarit, conserver les données brutes et les échecs.
4. Calibrer l'entraxe, les orientations des capteurs et les mm par unité de déplacement ; comparer un capteur, deux capteurs, deux capteurs + gyroscope, puis avec recalage manuel. Mesurer erreur médiane, 95e percentile, maximum et dérive au retour, séparément pour position et angle.
5. Tester ensuite un recalage ponctuel par caméra sur les mêmes trajets. Employer au moins un plateau et des trajets **non utilisés** pour régler l'algorithme.
6. Poser des figurines sur l'écran et mesurer la transformation de leurs coordonnées tactiles vers celles du plateau, en notant contacts manqués, contacts fantômes, rotation et occlusion. Identifier une pièce demande un test supplémentaire avec des socles adaptés.

## Critères de décision

Définir à l'avance la tolérance utile en fonction des cases ou zones du jeu. Un pourcentage de trames qui « sortent une position » ne suffit pas : une erreur de grande amplitude peut être plus gênante qu'une perte de suivi annoncée. Le prototype doit déclarer explicitement « position inconnue » quand l'incertitude dépasse la tolérance. Les chiffres existants ne permettent pas encore de choisir ce seuil.

Les vidéos ou plateaux de jeux tiers utilisés pour l'analyse restent hors du dépôt public. Les données de mesure partageables peuvent être anonymisées et dénuées d'image de jeu, avec accord de leurs contributeurs.
