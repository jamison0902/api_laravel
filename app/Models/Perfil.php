<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Perfil extends Model
{
    use HasFactory;

    protected $table = 'perfis'; // Especifica a tabela

    protected $fillable = [
        'nome',
    ];

    // Define o relacionamento com o Usuário
    public function usuarios()
    {
        return $this->hasMany(Usuario::class);
    }
}
