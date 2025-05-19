<?php
// Conexão com o banco
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "fabricadecampeoes";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

// Dados do formulário
$nome = $_POST['nome'];
$email = $_POST['email'];
$telefone = $_POST['telefone'];
$logradouro = $_POST['logradouro'];
$uf = $_POST['uf'];
$endereco = $_POST['endereco'];  // Se não for usar, remova do HTML
$cpf_cnpj = $_POST['cpf_cnpj'];
$datanasc = $_POST['datanasc'];
$senha = $_POST['senha']; 


// Inserir cliente
$stmt = $conn->prepare("INSERT INTO cliente (nome, cpfCnpj, dataNasc, senha) VALUES (?, ?, ?,?)");
$stmt->bind_param("ssss", $nome, $cpf_cnpj, $datanasc, $senha);

if ($stmt->execute()) {
    $idCliente = $stmt->insert_id;

    // Email
    $stmtEmail = $conn->prepare("INSERT INTO email (email, idCliente) VALUES (?, ?)");
    $stmtEmail->bind_param("si", $email, $idCliente);
    $stmtEmail->execute();

    // Telefone
    $stmtTel = $conn->prepare("INSERT INTO telefone (numero, idCliente) VALUES (?, ?)");
    $stmtTel->bind_param("si", $telefone, $idCliente);
    $stmtTel->execute();

    // Endereço 
    $stmtEnd = $conn->prepare("INSERT INTO endereco (logradouro, complemento, idCliente, idCidade) VALUES (?, '', ?, 1)");
    $stmtEnd->bind_param("si", $endereco, $idCliente);
    $stmtEnd->execute();

    // estado
    $stmtEstado = $conn->prepare("INSERT INTO estado (UF, descricao) VALUES (?, ?)");
    $stmtEstado->bind_param("ss", $uf, $uf);

    

    

    echo "<script>alert('Cadastro realizado com sucesso!'); window.location.href='../front-end/login.html';</script>";
} else {
    echo "Erro ao cadastrar: " . $stmt->error;
}


// Verifica se o Estado já existe
$stmtEstado = $conn->prepare("SELECT idEstado FROM Estado WHERE UF = ?");
$stmtEstado->bind_param("s", $uf);
$stmtEstado->execute();
$resultEstado = $stmtEstado->get_result();

if ($resultEstado->num_rows > 0) {
    $rowEstado = $resultEstado->fetch_assoc();
    $idEstado = $rowEstado['idEstado'];
} else {
    // Se não existir, insere novo estado com descrição igual ao UF
    $stmtInsertEstado = $conn->prepare("INSERT INTO Estado (UF, descricao) VALUES (?, ?)");
    $stmtInsertEstado->bind_param("ss", $uf, $uf);
    $stmtInsertEstado->execute();
    $idEstado = $stmtInsertEstado->insert_id;
}

// Verifica se já existe uma cidade genérica "Capital" no estado
$stmtCidade = $conn->prepare("SELECT idCidade FROM Cidade WHERE descricao = 'Capital' AND idEstado = ?");
$stmtCidade->bind_param("i", $idEstado);
$stmtCidade->execute();
$resultCidade = $stmtCidade->get_result();

if ($resultCidade->num_rows > 0) {
    $rowCidade = $resultCidade->fetch_assoc();
    $idCidade = $rowCidade['idCidade'];
} else {
    // Se não existir, insere cidade genérica chamada "Capital"
    $stmtInsertCidade = $conn->prepare("INSERT INTO Cidade (descricao, idEstado) VALUES ('Capital', ?)");
    $stmtInsertCidade->bind_param("i", $idEstado);
    $stmtInsertCidade->execute();
    $idCidade = $stmtInsertCidade->insert_id;
}

$conn->close();

?>
