And('que existe uma candidatura desse candidato nessa vaga com a mensagem {string}') do |mensagem|
  Candidatura.create(vaga_id: Vaga.first.id, candidato_id: Candidato.first.id, mensagem: mensagem)
end
When('acesso a pagina de edicao de candidaturas') do
  visit "/candidatos/#{Candidato.last.id}/candidaturas/#{Candidatura.last.id}/edit"
  expect(page).to have_current_path("/candidatos/#{Candidato.last.id}/candidaturas/#{Candidatura.last.id}/edit")
end
And('altero a mensagem de candidatura para {string}') do |mensagem|
  fill_in 'candidatura[mensagem]', :with => mensagem
end
And('clico no botao para salvar a edicao') do
  click_button 'Atualizar'
end
Then('aparece uma mensagem de confirmacao na tela dizendo que a candidatura foi editada com sucesso') do
  expect(page).to have_content('Candidatura atualizada')
end