<?php
$conn = new mysqli("localhost", "root", "", "fabricadecampeoes");

if ($conn->connect_error) {
  die("Conexão falhou: " . $conn->connect_error);
}

$nome = $_POST['nome'];
$descricao = $_POST['descricao'];
$quantidade = $_POST['quantidade'];
$preco = $_POST['preco'];

$sql = "INSERT INTO produtos (nome, descricao, quantidade, preco) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssid", $nome, $descricao, $quantidade, $preco);

if ($stmt->execute()) {
  echo "Produto cadastrado com sucesso.";
} else {
  echo "Erro ao cadastrar: " . $conn->error;
}

$conn->close();
?>
