*** Settings ***
Documentation      Documentação da API: https://fakerestapi.azurewebsites.net/api/Books
Resource           ResourceAPI.robot
Suite Setup        Conectar a minha API

*** Test Cases ***
Caso de test 1: Buscar usando o metodo (GET) todos os livros da API
    Requisitar todos os livros
    Conferir o status code    200
    Conferir o reason   OK
    Conferir se retorna uma lista de livros    200

Caso de test 2: Buscar um livro especifico com (GET e o ID)
    Requisitar um livro especifico    23
    Conferir o status code    200
    Conferir o reason   OK
    Conferir os dados que retornanram do livro 23

Cadastrar novo livro (POST)
    Cadastrar um novo livro
    Conferir os dados que retornanram do livro cadastrado

Deletar um Book (DELETE)
    Deletar um livro da lista     45
    Conferir status code          200
    Conferir o reason             OK
    Conferir o body
