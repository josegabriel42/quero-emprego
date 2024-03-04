Feature: Vaga
  As a empregador
  I want to adicionar, remover, visualizar, e editar uma vaga
  So that mantenho o cadastro atualizado e correto

  Scenario: Criar vaga com sucesso
    Given O empregador de nomeEmpresa 'Empresa ABC', nome 'João da Silva', endereco 'Rua B, 456', email 'joao.silva@example.com', cnpj '98.765.432/0001-99' e telefone '11444444444' existe
    And que eu esteja na pagina de criacao de vaga
    When eu preencho os campos obrigatorios com os dados da vaga titulo 'Desenvolvedor Ruby', descricao 'Vaga para desenvolvedor Ruby' e salario 5000.00
    And eu clico em criar Vaga
    Then eu devo ser redirecionado para a pagina da vaga recem criada e vejo a mensagem "Vaga adicionada"

  Scenario: Remover vaga com sucesso
    Given O empregador de nomeEmpresa 'Empresa ABC', nome 'João da Silva', endereco 'Rua B, 456', email 'joao.silva@example.com', cnpj '98.765.432/0001-99' e telefone '11444444444' existe
    And que existe uma vaga de titulo 'Desenvolvedor Ruby', descricao 'Vaga para desenvolvedor Ruby' e salario 5000 desse empregador
    And eu estou na pagina de listagem de vagas
    When eu acesso uma vaga em especifico
    And eu clico no botao para deletar a vaga
    Then eu vejo a mensagem que diz que a vaga foi removida com sucesso

  Scenario: Editar vaga com sucesso
    Given O empregador de nomeEmpresa 'Empresa ABC', nome 'João Grilo', endereco 'Rua B, 456', email 'joao.silva@example.com', cnpj '98.765.432/0001-99' e telefone '11444444444' existe
    And que existe uma vaga de titulo 'Desenvolvedor Ruby', descricao 'Vaga para desenvolvedor Ruby' e salario 7500 desse empregador
    And eu estou na pagina de listagem de vagas
    When eu acesso uma vaga em especifico
    And eu acesso a pagina de edicao desta vaga
    And eu altero os campos desejados da vaga preenchendo a descricao com 'Vaga para desenvolvedor Ruby on Rails'
    And clico para atualizar vaga
    Then aparece a mensagem de confirmacao na tela que a vaga foi atualizada com sucesso





