<?php
include 'entradaadm.php';

$email = $_POST['email'];
$senha = $_POST['password'];

$Bd = new entradaadm();
$usuario = $Bd->select("SELECT * FROM adm WHERE email = '$email' AND senha = md5('$senha')");

if (!empty($usuario)) {
    session_start();
    $_SESSION['usuario'] = $usuario[0];
    header('Location: ../front-end/gestao.html');
} else {
    header('Location: ../front-end/gestao_login.html?msg=1');
}