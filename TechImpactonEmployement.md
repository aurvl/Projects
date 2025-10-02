---
title: "Inégalités de genre et technologie : ce que nous apprend l’économétrie spatiale"
datePublished: Tue May 06 2025 19:36:05 GMT+0000 (Coordinated Universal Time)
cuid: cmacwtsjt000008l45hqpa7v3
slug: inegalites-de-genre-et-technologie-ce-que-nous-apprend-leconometrie-spatiale
cover: https://cdn.hashnode.com/res/hashnode/image/upload/v1746559959694/355c5d40-ddcb-4928-9359-6a0069769b06.png
ogImage: https://cdn.hashnode.com/res/hashnode/image/upload/v1746560143744/995a1dac-e975-411c-bff9-771d6094c6f6.png
tags: spatial-data, data-visualisation-1, economics, econometrics

---

Dans cette ère de progrès technologique, l’impact des nouvelles technologies sur le marché du travail – et notamment sur les inégalités de genre – est devenu un sujet central. Ma récente étude, *« Technological employment and gender inequalities: the contrasting effects of progress on female unemployment in France, Spain, Italy, the Netherlands, and Belgium »*, explore comment l’automatisation, la numérisation et l’innovation transforment l’emploi féminin en Europe occidentale.

[Lien vers le dépot GitHub](https://github.com/aurvl/SpatialEconometrics)

---

## Introduction

L’emploi féminin reste un enjeu majeur en Europe. Malgré les progrès en éducation et en insertion professionnelle, les inégalités persistent, notamment dans les secteurs technologiques. Automatisation, numérisation et innovation créent de nouvelles opportunités, mais renforcent aussi certains déséquilibres. Mon étude explore ces dynamiques à travers une approche économétrique spatiale, en analysant l’impact des avancées technologiques sur le chômage féminin en France, Espagne, Italie, Pays-Bas et Belgique.

---

## Les données

J’ai utilisé des données Eurostat (2012–2021), couvrant 770 observations pour 73 régions européennes. Les variables clés incluent :

* **taux de chômage féminin**
    
* emploi technologique
    
* part de main-d’œuvre en science et technologie (HRST)
    
* PIB régional
    
* part de population diplômée du supérieur
    
* densité de population
    

Ces données, organisées en panel, permettent d’explorer à la fois des dynamiques temporelles et géographiques.

### Ce que montre les données…

* **Chômage féminin moyen** : 11,6 %
    
* **Emploi dans les technologies** : 3,32 % en moyenne
    
* **Disparités régionales** : les régions les plus riches (Île-de-France, Nord de l’Italie) affichent un chômage féminin plus faible, tandis que le sud de l’Europe reste plus exposé.
    

---

## Visualisation : entre progrès et disparités

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1746558745182/ba2b8a0b-bf96-4e93-9408-4e8725cf4329.png align="center")

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1746558762890/01c693ba-7d42-4f54-a178-b84842ea929d.png align="center")

Les cartes montrent une baisse générale du chômage féminin, notamment en Espagne et en Italie. Cependant, certaines régions comme l’Andalousie ou la Sicile restent fragiles, dépendantes de secteurs précaires comme le tourisme. En parallèle, les régions riches (Île-de-France, nord de l’Italie) offrent des emplois plus stables, mais leur croissance ne suffit pas à réduire les inégalités.

---

## Méthodologie : l’approche spatiale

Dans cette étude, je ne me suis pas contenté d’analyser chaque région séparément. J’ai aussi regardé : **Comment les régions influencent leurs voisines ?**. Par exemple, si le chômage baisse en Catalogne, cela peut-il aider les régions proches ?

Pour mesurer ces effets, j’ai utilisé des modèles dits spatiaux. Ils permettent de savoir si le chômage féminin dans une région dépend aussi de ce qui se passe autour

---

## Résultats des modèles spatiaux

Grâce à un modèle **SAR (Spatial Autoregressive) à effets fixes**, j’ai analysé les effets directs et de voisinage entre les régions.

### Résultats principaux :

/Une **augmentation de 1 % de l’emploi technologique** réduit le chômage féminin de :

* **0,52 point localement**
    
* **0,41 point dans les régions voisines**
    

Une **hausse de 1 % des travailleurs hautement qualifiés en sciences et technologies (HRST)** **augmente paradoxalement** le chômage féminin de :

* **0,51 point localement**
    
* **0,4 point dans les régions voisines**
    

**L’enseignement supérieur** réduit le chômage féminin de **0,75 point au total**.

**Le PIB et la densité de population** ont un effet direct limité.

Ces résultats montrent que, bien que l’expansion technologique offre des opportunités, la montée en compétition dans les STEM (Science, Technology, Engineering and Mathematics) peut exclure les femmes si les barrières structurelles persistent.

---

## En somme…

<mark>L’augmentation des emplois technologiques réduit nettement le chômage féminin, localement et dans les régions voisines.<br>En revanche, la hausse des travailleurs qualifiés en sciences et technologies accroît la concurrence et peut aggraver le chômage des femmes.<br>Enfin, la croissance économique seule a peu d’impact, mais l’éducation supérieure reste un levier important pour améliorer l’emploi féminin.</mark>

---

## Pourquoi c’est important ?

Cette étude révèle qu’une croissance économique générale ne suffit pas à corriger les inégalités de genre. Il faut des politiques ciblées pour :

* Favoriser la **formation numérique et technologique** des femmes
    
* Encourager l’**accès équitable aux postes qualifiés**
    
* Soutenir l’**entrepreneuriat féminin**
    
* Promouvoir des **politiques d’emploi inclusives**
    

Sans cela, les bénéfices du progrès risquent de laisser de côté la moitié de la population.

---

## 📚 Références

* Autor et al. (2015)
    
* Blau & Kahn (2017)
    
* Bertrand (2018)
    
* Goldin (2014)
    

La liste complète des références et les détails techniques sont disponibles dans le [dépôt](https://github.com/aurvl/SpatialEconometrics).
