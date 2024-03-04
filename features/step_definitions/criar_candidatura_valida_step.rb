Given('que existe um candidato chamado {string} com email {string} com o cpf {string} com a data {string} e com o seguinte numero {string}') do |nome, email, cpf, dataNascimento, telefone|
  Candidato.create(nome: nome, email: email, cpf: cpf, dataNascimento: dataNascimento, telefone: telefone)
end
And('que existe um empregador chamado {string} com a empresa {string} com o email {string} com o endereco {string} com o telefone {string} e com o cnpj {string}') do |nome, nomeEmpresa, email, endereco, telefone, cnpj|
  Empregador.create(nome: nome, nomeEmpresa: nomeEmpresa, email: email, endereco: endereco, telefone: telefone, cnpj: cnpj)
end
And('criou a seguinte vaga de emprego titulo {string}, descricao {string} e salario {double}') do |titulo, descricao, salario|
  Vaga.create(titulo: titulo, descricao: descricao, salario: salario, empregador_id: Empregador.first.id)
end
When('acesso a pagina de candidatura da vaga de emprego') do
  visit '/candidatos/1/vagas/1/candidaturas/new'
  expect(page).to have_current_path('/candidatos/1/vagas/1/candidaturas/new')
end
And('preencho minha mensagem de candidatura com {string}') do |mensagem|
  fill_in 'candidatura[mensagem]', :with => mensagem
end
And('clica no botao para criar a candidatura') do
  click_button 'Cadastrar'
end
Then('aparece uma mensagem de confirmacao na tela dizendo que a candidatura foi criada') do
  expect(page).to have_content('Candidatura adicionada')
end