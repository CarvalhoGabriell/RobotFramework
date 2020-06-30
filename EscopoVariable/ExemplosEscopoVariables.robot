*** Settings ***
Documentation         http://robotframework.org/robotframework/latest/libraries/BuiltIn.html
...                   Exemplos de como pode utlizar escopos de variáveis nos testes com o RobotFramework.
...                   Exemplos utilizados: GLOBAIS, SUITE, TEST (test case), LOCAL (keywords).
Library               String

*** Variables ***
${GLOBAL_INSTANCIADA}        Posso ser usada em todos os testes e em diferentes Suites


*** Test Cases ***
Caso de teste 01: Exemplos de como usar Variables
  Exemplo de uma keyword 1
  Exemplo de uma keyword 2

Caso de teste 02: Exemplos de como usar Variables
  Exemplo de uma keyword 3

Caso de test 03: Exemplos de como usar Variables
  Exemplo de uma keyword 4

*** Keywords ***

Exemplo de uma keyword 1
  ${GLOBAL_CRIADA_TEMPO_EXECUCAO}    Generate Random String
  Set Global Variable                ${GLOBAL_CRIADA_TEMPO_EXECUCAO}
  Set Suite Variable                 ${SUITE_CRIADA_TEMPO_EXECUCAO}      Robot suite, variavel da suite de test
  Set Test Variable                  ${TEST01}                           Variavel apenas do TEST CASE 01
  ${VARIABLE_LOCAL}                  Set Variable                        Variavel local apenas da keyword 1
  Log                                ${TEST01}

Exemplo de uma keyword 2
  ${VARIABLE_LOCAL}         Set Variable      Variavel local apenas da keyword 2!
  Log       Mostrando a variavel Global criada em tempo de execução: ${GLOBAL_CRIADA_TEMPO_EXECUCAO}
  Log       Mostrando a variavel da Suite criada em tempo de execução: ${SUITE_CRIADA_TEMPO_EXECUCAO}
  Log       Mostrando a variavel Local criada dentro dda keyword: ${VARIABLE_LOCAL}
  Log       Mostrando a variavel Global : ${GLOBAL_INSTANCIADA}
  Log       ${TEST01}

Exemplo de uma keyword 3
  ${VARIABLE_LOCAl}        Set Variable       Variavel local apenas da keyword 3!
  Log             Mostrando a variavel Global criada em tempo de execução: ${GLOBAL_CRIADA_TEMPO_EXECUCAO}
  Log             Mostrando a variavel da Suite criada em tempo de execução: ${SUITE_CRIADA_TEMPO_EXECUCAO}
  Log             Mostrando a variavel Global : ${GLOBAL_INSTANCIADA}
##  Log             ${TEST01}

Exemplo de uma keyword 4
  ${VARIABLE_LOCAl}        Set Variable       Variavel local apenas da keyword 4!
  Set Test Message         Olá robotizador!!!
  Set Test Variable        ${TEST03}          Variavel apenas do TEST CASE 03
  Log             Mostrando a variavel Global criada em tempo de execução: ${GLOBAL_CRIADA_TEMPO_EXECUCAO}
  Log             Mostrando a variavel da Suite criada em tempo de execução: ${SUITE_CRIADA_TEMPO_EXECUCAO}
  Log             Mostrando a variavel Global : ${GLOBAL_INSTANCIADA}
