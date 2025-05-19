<?php
include 'entradacliente.php';

$email = $_POST['email'];
$senha = $_POST['password'];

$Bd = new entradacliente();
$usuario = $Bd->select("SELECT * FROM cliente WHERE email = '$email' AND senha = md5('$senha')");

if (!empty($usuario)) {
    session_start();
    $_SESSION['usuario'] = $usuario[0];
    header('Location: ../front-end/loja.html');
} else {
    header('Location: ../front-end/login.html?msg=1');
}
