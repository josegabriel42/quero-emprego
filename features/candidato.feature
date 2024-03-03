Feature: Candidato
  As a candidato
  I want to criar, deletar ou editar cadastro
  So that mantenho o cadastro atualizado e correto

  Scenario: Cadastrar candidato com informacoes validas
    Given que eu estou na pagina de cadastro de candidato
    When eu preencho os campos obrigatorios com nome 'João Grilo', email 'so@sei.que', cpf '12345678910', data de nascimneto '01-01-2000' e telefone '87912345678'
    And clico em Cadastrar
    Then devo ver uma mensagem de confirmacao
  
  Scenario: Cadastrar candidato com informacoes invalidas
    Given que eu estou na pagina de cadastro de candidato
    When eu preencho os campos com nome 'João Grilo', email 'foi@ssim', cpf '???', data de nascimneto '01-01-2000' e telefone '???'
    And clico em Cadastrar
    Then devo ver uma mensagem de erro

  Scenario: Cadastrar candidato com campos vazios
    Given que eu estou na pagina de cadastro de candidato
    When clico em Cadastrar
    Then devo ver uma mensagem de erro

  

