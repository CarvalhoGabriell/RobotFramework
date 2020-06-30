*** Test Cases ***
# Testando o uso do FOR ANIHADO

Teste do FOR aninhado
  Cria cadastro de produtos (FOR aninhado)



*** Keywords ***
### NOVO FORMATO DO Lopping FOR
Cria cadastro de produtos (FOR aninhado)
  FOR       ${PRODUTO}    IN    baby look   camiseta    blusa     regata
            Imprime os tamanhos dos produtos (FOR de dentro)      ${PRODUTO}
  END

Imprime os tamanhos dos produtos (FOR de dentro)
  [Arguments]   ${PRODUTO}
  FOR           ${TAMANHO}    IN       PP    P     M     G

                Log         Produtos: ${PRODUTO} - Tamanhos: ${TAMANHO}
  END
