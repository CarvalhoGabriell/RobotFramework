*** Settings ***
Documentation       Suite de teste para exemplificar o uso de IF em keywords e nos casos de testes.


Library             SeleniumLibrary
*** Variables ***
@{COMIDA}           churrasco   strogonoff    pizza     fastfood    açaí

*** Test Cases ***
Caso de teste exemplo 01
  Rodando uma keyword com condição - true
  Rodando uma keyword com condição - false
  Armazenando um valor em uma variavel de acordo com a condição

*** Keywords ***
Rodando uma keyword com condição - true
  Run Keyword If      '${COMIDA[1]}' == 'strogonoff'        Log     O item número 1 é Strogonoff

Rodando uma keyword com condição - false
  Run Keyword Unless      '${COMIDA[2]}' == 'fastfood'      Log     O item número 2 não é Fastfood

Armazenando um valor em uma variavel de acordo com a condição
  ${VAR}      Set Variable If     '${COMIDA[2]}' == 'pizza'     churrasco
  Log       Minha variavel VAR tem o valor de: ${VAR}
