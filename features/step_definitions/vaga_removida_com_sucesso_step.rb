And('que existe uma vaga de titulo {string}, descricao {string} e salario {double} desse empregador') do |titulo, descricao, salario|
  Vaga.create(titulo: titulo, descricao: descricao, salario: salario, empregador_id: Empregador.first.id)
end
And('eu estou na pagina de listagem de vagas') do
  visit '/empregadores/1/vagas'
  expect(page).to have_current_path('/empregadores/1/vagas')
end
When('eu acesso uma vaga em especifico') do
  click_on 'Ver'
  expect(page).to have_current_path('/empregadores/1/vagas/1')
end
And('eu clico no botao para deletar a vaga') do
  click_button 'Deletar'
end
Then('eu vejo a mensagem que diz que a vaga foi removida com sucesso') do
  expect(page).to have_content('Vaga removida')
end