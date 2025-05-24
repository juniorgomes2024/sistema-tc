<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "fabricadecampeoes";
$port = '3306';

$conn = new mysqli($servername, $username, $password, $dbname, $port);
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

//Dashboard data

//Resgata pedidos cadastrados
$result = $conn->query("SELECT COUNT(*) as total FROM pedido");
$totalPedidos = $result->fetch_assoc();

//Resgata qtd clientes cadastrados
$result = $conn->query("SELECT COUNT(*) as total FROM cliente");
$totalClientes = $result->fetch_assoc();

//Resgata valor total → total investido em produtos ou vendidos?
// $result = $conn->query("SELECT SUM(valor) as total FROM pedidos");
// $faturamentoTotal = $result->fetch_assoc();

//Resgata qtd produtos cadastrados
$result = $conn->query("SELECT SUM(quantidade) as total FROM produto");
$produtosEmEstoque = $result->fetch_assoc();

echo json_encode(array(
    'totalPedidos' => $totalPedidos['total'],
    'totalClientes' => $totalClientes['total'],
    // 'faturamentoTotal' => $faturamentoTotal['total'],
    'produtosEmEstoque' => $produtosEmEstoque['total']
));

