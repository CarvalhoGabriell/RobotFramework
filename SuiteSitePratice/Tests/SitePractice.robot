*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador
## SETTUP -> ele executa uma suite inteira , ou de um Teste.
## TEARDOWN -> ele roda keywords depois de uma suite ou um Teste.
##Suite Settup
##Suite Teardown


*** Test Case ***
Caso de teste 01: Pesquisar produto existente
  Acessar página home do site
  Digitar o nome do produto "Blouse" no campo de pesquisa
  Clicar no botão de Pesquisar
  Conferir na tela se o produto "Blouse" foi listado no site

Caso de teste 02: Pesquisar produto não existente
   Acessar página home do site
   Digitar o nome do produto "produtoNãoExistente" no campo de pesquisa
   Clicar no botão de Pesquisar
   O sistema deve exibir na tela a seguinte mensagem: "No results were found for your search "produtoNãoExistente""
