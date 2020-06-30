*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    firefox


*** Keywords ***
### Setups e TEARDOWN
Abrir navegador
  Open Browser     http://automationpractice.com    ${BROWSER}

Fechar navegador
  Capture Page Screenshot
  Close Browser

### Passo a passo dos testes
Acessar página home do site
    Go To               ${URL}
    Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text      id:search_query_top     ${PRODUTO}

Clicar no botão de Pesquisar
    Click Button    name:submit_search

Clicar no botão "Add to Cart" do produto
    Wait Until Element Is Visible   xpath://*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
    Click Element                   xpath://*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
    Wait Until Element Is Visible   xpath://*[@id="add_to_cart"]/button
    Click Button                    xpath://*[@id="add_to_cart"]/button

Clicar no botão "Proceed to checkout"
    Wait Until Element Is Visible   xpath://*[@id="layer_cart"]//a[@title="Proceed to checkout"]
    Click Element                   xpath://*[@id="layer_cart"]//a[@title="Proceed to checkout"]

Adicionar "${PRODUTO}" ao carrinho compras
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de Pesquisar
    Clicar no botão "Add to Cart" do produto
    Clicar no botão "Proceed to checkout"

Excluir o produto do carrinho
    Click Element                 xpath://tr[@id='product_1_1_0_0']//a[@title='Delete']
    #xpath=//*[@class="cart_quantity_delete"]


Exibir a página do carrinho
    Title Should Be               Order - My Store

    Page Should Contain Element       xpath://div[@id='center_column']/h1[contains(text(),'Shopping-cart summary')]

    Page Should Contain Element       xpath://div[@id='center_column']/p[contains(text(),'Your shopping cart is empty.')]

Conferir se o carrinho fica vazio
    Wait Until Element Is Visible       xpath://*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be              xpath://*[@id="center_column"]/p[@class='alert alert-warning']    Your shopping cart is empty.



### CADASTRAR NOVO USUÁRIO

Clicar em "Sign in"
    Click Element       xpath://div[@class='header_user_info']/a

Verificar página de login do usuário
    Title Should Be      Login - My Store

    Wait Until Element Is Visible     xpath://div[@id='center_column']//h1[@class='page-heading']

Cadastar email válido: "${USUARIO}"
    Input Text               id:email_create     ${USUARIO}

Clicar no botão "Creat an account"
    Click Button        id:SubmitCreate

# Selecionar data de aniversário

Preencher dadods válidodos em "Your personal information"
    Wait Until Element Is Visible        xpath://form[@id='account-creation_form']//h3[contains(text(),'Your personal information')]

    Click Element                         id:id_gender1
    Input Text                            id:customer_firstname    Gabriel
    Input Text                            id:customer_lastname     Fernandes
    Input Text                            id:passwd                123456
    Input Text                            id:address1              Rua robotizando, Bairro RobotFramework
    Input text                            id:address2              BL 01, APTO 10
    Input Text                            id:city                  Cotia-SP
    Click Element                         id:id_state
    # Run Keyword If    '${BROWSER}'=='firefox'   Wait Until Element Is Visible   id=id_state
    Select From List By Value             id:id_state              11
    Input Text                            id:postcode              70706
    Click Element                         id:other
    Input Text                            id:other                 Robotizando cadastro de cliente no site, para praticar as keywords.
    Input Text                            id:phone_mobile          99988877
    Input Text                            id:alias                 Rua Robot, Bairro Python3

Clicar no botão "Register"
    Click Button                        submitAccount


Conferir se o cadastro foi feito com sucesso
    Wait Until Element Is Visible     xpath://*[@id="center_column"]/p
    Element Text Should Be            xpath://*[@id="center_column"]/p
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           xpath://*[@id="header"]/div[2]//div[1]/a/span    Gabriel Fernandes
