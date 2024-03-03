Given('O empregador de nomeEmpresa {string}, nome {string}, endereco {string}, email {string}, cnpj {string} e telefone {string} existe') do |nomeEmpresa, nome, endereco, email, cnpj, telefone|
  Empregador.create(nomeEmpresa: nomeEmpresa, nome: nome, endereco: endereco, email: email, cnpj: cnpj, telefone: telefone)
end
And('que eu esteja na pagina de criacao de vaga') do
  visit '/empregadores/1/vagas/new'
  expect(page).to have_current_path('/empregadores/1/vagas/new')
end
When('eu preencho os campos obrigatorios com os dados da vaga titulo {string}, descricao {string} e salario {double}') do |titulo, descricao, salario|
  fill_in 'vaga[titulo]', :with => titulo
  fill_in 'vaga[descricao]', :with => descricao
  fill_in 'vaga[salario]', :with => salario
end
And('eu clico em criar Vaga') do
  click_button 'Cadastrar'
end
Then('eu devo ser redirecionado para a pagina da vaga recem criada e vejo a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end