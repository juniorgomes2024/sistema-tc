<?php
$host = 'localhost';
$user = 'root';
$password = ''; 
$database = 'fabricadecampeoes';
$port = '3306';

$conn = new mysqli($host, $user, $password, $database, $port);

if ($conn->connect_error) {
  die("Conexão falhou: " . $conn->connect_error);
}

$sql = "SELECT * FROM produto";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../front-end/estoque.css" />

  <title>Estoque Atual</title>
  <style>
    table { border-collapse: collapse; width: 80%; margin: auto; }
    th, td { padding: 8px 12px; border: 1px solid #ccc; text-align: left; }
    th { background-color: #f2f2f2; }
    h1 { text-align: center; }
  </style>
</head>
<body>
  <p><a href="../front-end/estoque.html">Cadastrar Estoque</a></p>
  <p><a href="../front-end/gestao.html">Dashboard</a></p>

  <section class="table-container">
    <h1>Produtos em Estoque</h1>
    <table>
      <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Descrição</th>
        <th>Quantidade</th>
        <th>Preço (R$)</th>
      </tr>
      <?php
      if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
          echo "<tr>
            <td>{$row['idProduto']}</td>
            <td>{$row['nome']}</td>
            <td>{$row['descricao']}</td>
            <td>{$row['quantidade']}</td>
            <td>" . number_format($row['preco'], 2, ',', '.') . "</td>
          </tr>";
        }
      } else {
        echo "<tr><td colspan='5'>Nenhum produto encontrado.</td></tr>";
      }
      $conn->close();
      ?>
    </table>
          <div class="padding-top" style="text-align:center;">
            <button class="btn-atualizar"><i class="bx bx-refresh"></i> Atualizar Estoque</button>
          </div>
  </section>
  
</body>
</html>
