require "test_helper"

class EmpregadorTest < ActiveSupport::TestCase
  test "salvar empregador com dados validos" do
    empregador = Empregador.new(nome: 'João Grilo', nomeEmpresa: 'Padaria Chico e João Grilo', email: 'deixe@disso.homi', cnpj: '12.345.678/0001-90', endereco:'Algum lugar do sertão nordestino', telefone: '87912345678')
    assert empregador.save
  end

  test "salvar candidato com cnpj ja em uso" do
    empregador1 = Empregador.new(nome: 'Chico', nomeEmpresa: 'Padaria Chico e João Grilo', email: 'num@sei.oxi', cnpj: '11.111.111/0001-11', endereco:'Algum lugar do sertão nordestino', telefone: '87912345678')
    assert empregador1.save
    empregador2 = Empregador.new(nome: 'Chico', nomeEmpresa: 'Padaria Chico e João Grilo', email: 'num@sei.oxi', cnpj: '11.111.111/0001-11', endereco:'Algum lugar do sertão nordestino', telefone: '87912345678')
    assert_not empregador2.save
  end
end
