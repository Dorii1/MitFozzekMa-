<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $message = htmlspecialchars($_POST['message']);

    $to = "infomitfozzekma@gmail.com";  
    $subject = "Kapcsolatfelvétel: $name";
    $body = "Név: $name\nEmail: $email\n\nÜzenet:\n$message";
    $headers = "From: $email\r\nReply-To: $email";

    if (mail($to, $subject, $body, $headers)) {
        echo "Köszönjük az üzenetet, hamarosan válaszolunk!";
    } else {
        echo "Hiba történt az üzenet küldése közben.";
    }
}
?>

<?php
session_start();
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: login.html");
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title = htmlspecialchars($_POST['title']);
    $description = htmlspecialchars($_POST['description']);

    $file = fopen("receptek.txt", "a");
    fwrite($file, "Recept neve: $title\n");
    fwrite($file, "Leírás: $description\n");
    fwrite($file, "----------------------\n");
    fclose($file);

    echo "<h2> A recept elmentve!</h2>";
    echo "<a href='upload.php'>Vissza</a>";
}
?>

