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
    public $timestamps = false;  // Como você não tem esses campos na tabela
}
