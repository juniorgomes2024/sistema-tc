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
$globalUsuario = $_SESSION['usuario'];

function cadastrarPedidoCarrinho($conn, $itens) {  
    // Gera um id_compra para ser cadastrado no banco
    $protCompra = uniqid('#');
    
    global $globalUsuario;
    $idCliente = $globalUsuario['idCliente'];
    date_default_timezone_set('America/Sao_Paulo');
    $dtPedido = date('Y-m-d H:i:s');

    if ($idCliente == null) {
        http_response_code(401);
        echo "Usuário não autenticado.";
        exit;
    }

    foreach ($itens as $item) {
        $idEstoque = $item['id'];
        $descricao = $item['nome'];
        $quantidade = $item['quantidade'];
        $vlCompra = $item['total'];

        $stmt = $conn->prepare("INSERT INTO pedido (idCliente, descricao, quantidade, dtPedido, idEstoque, vlCompra, protCompra) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("isisids", $idCliente, $descricao, $quantidade, $dtPedido, $idEstoque, $vlCompra, $protCompra);
        $stmt->execute();
    }

    http_response_code(200);
    echo "Itens processados com sucesso.";
}

cadastrarPedidoCarrinho($conn, $itens);

