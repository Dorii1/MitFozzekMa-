<?php
session_start();

// Csak belépett felhasználó láthatja
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: login.html");
    exit;
}
?>

<!DOCTYPE html>
<html lang="hu">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recept feltöltése</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container my-5">
  <h2>Új recept feltöltése</h2>
  <form action="save_recipe.php" method="POST" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="title" class="form-label">Recept neve</label>
      <input type="text" class="form-control" id="title" name="title" required>
    </div>
    <div class="mb-3">
      <label for="description" class="form-label">Leírás</label>
      <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
    </div>
    <div class="mb-3">
      <label for="image" class="form-label">Kép feltöltése</label>
      <input type="file" class="form-control" id="image" name="image">
    </div>
    <button type="submit" class="btn btn-success">Mentés</button>
  </form>
</div>

</body>
</html>
