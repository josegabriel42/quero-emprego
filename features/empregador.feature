Feature: Empregador
  As a empregador
  I want to adicionar, remover, visualizar, e editar um empregador
  So that mantenho o cadastro atualizado e correto


  Scenario: Criar empregador com sucesso
    Given visito a pagina de criacao de empregador
    And preencho os campos de empregador com nome 'Maria Silva', nomeEmpresa 'Empresa XYZ', email 'maria.silva@example.com', endereco 'Rua A, 123', telefone '11555555555' e cnpj '12.345.678/0001-00'
    When eu clico em criar Empregador
    Then eu vejo uma mensagem que informa que o empregador foi criado com sucesso

  Scenario: Atualizar empregador com sucesso
    Given O empregador de nome 'Maria Silva', nomeEmpresa 'Empresa XYZ', email 'maria.silva@example.com', endereco 'Rua A, 123', telefone '11555555555' e cnpj '12.345.678/0001-00' existe
    And estou na pagina de empregadores
    And visito o empregador desejado
    And clico para editar este empregador
    When preencho os campos que desejo atualizar email 'maria.silva023@example.com' e nomeEmpresa 'Empresa ABC'
    And  Clico para salvar as atualizacoes
    Then eu vejo uma mensagem que informa que o empregador foi atualizado com sucesso


  Scenario: Excluir empregador com sucesso
    Given O empregador de nome 'Maria Silva', nomeEmpresa 'Empresa XYZ', email 'maria.silva@example.com', endereco 'Rua A, 123', telefone '11555555555' e cnpj '12.345.678/0001-00' existe
    And estou na pagina de empregadores
    And visito o empregador desejado
    When eu clico no botao de excluir do empregador
    Then eu vejo uma mensagem que informa que o empregador foi excluido com sucesso