<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    use HasFactory;
    // Especifica a tabela
    protected $table = 'usuarios'; 
    
    // Habilita os timestamps
    public $timestamps = true;

    // Define as colunas de timestamps
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $fillable = [
        'nome',
        'email',
        'cpf',
        'perfil_id',
    ];

    // Define o relacionamento com o Perfil
    public function perfil()
    {
        return $this->belongsTo(Perfil::class);
    }

    // Define o relacionamento Muitos para Muitos com Endereços
    public function enderecos()
    {
        return $this->belongsToMany(Endereco::class, 'usuario_endereco', 'usuario_id', 'endereco_id');
    }
}

