<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\EnderecoController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Rota de Usuários
Route::get('users', [UserController::class, 'index']);           // Listar todos os usuários
Route::get('users/{id}', [UserController::class, 'show']);        // Exibir um usuário específico
Route::post('users', [UserController::class, 'store']);           // Criar um novo usuário
Route::put('users/{id}', [UserController::class, 'update']);      // Atualizar um usuário
Route::delete('users/{id}', [UserController::class, 'destroy']);  // Deletar um usuário

// Rota de Endereços
Route::get('endereco', [EnderecoController::class, 'index']);    // Listar todos os endereços
Route::post('endereco', [EnderecoController::class, 'store']);   // Criar um novo endereço
Route::get('endereco/{id}', [EnderecoController::class, 'show']); // Exibir um endereço específico
Route::put('endereco/{id}', [EnderecoController::class, 'update']); // Atualizar um endereço
Route::delete('endereco/{id}', [EnderecoController::class, 'destroy']); // Deletar um endereço

// Rota para exibir endereços sem usuários
Route::get('/enderecos/unlinked', [EnderecoController::class, 'unlinked']);


// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });