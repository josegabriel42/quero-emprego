When('eu clico no botao de excluir do empregador') do
  click_button 'Deletar'
end
Then('eu vejo uma mensagem que informa que o empregador foi excluido com sucesso') do
  expect(page).to have_content('Empregador excluído do sistema')
end