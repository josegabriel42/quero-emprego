require "application_system_test_case"

class VagasTest < ApplicationSystemTestCase
  setup do
    @vaga = vagas(:one)
  end

  test "visiting the index" do
    visit vagas_url
    assert_selector "h1", text: "Vagas"
  end

  test "should create vaga" do
    visit vagas_url
    click_on "New vaga"

    fill_in "Descricao", with: @vaga.descricao
    fill_in "Empregador", with: @vaga.empregador_id
    fill_in "Salario", with: @vaga.salario
    fill_in "Titulo", with: @vaga.titulo
    click_on "Create Vaga"

    assert_text "Vaga was successfully created"
    click_on "Back"
  end

  test "should update Vaga" do
    visit vaga_url(@vaga)
    click_on "Edit this vaga", match: :first

    fill_in "Descricao", with: @vaga.descricao
    fill_in "Empregador", with: @vaga.empregador_id
    fill_in "Salario", with: @vaga.salario
    fill_in "Titulo", with: @vaga.titulo
    click_on "Update Vaga"

    assert_text "Vaga was successfully updated"
    click_on "Back"
  end

  test "should destroy Vaga" do
    visit vaga_url(@vaga)
    click_on "Destroy this vaga", match: :first

    assert_text "Vaga was successfully destroyed"
  end
end
