<?php

var_dump($_POST);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Récupération des données
    $name = $_POST['name'];
    $gender = $_POST['gender'];
    $country = $_POST['country'];
    $state = $_POST['state'];
    $city = $_POST['city'];
    $category = $_POST['category'];
    $amount = $_POST['amount'];
    $fraud = ($_POST['fraud'] === 'Oui') ? 1 : 0; // Conversion en booléen
    $likesMoney = $_POST['likesMoney'];
    $riskChoice = $_POST['riskChoice'];

    // Connexion à la base de données
    $conn = new mysqli('sql108.infinityfree.com', 'if0_37367293', 'nVEQDndt9uhs', 'if0_37367293_fraud_db');
    
    // Vérification de la connexion
    if ($conn->connect_error) {
        die('Erreur de connexion : ' . $conn->connect_error);
    } else {
        echo "✅ Super !";
    }

    // Requête SQL
    $stmt = $conn->prepare("INSERT INTO transactions (full_name, gender, country, state, city, category, amount, fraud_status, likes_money, risk_choice)
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    if ($stmt === false) {
        die('Erreur de préparation de la requête : ' . $conn->error);
    }

    // Liaison des paramètres
    $stmt->bind_param("ssssssdiis", $name, $gender, $country, $state, $city, $category, $amount, $fraud, $likesMoney, $riskChoice);

    // Exécution de la requête
    if ($stmt->execute()) {
        echo " Merci 😊";
    } else {
        echo "Erreur lors de l'exécution de la requête : " . $stmt->error;
    }

    $stmt->close(); // Fermeture des co
    $conn->close();

} else {
    echo "Aucune donnée soumise.";
}
?>
