# Analyse de l'Indice d’Attention portée à l’Environnement (IAE) dans les Accords Commerciaux Préférentiels (ACPr)

<img src = "IAETrends/dashboard/tr1.png" alt = "tr1" width ="600"/>

## Description du projet

Ce projet a pour objectif de mesurer l'importance accordée aux questions environnementales dans les Accords Commerciaux Préférentiels (ACPr) à l'aide de l'**Indice d’Attention portée à l’Environnement (IAE)**. Cet indicateur est calculé à partir des données fournies par la **[Trade & Environment Database (TREND)](https://www.chaire-epi.ulaval.ca/en/trend)**, une base de données complète et reconnue qui recense les clauses environnementales des accords commerciaux internationaux.

Le processus s'articule autour de l'utilisation de plusieurs outils analytiques, dont **Python**, **Excel**, et **Power BI**, pour extraire, transformer, analyser et visualiser les données.

## But du projet

L'objectif final de ce projet est de produire un **rapport interactif Power BI** qui présente de manière visuelle et accessible l’Indice d’Attention portée à l’Environnement (IAE) par accord et par pays. Ce rapport servira à comprendre l'engagement des différents pays dans les clauses environnementales de leurs accords commerciaux, et à comparer les performances des pays à travers l'IAE.

## Étapes détaillées

### 1. **Préparation des données**
   - **Extraction et nettoyage des données** : Les fichiers .csv issus de la base TREND sont importés et nettoyés. Cela inclut la suppression de colonnes non pertinentes et la gestion des valeurs manquantes.
   - **Ajout de nouvelles données** : De nouveaux individus (accords) sont introduits au dataset pour des analyses plus précises.

### 2. **Calcul de l'IAE**
   - **Filtrage des données** : Les colonnes correspondant aux clauses environnementales sont sélectionnées.
   - **Calcul des scores** : Des scores sont attribués à chaque accord en fonction de son engagement envers les clauses environnementales.
   - **Normalisation** : Ces scores sont ajustés sur une échelle de 1 à 10, puis un score global est calculé pour chaque accord en prenant la moyenne quadratique des scores normalisés.

### 3. **Analyse par pays**
   - **Agrégation des scores IAE par pays** : Les scores sont regroupés par pays pour analyser leur engagement environnemental dans plusieurs accords.
   - **Nettoyage des noms des pays** : Les noms des pays sont standardisés à l’aide de la fonction `VLOOKUP` dans **Excel**, avant d’être réintroduits dans les analyses Python.

### 4. **Exportation des données**
   - Les résultats des calculs sont exportés dans des fichiers .csv et Excel pour être utilisés dans Power BI. Les fichiers finaaux contiennent des données sur le nombre de normes signées, les années de signature des accords, et les scores IAE moyens par pays, etc.

### 5. **Création du rapport Power BI**
   - **Visualisation des données** : Un rapport interactif Power BI est créé, présentant des graphiques et des cartes pour visualiser les scores IAE et les engagements environnementaux des pays. Le rapport inclut également des analyses temporelles sur les accords signés.

## Datasets utilisés
- **TREND 2022 (trend2022.csv)** : Base principale contenant les informations sur les clauses environnementales des ACPr ([TREND](https://www.chaire-epi.ulaval.ca/en/trend)).
- **TREND Dyadic 2022 (trenddyadic2022.csv)** : Données spécifiques aux pays impliqués dans ces accords ([TREND](https://www.chaire-epi.ulaval.ca/en/trend)).
- **Infos Accords (infos_accords.csv)** : Données régionales sur les accords commerciaux ([DESTA](https://www.designoftradeagreements.org/downloads/)).

## Outils et librairies utilisés
- **Python** : Principal langage utilisé pour l’analyse et le traitement des données. Librairies utilisées :
   - **Pandas** : Manipulation des données.
   - **NumPy** : Calculs mathématiques et manipulation de matrices.
   - **Matplotlib & Seaborn** : Visualisation des données.
- **Excel** : Utilisé pour le nettoyage des noms de pays à l’aide de la fonction **`VLOOKUP`**.
- **Jupyter Notebook** : Utilisé pour développer et documenter le code Python.
- **Power BI** : Outil de création de rapports interactifs pour visualiser les résultats sous forme de graphiques et de cartes.
  
Pour un aperçu plus détaillé du processus de création de l'indicateur IAE et une explication technique complète, vous pouvez consulter le **PDF** ci-dessous :

**[Télécharger le PDF détaillant la création de l’indicateur IAE](https://drive.google.com/file/d/1m1CoiJk8brmNx2D9m2sQcm7lRcRZim5W/view?usp=sharing)**
