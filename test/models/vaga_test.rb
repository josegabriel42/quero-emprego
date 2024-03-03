require "test_helper"

class VagaTest < ActiveSupport::TestCase
  test "salvar vaga com dados validos" do
    empregador = Empregador.new(nome: 'João Grilo', nomeEmpresa: 'Padaria Chico e João Grilo', email: 'deixe@disso.homi', cnpj: '12.345.678/0001-90', endereco:'Algum lugar do sertão nordestino', telefone: '87912345678')
    assert empregador.save

    vaga = empregador.vagas.build(titulo: 'Cangaceiro', descricao: 'Só caba valente e com sangue nos olhos.', salario: 1000.00)
    assert vaga.save
  end

  test "salvar vaga com valor de salario invalido" do
    empregador = Empregador.new(nome: 'João Grilo', nomeEmpresa: 'Padaria Chico e João Grilo', email: 'deixe@disso.homi', cnpj: '12.345.678/0001-90', endereco:'Algum lugar do sertão nordestino', telefone: '87912345678')
    assert empregador.save

    vaga = empregador.vagas.build(titulo: 'Cangaceiro', descricao: 'Só caba valente e com sangue nos olhos.', salario: -1)
    assert_not vaga.save
  end
end
