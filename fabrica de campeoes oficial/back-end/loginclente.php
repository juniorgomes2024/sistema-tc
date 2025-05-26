<?php
include 'entradacliente.php';

$email = $_POST['email'];
$senha = md5($_POST['password']);

$Bd = new entradacliente();
$usuario = $Bd->select("SELECT * FROM cliente AS cl JOIN email AS em ON cl.idCliente = em.idCliente WHERE em.email = '$email' AND cl.senha = '$senha'");

if (!empty($usuario)) {
    session_start();
    $_SESSION['usuario'] = $usuario[0];
    header('Location: ../front-end/loja.html');
} else {
    header('Location: ../front-end/login.html?msg=1');
}
