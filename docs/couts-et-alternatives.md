# Coûts et alternatives

**Relevé du 7 novembre 2026.** Prix affichés, hors livraison sauf mention contraire. Les prix et stocks changent ; demander un devis avant achat. Le téléphone et le plateau déjà possédés ne sont pas inclus.

## Pièces vérifiées

| Composant | Prix affiché | Rôle et réserve |
|---|---:|---|
| [LilyGo T7-S3](https://lilygo.cc/en-us/products/t7-s3) | **7,93 $** l'unité, **rupture de stock** affichée | Microcontrôleur envisagé pour deux capteurs ; vérifier disponibilité, alimentation et protocole du montage final |
| [Carte PMW3360 complète avec lentille, Lectronz](https://lectronz.com/products/pmw3360-motion-sensor) | **30,42 $** l'unité, **rupture de stock** au relevé | Référence de prix pour un module assemblé ; son format 28 × 21 mm diffère des cartes rondes Ø32 mm prises en compte par le R09 |
| [EEMB LP603449, SOS electronic](https://www.soselectronic.com/en-um/products/eemb/lp603449-1-157437) | **5,65 € HT** l'unité, **3,87 € HT** à 100 unités | Batterie nominale du R09 ; polarité, connecteur et câble d'adaptation à vérifier avant branchement |

Deux cartes de **comparaison** à 30,42 $, une LilyGo à 7,93 $ et une batterie à 5,65 € HT totalisent **68,77 $ + 5,65 € HT**. Les monnaies sont laissées séparées pour éviter un taux de change arbitraire. Ce total exclut impression 3D, visserie, câblage, port, TVA et assemblage. Les cartes de comparaison sont indisponibles et **ne rentrent pas directement dans le coffrage R09** ; la LilyGo est également affichée en rupture. Ce calcul donne un ordre de grandeur des principaux composants, pas le prix du prototype prêt à construire.

Le module rond Ø32 mm réellement prévu, ses lentilles, ses frais de livraison, le coût matière/temps d'impression et le prix d'une série n'ont **pas de devis vérifié**. La conception R09 devra être ajustée si un autre module est acheté. Un prix de vente ou un coût de série serait prématuré.

## Alternatives étudiées

| Variante | Coût additionnel indicatif | Ce qu'elle apporte | Limite constatée ou à tester |
|---|---|---|---|
| Caméra arrière du téléphone seul | Aucun composant supplémentaire si le téléphone est déjà disponible | Recalage sur texture et parfois sur lignes, sans électronique ajoutée | Pertes longues et dérive dans les vidéos examinées ; demande distance et lumière adaptées |
| IMU du téléphone seule | Aucun composant supplémentaire | Déplacement et arrêts détectables dans le laboratoire logiciel | Dérive de la position absolue ; pas de précision physique validée |
| Souris optique existante rigidement fixée | Matériel déjà possédé possible ; support à chiffrer | Déplacement relatif rapide à explorer | Une souris libre ne localise pas le téléphone ; un seul capteur confond mouvement et rotation |
| Deux capteurs optiques + microcontrôleur | Composants ci-dessus, version exacte à deviser | Mesure relative de translation et rotation sous le téléphone | Hauteur optique, texture, patins et électronique non validés physiquement |
| Codes/repères imprimés ou calage manuel | Impression ou adaptation du plateau à chiffrer | Point de référence absolue | Exige une modification autorisée du plateau ou une intervention de l'utilisateur |
| Caméra en complément des deux capteurs | Utilise la caméra du téléphone | Recalage ponctuel envisagé sans modifier le plateau | Fusion non encore mesurée |

**Choix provisoire :** deux capteurs optiques et un recalage manuel pour le premier prototype complet, puis comparaison avec le recalage caméra. La décision finale dépendra de l'erreur mesurée en millimètres et en degrés sur plusieurs trajets et plusieurs plateaux.
