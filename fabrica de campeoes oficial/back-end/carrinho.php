<?php
// Conexão com o banco
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "fabricadecampeoes";
$port = '3306';

$conn = new mysqli($servername, $username, $password, $dbname, $port);
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

// Dados do formulário
$itens = json_decode(file_get_contents('php://input'), true);

if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest') {
    $carrinho = json_decode($_POST['itens'], true);
    $itens = $carrinho;
}

session_start();
$usuario = $_SESSION['usuario'];
$idCliente = $usuario['idCliente'];

// Inserir pedido
foreach ($itens as $item) {
    $nome = $item['nome'];
    $preco = $item['preco'];
    $quantidade = $item['quantidade'];
    // $total = $item['total']; precisamos cadastrar o valor para recuperar no dashboard

    $stmt = $conn->prepare("INSERT INTO pedido (idCliente, descricao, quantidade) VALUES (?, ?, ?)");
    $stmt->bind_param("isi", $idCliente, $nome, $quantidade);
    $stmt->execute();
}

http_response_code(200);
echo "Itens processados com sucesso.";