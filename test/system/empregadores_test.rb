require "application_system_test_case"

class EmpregadoresTest < ApplicationSystemTestCase
  setup do
    @empregador = empregadores(:one)
  end

  test "visiting the index" do
    visit empregadores_url
    assert_selector "h1", text: "Empregadores"
  end

  test "should create empregador" do
    visit empregadores_url
    click_on "New empregador"

    fill_in "Cnpj", with: @empregador.cnpj
    fill_in "Email", with: @empregador.email
    fill_in "Endereco", with: @empregador.endereco
    fill_in "Nome", with: @empregador.nome
    fill_in "Nomeempresa", with: @empregador.nomeEmpresa
    fill_in "Telefone", with: @empregador.telefone
    click_on "Create Empregador"

    assert_text "Empregador was successfully created"
    click_on "Back"
  end

  test "should update Empregador" do
    visit empregador_url(@empregador)
    click_on "Edit this empregador", match: :first

    fill_in "Cnpj", with: @empregador.cnpj
    fill_in "Email", with: @empregador.email
    fill_in "Endereco", with: @empregador.endereco
    fill_in "Nome", with: @empregador.nome
    fill_in "Nomeempresa", with: @empregador.nomeEmpresa
    fill_in "Telefone", with: @empregador.telefone
    click_on "Update Empregador"

    assert_text "Empregador was successfully updated"
    click_on "Back"
  end

  test "should destroy Empregador" do
    visit empregador_url(@empregador)
    click_on "Destroy this empregador", match: :first

    assert_text "Empregador was successfully destroyed"
  end
end
