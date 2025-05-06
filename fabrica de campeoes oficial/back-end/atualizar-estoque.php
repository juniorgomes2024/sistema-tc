<?php
$conn = new mysqli("localhost", "root", "", "fabricadecampeoes");

if ($conn->connect_error) {
  die("Conexão falhou: " . $conn->connect_error);
}

$id = $_POST['id'];
$quantidade = $_POST['quantidade'];

$sql = "UPDATE produto SET quantidade = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $quantidade, $id);

if ($stmt->execute()) {
  echo "Estoque atualizado com sucesso.";
} else {
  echo "Erro ao atualizar: " . $conn->error;
}

$conn->close();
?>
