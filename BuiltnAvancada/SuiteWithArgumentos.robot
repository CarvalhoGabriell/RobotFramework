*** Settings ***
Documentation       Suite de testes para estudar a fundo a library Builtin do RobotFramework



*** Test Cases ***
Test case 01: Passsando argumentos com diferentes formas
  Argumentos básicos              1            10           99          23
  Argumentos básicos          arg1=1999     arg2=64      arg3=10     arg4=33

Test case 02: Passando argumentos opcionais como parâmetro
  Argumentos opcionais como paramento    name=Gabriel    last_name=Feranades
  Argumentos opcionais como paramento    name=Jonas      last_name=Kanwald    middle_name=Nielsen

Test case 03: Criando LISTAS e DICIONÁRIO via parâmetro
  Criando lista como paramentro             Gabriel    Sindy   Felipe    Adilson   Jobson    Cleybson
  Criando Dicionario como paramentro        name=Tony   sobrenome=Stark   tipo=Armadura
  Criando Listas e Dicionarios              Java    Ruby    RobotFramework  Python    Jscript   Docker    nome=Gabriel    idade=20    cargo=Estagiario


*** Keywords ***
Argumentos básicos
  [Arguments]     ${arg1}   ${arg2}   ${arg3}   ${arg4}
  Log             Os argumentos são: ${arg1} - ${arg2} - ${arg3} - ${arg4}


Argumentos opcionais como paramento
### OS paramentos opcionais ficam por ultimo quando declarados.
### O Robot é case-sensitive, ou seja se o PARAMETRO estiver em MAIUSCULO la na KEYWORD tem que está tambem!
  [Arguments]     ${name}       ${last_name}         ${middle_name}=carvalho
  Log              Nome Completo: ${name} ${middle_name} ${last_name}


Criando lista como paramentro
  [Arguments]     @{nomes}
  Log             Minha lista: ${nomes}


Criando Dicionario como paramentro
### Somento 1 dicionario pode ser Criado
  [Arguments]     &{meu_dicionario}
  Log             Heróis: ${meu_dicionario}


Criando Listas e Dicionarios
### Na criação de ambos, os argumentos da LISTAS vem em 1° e depois os do DICIONÁRIO
  [Arguments]     @{cursos}     &{dicionario_new}
  Log             Meus Cursos: ${cursos} Meus Dados: ${dicionario_new}
