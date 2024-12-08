<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Endereco extends Model
{
    protected $table = 'cadastro.enderecos';  // Especificando o schema

    // Os campos que são atribuíveis em massa
    protected $fillable = [
        'cep', 
        'logradouro', 
        'bairro', 
        'cidade', 
        'estado', 
        'numero', 
        'complemento',
    ];

    // Caso esteja utilizando timestamps (created_at, updated_at)
    public $timestamps = false;  

    // Define o relacionamento Muitos para Muitos com Usuários
    public function usuarios()
    {
        return $this->belongsToMany(
            Usuario::class,
            'cadastro.usuario_endereco', // Nome da tabela intermediária
            'endereco_id',               // Chave estrangeira em 'usuario_endereco' apontando para 'enderecos'
            'usuario_id'                 // Chave estrangeira em 'usuario_endereco' apontando para 'usuarios'
        );
    }
}
