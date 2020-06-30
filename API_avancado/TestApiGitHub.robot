*** Settings ***
Documentation       Exemplo de como fazere autenticação, passar parametros e headers com a API do GitHub.
...                 Link da Documentação da API do GitHub:  https://developer.github.com/v3/
Library             Collections
Library             RequestsLibrary
Resource            ./resource/my_user_github.robot

*** Variables ***
${GITHUB_HOST}      https://api.github.com
${ISSUES_URI}       /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues


*** Test Cases ***
Test 1: Fazendo uma Autenticação básica (Authentication)
  Conectar com autenticação básica na API do GitHub
  Solicitar os dados do usuário

Test 2: Fazendo uma requisição Usando parâmetros (Parms)
  Conectar na API do GitHub SEM autenticação
  Pesquisar issues com o state "open" e com o label "bug"

Test 3: Colocando Reactions em uma issue no repositorio usando (Headers)
  Conectar com autenticação básica na API do GitHub
  Enviar a reação "eyes" para a issue "8"
## TIPOS DE REAÇÃO: "rocket", "heart", "eyes", "+1", "-1", "hooray".

*** Keywords ***
Conectar com autenticação básica na API do GitHub
  ${AUTH}     Create List      ${USER_GITHUB}      ${PASSWORD_GITHUB}
  Create Session      alias=mygithubAuth      url=${GITHUB_HOST}      auth=${AUTH}    disable_warnings=True

Solicitar os dados do usuário
  ${RESP_USER}     Get Request      mygithubAuth     /user
  Log              Meus dados: ${RESP_USER.json()}
  Confere sucesso na requisição      ${RESP_USER}

Confere sucesso na requisição
  [Arguments]        ${RESPONSE}
  Should Be True    '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
  ...  msg=Erro na requisição! Verifique: ${RESPONSE}
  Log               ${RESPONSE.status_code}

Conectar na API do GitHub SEM autenticação
  Create Session      alias=mygithubAuth    url=${GITHUB_HOST}    disable_warnings=True

Pesquisar issues com o state "${STATE}" e com o label "${LABEL}"
  &{PARAMS}         Create Dictionary      state=${STATE}      label=${LABEL}
  ${SHE_ISSUES}     Get Request        mygithubAuth     uri=${ISSUES_URI}    params=${PARAMS}
  Log               Issues do repositorio do curso: ${SHE_ISSUES.json()}
  Confere sucesso na requisição     ${SHE_ISSUES}

Enviar a reação "${REACTION}" para a issue "${ISSUE_NUMBER}"
  ${HEADERS}          Create Dictionary    Accept=application/vnd.github.squirrel-girl-preview+json
  ${MY_REACTION}      Post Request          mygithubAuth    uri=${ISSUES_URI}/${ISSUE_NUMBER}/reactions
  ...                 data={"content": "${REACTION}"}       headers=${HEADERS}
  Log                 Meus dados: ${MY_REACTION.json()}
  Confere sucesso na requisição      ${MY_REACTION}
