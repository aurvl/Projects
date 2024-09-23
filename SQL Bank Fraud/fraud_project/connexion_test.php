<?php

// Ce script PHP permet de tester la connexion à la base de données phpmyadmin / MySQL. Tout d'abord, vous devez renseigner les variables $servername, $username, $password, et $dbname avec les informations spécifiques à votre base de données. Le serveur est généralement "localhost", mais cela peut varier (127.0.0.1 pour MySQL). Après avoir rempli ces informations, le script va tenter d'établir une connexion avec la base de données en utilisant la classe mysqli. Si la connexion échoue, un message d’erreur sera affiché expliquant la nature du problème. En revanche, si la connexion réussit, un message de confirmation s’affiche pour indiquer que la base de données est accessible.

$servername = ""; // remplissez ces champs
$username = "";
$password = "";
$dbname = "";

// Cconnexion
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérif de la connexion
if ($conn->connect_error) {
    die("Erreur de connexion : " . $conn->connect_error);
} else {
    echo "Connexion la base de données réussie";
}

$conn->close(); // fermeture e la connexion
?>
