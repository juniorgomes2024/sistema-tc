<?php
include 'entradacliente.php';

$host = 'localhost';
$user = 'root';
$password = ''; 
$database = 'fabricadecampeoes';
$port = '3306';

$conn = new mysqli($host, $user, $password, $database, $port);

if ($conn->connect_error) {
  die("Conexão falhou: " . $conn->connect_error);
}

$responsavel = 'fabricadecampeoestcc@gmail.com';
$senhaApp = 'rbwt qqkz hqfb xeyr';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require '../vendor/autoload.php';

$mail = new PHPMailer(true);

$email = $_POST['email'];
$telefone = $_POST['telefone'];
$nomeUser = $_POST['nome'];
$isGestao = $_POST['origem'] ?? '';
$senhaProvisoria = $nomeUser .'123';
$senhaBanco = md5($senhaProvisoria);
// senha 12345 = 827ccb0eea8a706c4c34a16891f84e7b

$Bd = new entradacliente();

if ($isGestao == 'gestao') {
    $usuario = $Bd->select("SELECT * FROM adm WHERE email = '$email' AND nome = '$nomeUser' AND telefone = '$telefone'");
}else{  
    $usuario = $Bd->select("SELECT * FROM cliente AS cl JOIN email AS em ON cl.idCliente = em.idCliente JOIN telefone AS tel ON cl.idCliente = tel.idCliente WHERE em.email = '$email' AND cl.nome = '$nomeUser' AND tel.numero = '$telefone'");
}

if (!empty($usuario)) {
    if ($isGestao == 'gestao') {
        $sql = "UPDATE adm SET senha = '$senhaBanco' WHERE nome = '$nomeUser'";
    }else{
       $sql = "UPDATE cliente SET senha = '$senhaBanco' WHERE nome = '$nomeUser'"; 
    }
       
    $conn->query($sql);

    try {
        $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
        $mail->isSMTP();                                            //Send using SMTP
        $mail->Host       = 'smtp.gmail.com';
        $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $mail->Username   = $responsavel;                           // Seu e-mail
        $mail->Password   = $senhaApp;                              // Senha de aplicativo (gerada pelo Google)
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
        $mail->Port       = 465; //ou 587

        //Recipients
        $mail->setFrom($responsavel, 'Mailer'); //email de envio 
        if (isset($email)) {
            $mail->addAddress($email, 'Cliente');
        } else {
            $mail->addReplyTo($responsavel, 'Email erro envio');   //Email de resposta 
        }

        //Content
        $mail->isHTML(true);                                    //Set email format to HTML
        $mail->Subject = 'Senha provisoria - Fabrica de Campeoes';                 //Assunto
        $mail->Body    = 'Nova senha provisoria: <b>' . $senhaProvisoria . '</b>';
        $mail->AltBody = 'Nova senha provisoria: ' . $senhaProvisoria;

        // Envia o e-mail
        $mail->send();

        echo "Email enviado com sucesso!";
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }
} else {
    echo "Usuário não encontrado.";
}