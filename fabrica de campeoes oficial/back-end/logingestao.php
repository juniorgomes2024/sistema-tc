<?php
include 'entradaadm.php';

$email = $_POST['email'];
$senha = md5($_POST['password']);

/*
Senha criptografada md5
12345 → 827ccb0eea8a706c4c34a16891f84e7b
*/

$Bd = new entradaadm();
$usuario = $Bd->select("SELECT * FROM adm WHERE email = '$email' AND senha = '$senha'");

if (!empty($usuario)) {
    session_start();
    $_SESSION['usuario'] = $usuario[0];
    header('Location: ../front-end/gestao.html');
} else {
    header('Location: ../front-end/gestao_login.html?msg=1');
}