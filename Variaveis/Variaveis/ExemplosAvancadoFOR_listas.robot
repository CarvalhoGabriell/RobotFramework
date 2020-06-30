*** Test Cases ***
## exemplos usando FOR passando várias variaveis para ele percorrer

Test usando FOR com varias Variaveis
  Usando for com varias variaveis

Test de exemplo usando FOR com RANGE
  Usando(FOR) de forma tradicional
  Usando(FOR) passando a quantida do laço
  Usando(FOR) de forma Aritimética
  Usando(FOR) com intervalos específicos

*** Keywords ***
Usando for com varias variaveis
  [Documentation]           Percorrendo varias variaveis com seus respectivos valores.
  FOR       ${index}        ${marvel}             ${DC}       IN
...            1             Iron-Man              Batman
...            2             Namor                 Aquaman
...            3             Doctor Strange        Doutor Destino
...            4             Mercurio              Flash
...            5             Avengers              League of Justice
...            6             Nova                  Green Lantern
...            7             Ant Man               Eléktron
...            8             Novos Vingadores      Jovens Titãs
...            9             Hawkeye               Arrow
...            10            Spider Man            Super Choque

            Log     Super Heróis ${index}: Na Marvel:${marvel} Na-DC Comics:${DC}

  END

Usando(FOR) de forma tradicional
  [Documentation]      O FOR percorre 10 vezes de (0 até 9).Por Default entende que acaba em 10.
  FOR   ${index}    IN RANGE      10

        Log         O valor do contador é: ${index}
  END

Usando(FOR) passando a quantida do laço
  [Documentation]         O FOR percorre o laço 10 vezes (0 até 10), mas agora passandoo o valor seu limite.
  FOR    ${cont}      IN RANGE  0   11

        Log          O valor do contador é: ${cont}
  END


Usando(FOR) de forma Aritimética
  [Documentation]         O FOR percorre o laço 10 vezes (0 até 9), porem somando +1, rodando então até 10.
  ${VAR}    Set Variable      ${10}

  FOR   ${index}    IN RANGE    ${VAR} + 1

        Log           O valor do contador é: ${index}
  END


Usando(FOR) com intervalos específicos
  [Documentation]         O FOR percorre o laço de 0 até 50 pulando de 10 em 10
  FOR     ${index}      IN RANGE    0    51    10

        Log             O intervalo vai até 50 pulando de 10 - valor atual: ${index}
  END
