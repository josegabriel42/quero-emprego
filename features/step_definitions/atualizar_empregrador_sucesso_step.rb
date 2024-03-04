Given('O empregador de nome {string}, nomeEmpresa {string}, email {string}, endereco {string}, telefone {string} e cnpj {string} existe') do |nome, nomeEmpresa, email, endereco, telefone, cnpj|
  empregador = Empregador.create(nome: nome, nomeEmpresa: nomeEmpresa, email: email, endereco: endereco, telefone: telefone, cnpj: cnpj)
end
And('estou na pagina de empregadores') do
  visit '/empregadores/'
  expect(page).to have_current_path('/empregadores/')
end
And('visito o empregador desejado') do
  empregador = Empregador.last
  expect(page).to have_content('Ver')
  click_link(href: "/empregadores/#{empregador.id}")
end
And('clico para editar este empregador') do
  expect(page).to have_content('Editar')
  click_on 'Editar'
end
When('preencho os campos que desejo atualizar email {string} e nomeEmpresa {string}') do |email, nomeEmpresa|
  fill_in 'empregador[email]', :with => email
  fill_in 'empregador[nomeEmpresa]', :with => nomeEmpresa
end
And('Clico para salvar as atualizacoes') do
  click_button 'Atualizar'
end
Then('eu vejo uma mensagem que informa que o empregador foi atualizado com sucesso') do
  expect(page).to have_content('Informações atualizadas')
end