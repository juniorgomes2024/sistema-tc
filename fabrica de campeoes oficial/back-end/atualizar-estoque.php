<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "fabricadecampeoes";
$port = '3306';

$conn = new mysqli($servername, $username, $password, $dbname, $port);

if ($conn->connect_error) {
  die("Conexão falhou: " . $conn->connect_error);
}

$id = $_POST['id'];
$quantidade = $_POST['quantidade'];

// Consultar quantidade atual do produto
$sqlConsulta = "SELECT quantidade FROM produto WHERE idProduto = ?";
$stmtConsulta = $conn->prepare($sqlConsulta);
$stmtConsulta->bind_param("i", $id);
$stmtConsulta->execute();
$stmtConsulta->bind_result($quantidadeAtual);
$stmtConsulta->fetch();
$stmtConsulta->close();

// Atualizar quantidade do produto
$novaQuantidade = $quantidadeAtual + $quantidade;
$sqlUpdate = "UPDATE produto SET quantidade = ? WHERE idProduto = ?";
$stmtUpdate = $conn->prepare($sqlUpdate);
$stmtUpdate->bind_param("ii", $novaQuantidade, $id);

if ($stmtUpdate->execute()) {
  echo "<script>alert('Estoque atualizado com sucesso.'); window.location.href = '../front-end/estoque.html';</script>";
} else {
  echo "Erro ao atualizar: " . $conn->error;
}

$conn->close();
?>
