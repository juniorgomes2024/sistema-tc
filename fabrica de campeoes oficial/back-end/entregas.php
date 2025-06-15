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

//ultimos pedidos
$result = $conn->query("SELECT 
  p.protCompra,
  c.nome AS nomeCliente,
  t.numero AS telefone,
  p.dtPedido AS dataPedido,
  pr.nome AS nomeProduto,
  pr.descricao AS descricaoProduto,
  COALESCE(e.status, 'aguardando') AS status
FROM 
  pedido as p
  INNER JOIN cliente as c ON p.idCliente = c.idCliente
  INNER JOIN telefone as t ON c.idCliente = t.idCliente
  INNER JOIN produto as pr ON p.idEstoque = pr.idProduto
  LEFT JOIN entrega as e ON p.protCompra = e.idPedido
  ORDER BY p.dtPedido DESC
  LIMIT 25 ");
$ultimosPedidos = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode(array(
    'ultimosPedidos' => $ultimosPedidos,
));

//Encerra conexão
$conn->close();