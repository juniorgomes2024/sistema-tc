<?php
$conn = new mysqli("localhost", "root", "", "fabricadecampeoes");

if ($conn->connect_error) {
  die("Conexão falhou: " . $conn->connect_error);
}

$id = $_POST['id'];
$quantidade = $_POST['quantidade'];

$sql = "UPDATE produto SET quantidade = ? WHERE idProduto = ?";
$stmt = $conn->prepare($sql);

$stmt->bind_param("ii", $quantidade, $id);

if ($stmt->execute()) {
  echo 'alert( "Estoque atualizado com sucesso.")';
  echo "<script>window.location.href = '../front-end/estoque.html';</script>";
} else {
  echo "Erro ao atualizar: " . $conn->error;
}

$conn->close();
?>
