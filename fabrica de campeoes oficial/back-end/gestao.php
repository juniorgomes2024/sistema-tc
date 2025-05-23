<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "fabricadecampeoes";
$port = '3307';

$conn = new mysqli($servername, $username, $password, $dbname, $port);
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

$result = $conn->query("SELECT COUNT(*) as total FROM pedido");
$totalPedidos = $result->fetch_assoc();

$result = $conn->query("SELECT COUNT(*) as total FROM cliente");
$totalClientes = $result->fetch_assoc();

// $result = $conn->query("SELECT SUM(valor) as total FROM pedidos");
// $faturamentoTotal = $result->fetch_assoc();

// $result = $conn->query("SELECT COUNT(*) as total FROM estoque");
// $produtosEmEstoque = $result->fetch_assoc();

echo json_encode(array(
    'totalPedidos' => $totalPedidos['total'],
    'totalClientes' => $totalClientes['total'],
    // 'faturamentoTotal' => $faturamentoTotal['total'],
    // 'produtosEmEstoque' => $produtosEmEstoque['total']
));

