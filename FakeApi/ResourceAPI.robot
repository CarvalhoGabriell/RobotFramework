*** Settings ***
Documentation      Documentação da API: https://fakerestapi.azurewebsites.net/api/Books
Library            Collections
Library            RequestsLibrary


*** Variables ***
${URL_API}       https://fakerestapi.azurewebsites.net/api/
&{BOOK_23}       ID=23
...              Title=Book 23
...              Description=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\n
...              PageCount=2300
...              Excerpt=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\n


*** Keywords ***
#### Setups and Teardown
Conectar a minha API
    Create Session      fakeAPI     ${URL_API}

# AÇOES DOS CASOS DE TESTE
Requisitar todos os livros
  ${MENSAGEM}           Get Request     fakeAPI      Books
  Log                   ${MENSAGEM.text}
  Set Test Variable     ${MENSAGEM}

Requisitar um livro especifico
  [Arguments]           ${ID_LIVRO}
  ${MENSAGEM}           Get Request     fakeAPI      Books/${ID_LIVRO}
  Log                   ${MENSAGEM.text}
  Set Test Variable     ${MENSAGEM}

Conferir os dados que retornanram do livro 23

  Dictionary Should Contain Item      ${MENSAGEM.json()}   ID            ${BOOK_23.ID}
  Dictionary Should Contain Item      ${MENSAGEM.json()}   Title         ${BOOK_23.Title}
  Dictionary Should Contain Item      ${MENSAGEM.json()}   Description   ${BOOK_23.Description}
  Dictionary Should Contain Item      ${MENSAGEM.json()}   PageCount     ${BOOK_23.PageCount}
  Dictionary Should Contain Item      ${MENSAGEM.json()}   Excerpt       ${BOOK_23.Excerpt}
  Should Not Be Empty                 ${MENSAGEM.json()["PublishDate"]}

Conferir o status code
  [Arguments]                   ${STATUSCODE_ESPERADO}
  Should Be Equal As Strings    ${MENSAGEM.status_code}    ${STATUSCODE_ESPERADO}

Conferir o reason
  [Arguments]                   ${REASON_ESPERADO}
  Should Be Equal As Strings    ${MENSAGEM.reason}    ${REASON_ESPERADO}

Conferir se retorna uma lista de livros
  [Arguments]         ${QTD_ESEPERADA}
  Length Should Be    ${MENSAGEM.json()}    ${QTD_ESEPERADA}

Cadastrar um novo livro
  ${HEADERS}          Create Dictionary     content-type=application/json
  ${MENSAGEM}         Post Request     fakeAPI      Books
  ...                                  data={"ID": 99,"Title": "Robot-test","Description": "testando POST resquest","PageCount": 1999,"Excerpt": "framework","PublishDate": "2020-06-02T12:26:40.924Z"}
  ...                                 headers=${HEADERS}
  Log                                 ${MENSAGEM.text}
  Set Test Variable                   ${MENSAGEM}

Deletar um livro da lista
  [Arguments]           ${ID_LIVRO}
  ${MENSAGEM}           Delete Request     fakeAPI      Books
  Log                   ${MENSAGEM.text}
  Set Test Variable     ${MENSAGEM}

Conferir status code
  [Arguments]           ${STATUSCODE_ESPERADO}
  Should Be Equal As Strings     ${MENSAGEM.status_code}      ${STATUSCODE_ESPERADO]}

Conferir o reason
  [Arguments]         ${REASON_ESPERADO}
  Should Be Equal As Strings    ${MENSAGEM.reason}    ${REASON_ESPERADO}

Conferir o body
  ${HEADERS}          Create Dictionary     content-type=null

# Conferir os dados que retornanram do livro cadastrado
#   Dictionary Should Contain Item      ${MENSAGEM.json()}
