# État de la recherche

## Question technique

Connaître à chaque instant la position et l'angle d'un téléphone qui glisse sur un plateau imprimé, puis projeter les contacts de figurines sur son écran dans le repère de ce plateau. Le téléphone reste utilisable comme interface et fenêtre d'information. La position du téléphone, la détection d'un contact, l'identité d'une figurine et l'interprétation des règles sont quatre mesures distinctes.

## Travaux réalisés

### Calage manuel et capteurs du téléphone

Le banc `physical-board` du sandbox Mandragore sait afficher le plateau, régler son échelle et l'aligner manuellement. Il comprend un laboratoire de mouvement fondé sur les capteurs Android et des vues d'expérimentation. Ces fonctions constituent un banc d'essai logiciel ; la précision physique visée n'a pas été mesurée. L'accéléromètre intégré deux fois dérive. La caméra frontale regarde le plafond lorsque l'écran est vers le haut et n'offre pas de repère du plateau.

### Caméra arrière du Galaxy A13

Une vidéo de 30,02 s (902 images, 901 transitions) a été analysée à environ 1 cm du plateau. Le suivi initial a rendu une position sur 406/901 transitions (45,1 %), la mémoire v1 sur 349/901 (38,7 %), et la mémoire avec reprise locale v2 sur 495/901 (54,9 %). Le retour dans la zone initiale à 29 s est confirmé visuellement par 67 correspondances SIFT. La v2 a été ajustée sur la vidéo évaluée ; ce n'est ni un test aveugle ni une mesure d'erreur en millimètres.

Sur trois scènes de test à grille, l'ajout des lignes à la texture améliore la disponibilité d'une position : 22,6 % sur la grille vierge, 79,7 % sur le décor, 98,2 % sur le décor avec microcodes. Un passage du dernier essai présente pourtant environ 1 612 pixels et 35° de divergence par rapport au repère Micro-GPS. La sortie d'une position ne prouve donc pas sa justesse.

Un essai sur un extrait vidéo du plateau HF4A a donné 11 positions globales confirmées sur 186 images, 17 courtes positions relatives et 156 images sans position. Les zones ponctuellement retrouvées justifient l'étude d'un recalage visuel, sans établir un suivi continu.

### Capteurs optiques sous le téléphone

Un support R09 a été modélisé pour deux cartes optiques rondes de diamètre annoncé 32 mm, entraxe 82 mm, sous un Galaxy A13. Le déplacement de deux points distincts peut en principe livrer translation et rotation de l'ensemble. Le pas réel sur les textures des plateaux, le glissement des patins, la hauteur lentille-plateau, la synchronisation, le soulèvement et la dérive restent à mesurer. Aucune capture physique des PMW ne figure dans ce dossier.

La caméra arrière pourrait être utilisée **ponctuellement** pour rattacher la trajectoire relative à une image ou un repère du plateau. Cette fusion n'a pas été exécutée sur un enregistrement commun PMW + caméra. Une procédure de calage manuel reste nécessaire au prototype, notamment après une levée du téléphone.

## Décision actuelle

Construire et mesurer d'abord le montage à **deux capteurs optiques** avec calage manuel. Garder la caméra pour les essais de recalage opportuniste. Mesurer séparément le suivi du téléphone et les contacts des figurines, puis seulement leur composition. Les repères imprimés ajoutés au plateau sont une option si le plateau peut être modifié et si l'éditeur l'autorise.

## Sources de travail internes

Les chiffres ci-dessus ont été extraits des dossiers locaux suivants, qui contiennent aussi des images ou vidéos de jeu non republiées ici :

- `output/a13-camera-only-20261025/RESULTATS-A13.html`
- `output/a13-grid-microgps-20261025/RESULTATS-MICROGPS-GRILLES-A13.html`
- `mandragore-sandbox-prod-sync/experiments/tabletop-kit/physical-board/markerless/README.md`
- `mandragore-sandbox-prod-sync/experiments/tabletop-kit/physical-board/README.md`
- `output/stl/HF4A-A13-R09/validation.json`

Références techniques publiques : [RP2040/PMW3360](https://github.com/jfedor2/rp2040-pmw3360), [LilyGo T7-S3](https://github.com/Xinyuan-LilyGO/T7-S3), [SurfaceSliding](https://www2.informatik.uni-stuttgart.de/zdi/buecherei/NCSTRL_listings/FAK/2016.html.en), [Minput](https://www.chrisharrison.net/index.php/Research/Minput). Elles étayent l'intérêt de l'approche, sans valider ce prototype.
