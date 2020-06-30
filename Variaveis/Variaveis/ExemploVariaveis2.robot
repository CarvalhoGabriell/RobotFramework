*** Settings ***

Documentation       Exemplos de como usar variaveis no Robot!

*** Variables ***
#variavel para dicionários
&{PESSOA}      nome=Gabriel Gabriru      idade=17       email=gabiru@123.io


*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer dentro da swicth.


*** Keywords ***
Uma keyword qualquer dentro da swicth.
    Uma subkeyword com argumentos      ${PESSOA.nome}   ${PESSOA.email}.
    ${MENSASGEM_ALERTA}                Uma subkeyword com retorno     ${PESSOA.nome}    ${PESSOA.idade}
    Log                                ${MENSASGEM_ALERTA }

Uma subkeyword com argumentos
    [Arguments]     ${NOME_USUARIO}     ${EMAIL_USUARIO}
    Log             Nome do usuário: ${NOME_USUARIO}
    Log             Email do usuário: ${EMAIL_USUARIO}


Uma subkeyword com retorno
    [Arguments]     ${NOME_USUARIO}     ${IDADE_USUARIO}
    ${MENSAGEM}     Set variable if     ${IDADE_USUARIO}<18     Usário ${NOME_USUARIO} é menor de idade, Acesso negado!
    [Return]        ${MENSAGEM}
