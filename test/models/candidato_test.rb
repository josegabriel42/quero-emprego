require "test_helper"

class CandidatoTest < ActiveSupport::TestCase
  test "salvar candidato com dados validos" do
    candidato = Candidato.new(nome: 'Chico', email: 'num@sei.com', cpf: '12345678910', dataNascimento:'01-01-2000', telefone: '87912345678')
    assert candidato.save
  end

  test "salvar candidato com dados invalidos" do
    candidato = Candidato.new(nome: 'João Grilo', email: '???', cpf: '???', dataNascimento: DateTime.tomorrow, telefone: '???')
    assert_not candidato.save
  end
end
