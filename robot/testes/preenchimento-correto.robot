*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador  
          

*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamente os dados são inseridos na lista e se um novo card é criado no time esperado
    
    Dado que eu preencha o formulário corretamente
    E clique no botão criar card
    Então um novo card deve ser criado com o time selecionado corretamente
 
Verificar se é possível criar mais de um card se preenchermos os campos corretamente
    Dado que eu preencha o formulário corretamente
    E clique no botão criar card
    Então 3 novos cards devem ser exibidos

Verificar se é possível criar cards para cada um dos time se preenchermos os campos corretamente
    Dado que eu preencha o formulário corretamente
    Então criar e identificar 1 card em cada time disponível

