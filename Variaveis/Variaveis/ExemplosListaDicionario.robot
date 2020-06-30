*** Settings ***
Documentation     Exemplos de tipo de variáveis: simples, listas e dicionários.

Library           SeleniumLibrary

*** Variables ***
## variaveis simples
${VAR_GLOBAL}       Tipos de variaveis no robot!!!

## variaveis para listas
@{CARROS}           civic   clio    nissan    up    ferrari   porsche

## variaveis para dicionários
&{PESSOA}           nome=Gabriel      sobrenome=Carvalho     email=gabiru@robot.io     idade=22      sexo=Masculino
*** Test Cases ***
Caso de teste 01
  Uma keyword qualquer
  Usando LOGS de diferentes formas
  Usando LOGS com screenshot usando o Selenium


*** Keywords ***
Uma keyword qualquer
  Log     ${VAR_GLOBAL}

  Log     Meu carro preferido é: ${CARROS[3]} , mas também pode ser o: ${CARROS[4]}

  Log     O aluno: ${PESSOA.nome} com o sobrenome: ${PESSOA.sobrenome}, tem ${PESSOA.idade} anos de idade

Usando LOGS de diferentes formas
  Log To Console      Posso logar a saída no console!!!1
  Log Many            Posso logar com minha lista completo @{CARROS}

Usando LOGS com screenshot usando o Selenium
  Log                           Em testes Web é possivel fazer screenshot com Seleniu Library
  Open Browser                  https://robotframework.org/#libraries   firefox
  Capture Page Screenshot       primeiro_screenshot.png
  Close Browser
