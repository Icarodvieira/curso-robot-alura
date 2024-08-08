*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${BLOCO_CARD}             class:colaborador
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]

*** Test Cases ***

Verificar se ao preencher os campos do formulário corretamente os dados são inseridos na lista e se um novo card é criado no time esperado
    Dado que eu acesse o Organo
    E preencha os campos corretamente
    E clique no botão criar card
    Então identificamos o card no time esperado
 
*** Keywords ***
Dado que eu acesse o Organo
    Open Browser  url= ${URL}    browser=Chrome

E preencha os campos corretamente
    Input Text     ${CAMPO_NOME}      Ícaro
    Input Text     ${CAMPO_CARGO}     Analista de QA
    Input Text     ${CAMPO_IMAGEM}    https://media.licdn.com/dms/image/C4E03AQH_4dtB1yWOsw/profile-displayphoto-shrink_200_200/0/1655732080777?e=2147483647&v=beta&t=DHpqZpz6SSAA3WOexesoTZwnRt1hlEidQUQ7T54aMps
    Click Element  ${CAMPO_TIME}
    Click Element  ${OPCAO_PROGRAMACAO}

E clique no botão criar card
    Click Element    ${BOTAO_CARD}

Então identificamos o card no time esperado
    Element Should Be Visible    ${BLOCO_CARD}