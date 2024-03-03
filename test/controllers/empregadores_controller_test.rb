require "test_helper"

class EmpregadoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empregador = empregadores(:one)
  end

  test "should get index" do
    get empregadores_url
    assert_response :success
  end

  test "should get new" do
    get new_empregador_url
    assert_response :success
  end

  test "should create empregador" do
    assert_difference("Empregador.count") do
      post empregadores_url, params: { empregador: { cnpj: @empregador.cnpj, email: @empregador.email, endereco: @empregador.endereco, nome: @empregador.nome, nomeEmpresa: @empregador.nomeEmpresa, telefone: @empregador.telefone } }
    end

    assert_redirected_to empregador_url(Empregador.last)
  end

  test "should show empregador" do
    get empregador_url(@empregador)
    assert_response :success
  end

  test "should get edit" do
    get edit_empregador_url(@empregador)
    assert_response :success
  end

  test "should update empregador" do
    patch empregador_url(@empregador), params: { empregador: { cnpj: @empregador.cnpj, email: @empregador.email, endereco: @empregador.endereco, nome: @empregador.nome, nomeEmpresa: @empregador.nomeEmpresa, telefone: @empregador.telefone } }
    assert_redirected_to empregador_url(@empregador)
  end

  test "should destroy empregador" do
    assert_difference("Empregador.count", -1) do
      delete empregador_url(@empregador)
    end

    assert_redirected_to empregadores_url
  end
end
