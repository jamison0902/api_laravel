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

        // Filtro por email
        if ($request->has('email')) {
            $query->where('email', 'like', '%' . $request->email . '%'); // Filtro de email
        }

        $users = $query->get();
        return response()->json($users);
    }

    // Cria um novo usuário
    public function store(Request $request)
    {
        $request->validate([
            'nome' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:usuarios,email',
            'cpf' => 'required|unique:usuarios,cpf',
            'perfil_id' => 'required|exists:perfis,id',
        ]);

        $user = Usuario::create($request->all());

        // Cria os endereços e associa ao usuário
        if ($request->has('enderecos')) {
            foreach ($request->enderecos as $enderecoData) {
                // Verifica se o endereço já existe
                $endereco = Endereco::firstOrCreate([
                    'cep' => $enderecoData['cep'],
                    'logradouro' => $enderecoData['logradouro'],
                    'bairro' => $enderecoData['bairro'],
                    'cidade' => $enderecoData['cidade'],
                    'estado' => $enderecoData['estado'],
                    'numero' => $enderecoData['numero'],
                    'complemento' => $enderecoData['complemento']
                ]);

                // Associa o endereço ao usuário na tabela intermediária
                $user->enderecos()->attach($endereco->id);
            }
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
        // Valida os dados do usuário
        $request->validate([
            'nome' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:usuarios,email,' . $id,
            'cpf' => 'required|unique:usuarios,cpf,' . $id,
            'perfil_id' => 'required|exists:perfis,id',
        ]);

        // Busca o usuário pelo ID
        $user = Usuario::findOrFail($id);

        // Atualiza os dados básicos do usuário
        $user->update($request->only(['nome', 'email', 'cpf', 'perfil_id']));

        // Atualiza os endereços, se enviados
        if ($request->has('enderecos')) {
            $enderecosEnviados = $request->enderecos;

            // IDs dos endereços enviados
            $enderecosIdsEnviados = [];

            foreach ($enderecosEnviados as $enderecoData) {
                // Verifica se o endereço já existe ou cria um novo
                $endereco = Endereco::firstOrCreate([
                    'cep' => $enderecoData['cep'],
                    'logradouro' => $enderecoData['logradouro'],
                    'bairro' => $enderecoData['bairro'],
                    'cidade' => $enderecoData['cidade'],
                    'estado' => $enderecoData['estado'],
                    'numero' => $enderecoData['numero'],
                    'complemento' => $enderecoData['complemento']
                ]);

                // Armazena o ID do endereço
                $enderecosIdsEnviados[] = $endereco->id;
            }

            // Atualiza a relação entre o usuário e os endereços
            $user->enderecos()->sync($enderecosIdsEnviados); // Remove associações não enviadas
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
