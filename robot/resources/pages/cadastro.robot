*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{OPCOES_TIMES}  
...         //option[contains(.,'Programação')]
...         //option[contains(.,'Front-End')]
...         //option[contains(.,'Data Science')]
...         //option[contains(.,'Devops')] 
...         //option[contains(.,'UX e Design')]
...         //option[contains(.,'Mobile')]
...         //option[contains(.,'Inovação e Gestão')]

*** Keywords ***
Dado que eu preencha o formulário corretamente
    ${Nome}        FakerLibrary.First Name
    Input Text     ${CAMPO_NOME}      ${Nome}
    ${Cargo}       FakerLibrary.Job
    Input Text     ${CAMPO_CARGO}     ${Cargo}
    ${Imagem}      FakerLibrary.Image Url    300    300
    Input Text     ${CAMPO_IMAGEM}    ${Imagem}
    Click Element  ${CAMPO_TIME}
    Click Element  ${OPCOES_TIMES}[0]

E clique no botão criar card
    Click Element    ${BOTAO_CARD}

Então um novo card deve ser criado com o time selecionado corretamente
    Element Should Be Visible    class:colaborador

Então 3 novos cards devem ser exibidos
    FOR    ${i}    IN RANGE    1    3
        Dado que eu preencha o formulário corretamente
        E clique no botão criar card
        Então um novo card deve ser criado com o time selecionado corretamente
    END
    Sleep    10s
    
Então criar e identificar 1 card em cada time disponível
    FOR    ${indice}    ${time}    IN ENUMERATE    @{OPCOES_TIMES}
        Dado que eu preencha o formulário corretamente
        Click Element    ${time}
        E clique no botão criar card
    END
    Sleep    10s

Dado que eu clique no botão criar card
    Click Element    ${BOTAO_CARD}

Então devem ser exibidas mensagens de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro