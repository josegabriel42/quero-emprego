And('que existe uma vaga de titulo {string}, descricao {string} e salario {double} desse empregador') do |titulo, descricao, salario|
  Vaga.create(titulo: titulo, descricao: descricao, salario: salario, empregador_id: Empregador.first.id)
end
And('eu estou na pagina de listagem de vagas') do
  visit "/empregadores/#{Empregador.last.id}/vagas"
  expect(page).to have_current_path("/empregadores/#{Empregador.last.id}/vagas")
end
When('eu acesso uma vaga em especifico') do
  empregador = Empregador.last
  vaga = empregador.vagas.first
  click_link(href: "/empregadores/#{empregador.id}/vagas/#{vaga.id}")
  expect(page).to have_current_path("/empregadores/#{empregador.id}/vagas/#{vaga.id}")
end
And('eu clico no botao para deletar a vaga') do
  click_button 'Deletar'
end
Then('eu vejo a mensagem que diz que a vaga foi removida com sucesso') do
  expect(page).to have_content('Vaga removida')
end