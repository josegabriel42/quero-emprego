Given('visito a pagina de criacao de empregador') do
  visit '/empregadores/new'
  expect(page).to have_current_path('/empregadores/new')
end
And('preencho os campos de empregador com nome {string}, nomeEmpresa {string}, email {string}, endereco {string}, telefone {string} e cnpj {string}') do |nome, nomeEmpresa, email, endereco, telefone, cnpj|
    fill_in 'empregador[nome]', :with => nome
    fill_in 'empregador[nomeEmpresa]', :with => nomeEmpresa
    fill_in 'empregador[email]', :with => email
    fill_in 'empregador[endereco]', :with => endereco
    fill_in 'empregador[telefone]', :with => telefone
    fill_in 'empregador[cnpj]', :with => cnpj
end
When('eu clico em criar Empregador') do
  click_button 'Cadastrar'
end
Then('eu vejo uma mensagem que informa que o empregador foi criado com sucesso') do
    expect(page).to have_content('Empregador cadastrado')
end