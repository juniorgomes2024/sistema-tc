<?php

session_start();
$globalUsuario = $_SESSION['usuario'] ?? null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    if (isset($data['acao']) && $data['acao'] === 'destruir-sessao') {
        session_destroy();
        header('Content-Type: application/json');
        echo json_encode(['destruiuSessao' => true]);
        exit;
    }
}

if ($globalUsuario) {
    header('Content-Type: application/json');
    http_response_code(200);
    echo json_encode(['podeAcessar' => true,'mensagem' => 'Usuário conectado']);
    exit;
} else {
    header('Content-Type: application/json');
    http_response_code(401);
    echo json_encode(['podeAcessar' => false,'mensagem' => 'Usuário desconectado']);
    exit;
}



