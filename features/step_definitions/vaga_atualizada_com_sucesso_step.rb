And('eu acesso a pagina de edicao desta vaga') do
  click_on 'Editar'
end
And('eu altero os campos desejados da vaga preenchendo a descricao com {string}') do |descricao|
  fill_in 'vaga[descricao]', :with => descricao
end
And('clico para atualizar vaga') do
  click_on('Atualizar')
end
Then('aparece a mensagem de confirmacao na tela que a vaga foi atualizada com sucesso') do
  expect(page).to have_content('Vaga atualizada')
end
