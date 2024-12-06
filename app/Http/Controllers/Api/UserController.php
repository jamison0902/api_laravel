<?php

namespace App\Http\Controllers\Api;

use App\Models\Usuario;
use App\Models\Endereco;
use App\Models\Perfil;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    // Exibe todos os usuários com filtros
    public function index(Request $request)
    {
        $query = Usuario::with('perfil', 'enderecos');

        if ($request->has('name')) {
            $query->where('nome', 'like', '%' . $request->name . '%');
        }

        if ($request->has('cpf')) {
            $query->where('cpf', $request->cpf);
        }        

        $users = $query->get();
        return response()->json($users);
    }

    // Cria um novo usuário
    public function store(Request $request)
    {
        $request->validate([
            'nome' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:usuarios',
            'cpf' => 'required|unique:usuarios',
            'perfil_id' => 'required|exists:perfis,id',
        ]);

        $user = Usuario::create($request->all());

        // Vincula endereços, se enviados
        if ($request->has('enderecos')) {
            $user->enderecos()->attach($request->enderecos);
        }

        return response()->json($user, 201);
    }

    // Exibe um usuário específico
    public function show($id)
    {
        $user = Usuario::with('perfil', 'enderecos')->findOrFail($id);
        return response()->json($user);
    }

    // Atualiza um usuário existente
    public function update(Request $request, $id)
    {
        $user = Usuario::findOrFail($id);
        $user->update($request->all());

        // Atualiza os endereços, se enviados
        if ($request->has('enderecos')) {
            $user->enderecos()->sync($request->enderecos);
        }

        return response()->json($user);
    }

    // Deleta um usuário
    public function destroy($id)
    {
        Usuario::destroy($id);
        return response()->json(null, 204);
    }
}
