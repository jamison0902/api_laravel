## Introdução

 Este projeto tem como objetivo fornecer uma API em Laravel para realizar o cadastro de usuários, permitindo que um frontend (como Vue.js, React, ou outro) interaja com a aplicação para cadastrar, visualizar, editar e excluir usuários. A API estará pronta para ser consumida em sistemas web ou móveis.

## Recursos

- Linguagem de programação PHP 8.1; 
- Laravel Framework 10.48.25
- Banco de Dados Open Source PostgreSQL 15.4; 
- Docker Desktop 4.36.0;
- Postman Version 11.21.0;

## Orientação

- * O arquivo **cadastro.sql** contém uma cópia do banco utilizado.
- O arquivo **docker-compose.yml** contém uma configuração para criar um container no docker, vpcê precisa alterar a localização do projeto nessa linha do código **C:/laravel:/app ** trocando C:/laravel por um local de sua preferencia aonde está o projeto

## Endpoint Usuarios

- GET /users: Lista todos os usuários.
- GET /users/{id}: Exibe um usuário específico.
- POST /users: Cria um novo usuário.
- PUT /users/{id}: Atualiza um usuário existente.
- DELETE /users/{id}: Deleta um usuário.

| ![Imagem 1](users_get.png) | ![Imagem 2](users_get_id.png) | ![Imagem 3](users_post.png) | ![Imagem 4](users_put.png) | ![Imagem 5](users_delete.png) |
|---|---|---|---|---|