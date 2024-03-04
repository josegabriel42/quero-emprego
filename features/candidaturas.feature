Feature: gerenciar uma candidatura
  As a candidato
  I want to candidatar em uma vaga  no site de emprego
  So that eu possa concorrer a uma vaga

  Scenario: Criar uma candidatura
    Given que existe um candidato chamado "Wilker" com email "joao@hotmail.com" com o cpf "11598786427" com a data "20-11-2001" e com o seguinte numero "87999469995"
    And que existe um empregador chamado "Paulo" com a empresa "Empresa ABC" com o email "paulo@example.com" com o endereco "Rua ponte" com o telefone "87999459896" e com o cnpj "44.935.624/0001-60"
    And criou a seguinte vaga de emprego titulo "Dev pleno ruby on rails", descricao "Candidato confiante" e salario 2500
    When acesso a pagina de candidatura da vaga de emprego
    And preencho minha mensagem de candidatura com "Tenho experiencia com ruby on rails"
    And clica no botao para criar a candidatura
    Then aparece uma mensagem de confirmacao na tela dizendo que a candidatura foi criada

  Scenario: Criar uma candidatura com informacoes invalidas
    Given que existe um candidato chamado "Phellipe" com email "joaov@outlook.com" com o cpf "06698786427" com a data "20/11/2001" e com o seguinte numero "87999469995"
    And que existe um empregador chamado "Paulo" com a empresa "Empresa ABC" com o email "paulo@example.com" com o endereco "Rua ponte" com o telefone "87999459896" e com o cnpj "44.935.624/0001-54"
    And criou a seguinte vaga de emprego titulo "Dev junior ruby on rails", descricao "Candidato triste" e salario 5800
    When acesso a pagina de candidatura da vaga de emprego
    And preencho minha mensagem de candidatura com ""
    And clica no botao para criar a candidatura
    Then aparece uma mensagem de erro na tela dizendo que a candidatura nao pode ser criada com a mensagem em branco

  Scenario: Editar uma candidatura
    Given que existe um candidato chamado "Jose" com email "joao@hotmail.com" com o cpf "11598786427" com a data "20-11-2001" e com o seguinte numero "87999469995"
    And que existe um empregador chamado "ze pitomba" com a empresa "Empresa ABC" com o email "paulo@example.com" com o endereco "Rua ponte" com o telefone "87999459896" e com o cnpj "44.935.624/0001-60"
    And criou a seguinte vaga de emprego titulo "Dev pleno ruby on rails", descricao "Candidato confiante" e salario 2500
    And que existe uma candidatura desse candidato nessa vaga com a mensagem "Tenho experiencia com ruby on rails"
    When acesso a pagina de edicao de candidaturas
    And altero a mensagem de candidatura para "Tenho mais de 2 anos de experiencia com ruby on rails"
    And clico no botao para salvar a edicao
    Then aparece uma mensagem de confirmacao na tela dizendo que a candidatura foi editada com sucesso