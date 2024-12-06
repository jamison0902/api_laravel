<?php

namespace App\Http\Controllers\Api;

use App\Models\Endereco;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EnderecoController extends Controller
{
    // Exibe todos os endereços
    public function index()
    {
        $enderecos = Endereco::all();  // Pode adicionar filtros se necessário
        return response()->json($enderecos);
    }

    // Cria um novo endereço
    public function store(Request $request)
    {
        $request->validate([
            'cep' => 'required|string|max:8',
            'logradouro' => 'required|string|max:255',
            'bairro' => 'required|string|max:100',
            'cidade' => 'required|string|max:100',
            'estado' => 'required|string|max:2',
            'numero' => 'required|string|max:10',
            'complemento' => 'nullable|string|max:255',
        ]);

        $endereco = Endereco::create($request->all());

        return response()->json($endereco, 201);
    }

    // Exibe um endereço específico
    public function show($id)
    {
        $endereco = Endereco::findOrFail($id);
        return response()->json($endereco);
    }

    // Atualiza um endereço existente
    public function update(Request $request, $id)
    {
        $request->validate([
            'cep' => 'required|string|max:8',
            'logradouro' => 'required|string|max:255',
            'bairro' => 'required|string|max:100',
            'cidade' => 'required|string|max:100',
            'estado' => 'required|string|max:2',
            'numero' => 'required|string|max:10',
            'complemento' => 'nullable|string|max:255',
        ]);

        $endereco = Endereco::findOrFail($id);
        $endereco->update($request->all());

        return response()->json($endereco);
    }

    // Deleta um endereço
    public function destroy($id)
    {
        Endereco::destroy($id);
        return response()->json(null, 204);
    }
}
