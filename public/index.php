<?php
require_once __DIR__ . '/../vendor/autoload.php';

use App\Controllers\HomeController;
use App\Controllers\AuthController;
use App\Controllers\SaleController;
use App\Core\Router;
use App\Core\AuthMiddleware;

session_name('sessao_cliente');
session_start();

$router = new Router();

$router->addMiddleware(new AuthMiddleware(), [], ['/login', '/logout', '/register', '/']);

$router->get('/', [HomeController::class, 'index']);

$router->get('/login', [AuthController::class, 'showLoginForm']);
$router->post('/login', [AuthController::class, 'login']);
$router->get('/register', [AuthController::class, 'showRegisterForm']);
$router->post('/register', [AuthController::class, 'register']);
$router->get('/logout', [AuthController::class, 'logout']);

$router->get('/product/{id}', [SaleController::class, 'show']);
$router->post('/cart/add', [SaleController::class, 'addToCart']);
$router->get('/cart', [SaleController::class, 'cart']);
$router->get('/checkout', [SaleController::class, 'checkout']);
$router->get('/order/success', [SaleController::class, 'success']);

$router->dispatch();
