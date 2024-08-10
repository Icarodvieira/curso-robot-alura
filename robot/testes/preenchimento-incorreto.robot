*** Settings ***
Resource    ../resources/main.robot
Resource    preenchimento-correto.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador  

*** Variables ***
${BOTAO_CARD}    id:form-botao

*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema exibe uma mensagem de campo obrigatório
    Dado que eu clique no botão criar card
    Então devem ser exibidas mensagens de campo obrigatório

