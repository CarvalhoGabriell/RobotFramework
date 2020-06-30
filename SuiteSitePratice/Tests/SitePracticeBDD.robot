*** Settings ***
Resource           ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Case ***
Caso de Teste 02: Remover Produtos do Carrinho
    Acessar página home do site
    Adicionar "t-shirts" ao carrinho compras
    Excluir o produto do carrinho
    Conferir se o carrinho fica vazio


Caso de Test 05: Cadastar novo usuário no site
    [Tags]        sign
    Acessar página home do site
    Clicar em "Sign in"
    Verificar página de login do usuário
    Cadastar email válido: "gabiru@me99.com"
    Clicar no botão "Creat an account"
    Preencher dadods válidodos em "Your personal information"
    Clicar no botão "Register"
    Conferir se o cadastro foi feito com sucesso
