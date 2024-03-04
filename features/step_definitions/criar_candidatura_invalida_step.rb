Then('aparece uma mensagem de erro na tela dizendo que a candidatura nao pode ser criada com a mensagem em branco') do
  expect(page).to have_content('Campo obrigatório')
end