# Analyse des Exportations et Importations Belges (1995-2023)

#### Structure de ce projet
```
Stock previsions/
   |- Stock Previsions.md : Project Documentation
   |- expimp belgique.csv : Dataset contenant les données sur les import et export belge entre 95 et 2023
   |- time series analysis.pdf : Un document pdf retraçant tout ce qui a été réalisé durant cette étude.
```
## Description

Ce rapport présente une analyse économétrique des exportations et des importations de la Belgique, réalisée dans le cadre d'un cours de Master 1 en Économie à l'Université Côte d'Azur. L'étude examine les séries temporelles du commerce extérieur belge pour comprendre les tendances historiques, évaluer les relations entre les variables, et fournir des prévisions sur une période de 10 trimestres. Le rapport se divise en deux grandes parties : une analyse univariée des séries temporelles pour explorer les caractéristiques individuelles et une analyse multivariée pour examiner les interactions entre les différentes séries.

## Objectifs

Les objectifs principaux de cette étude sont :

1. **Explorer les tendances et caractéristiques des exportations et importations belges.**
2. **Évaluer la stationnarité des séries temporelles.**
3. **Identifier les relations entre les exportations et les importations.**
4. **Fournir des prévisions sur 10 trimestres pour aider à l'adaptation des stratégies commerciales.**
5. **Comprendre la dynamique du commerce extérieur belge et son impact sur l'économie nationale.**

## Le dataset

Les données utilisées dans cette étude incluent :

- Séries temporelles trimestrielles des exportations et importations belges.
- Période couverte : 1995 à 2023.
- Source : Eurostat.
- Caractéristiques : Volumes chaînés (2010), exprimés en millions d'euros, désaisonnalisés et corrigés des effets de calendrier.

## Outils

- **Logiciels d'analyse statistique et économétrique** : R et EViews.
- **Techniques d'analyse des séries temporelles** :
  - Tests de stationnarité (ADF).
  - Modèles VAR (Vector Autoregression).
  - Tests de causalité de Granger.
  - Analyse de cointégration.
- **Méthodes de prévision** basées sur les modèles VAR.


Pour plus de détails, veuillez vous référer au document pdf fourni dans ce dépôt (time series analysis.pdf).
