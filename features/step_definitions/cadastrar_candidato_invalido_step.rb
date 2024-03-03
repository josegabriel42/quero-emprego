When('eu preencho os campos com nome {string}, email {string}, cpf {string}, data de nascimneto {string} e telefone {string}') do |nomeCompleto, email, cpf, dataNascimento, telefone|
    fill_in 'candidato[nome]', :with => nomeCompleto
    fill_in 'candidato[email]', :with => email
    fill_in 'candidato[cpf]', :with => cpf
    fill_in 'candidato[dataNascimento]', :with => dataNascimento
    fill_in 'candidato[telefone]', :with => telefone
end

Then('devo ver uma mensagem de erro') do
    expect(page).to have_content('Erro')
end