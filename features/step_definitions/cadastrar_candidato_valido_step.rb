Given('que eu estou na pagina de cadastro de candidato') do
  visit '/candidatos/new'
  expect(page).to have_current_path('/candidatos/new')
end
When('eu preencho os campos obrigatorios com nome {string}, email {string}, cpf {string}, data de nascimneto {string} e telefone {string}') do |nomeCompleto, email, cpf, dataNascimento, telefone|
  fill_in 'candidato[nome]', :with => nomeCompleto
  fill_in 'candidato[email]', :with => email
  fill_in 'candidato[cpf]', :with => cpf
  fill_in 'candidato[dataNascimento]', :with => dataNascimento
  fill_in 'candidato[telefone]', :with => telefone
end
And('clico em Cadastrar') do
  click_button 'Cadastrar'
end
Then('devo ver uma mensagem de confirmacao') do
  expect(page).to have_content('Candidato cadastrado')
end
