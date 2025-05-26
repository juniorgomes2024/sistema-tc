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

$nome = $_POST['nome'];
$descricao = $_POST['descricao'];
$quantidade = $_POST['quantidade'];
$preco = $_POST['preco'];

$sql = "INSERT INTO produto (nome, descricao, quantidade, preco) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
//var_dump($conn,$stmt, $sql); // Debugging line to check if the statement is prepared correctly
$stmt->bind_param("ssid", $nome, $descricao, $quantidade, $preco);

if ($stmt->execute()) {
  echo "Produto cadastrado com sucesso.";
  //fazer redirecionamento para a página de produtos
  header("Location: ../front-end/estoque.html"); // Redireciona para a página de produtos
} else {
  echo "Erro ao cadastrar: " . $conn->error;
}

$conn->close();
?>
