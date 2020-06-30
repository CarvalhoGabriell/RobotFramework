*** Settings ***
Documentation       Suite de exemplos de teste de como implementar o Lopping FOR no Robotframework!!

*** Variables ***
@{FRUTAS}     abacaxi   uva   melancia    laranja


*** Test Cases ***
Caso de teste 01
  Usando FOR com RANGE
  Usando FOR com lista
  Saindo de um loop FOR
  Usando a keyword REPEAT


*** Keywords ***
Usando FOR com RANGE
    FOR     ${CONTADOR}   IN RANGE     1    6
            Log   Meu contador atual é: ${CONTADOR}.O Range vai de 1 até 5.
            Run Keyword If    ${CONTADOR} == 5         Log   Fim do looping FOR
    END

Usando FOR com lista
    FOR    ${ITEM}   IN    @{FRUTAS}
           Log                 Minha fruta é: ${ITEM}
           Run Keyword If      '${ITEM}' == 'laranja'     Log    O looping acabou!!
    END
Saindo de um loop FOR
    FOR    ${ITEM}   IN    @{FRUTAS}
           Exit For Loop If      '${ITEM}' == 'melancia'
           Log                   Minha fruta é: ${ITEM}
    END
Usando a keyword REPEAT
    Repeat Keyword    5       Log     Usando a keyword REPEAT!!!
