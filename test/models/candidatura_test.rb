require "test_helper"

class CandidaturaTest < ActiveSupport::TestCase
  test "salvar candidatura com sucesso" do
    candidato = Candidato.new(nome: 'Chico', email: 'num@sei.com', cpf: '12345678910', dataNascimento:'01-01-2000', telefone: '87912345678')
    assert candidato.save
    empregador = Empregador.new(nome: 'João Grilo', nomeEmpresa: 'Padaria Chico e João Grilo', email: 'deixe@disso.homi', cnpj: '12.345.678/0001-90', endereco:'Algum lugar do sertão nordestino', telefone: '87912345678')
    assert empregador.save
    vaga = empregador.vagas.build(titulo: 'Cangaceiro', descricao: 'Só caba valente e com sangue nos olhos.', salario: 1000.00)
    assert vaga.save
    candidatura = vaga.candidaturas.build(mensagem: 'Lembrar de nunca mais deixar de fazer a 1ª VA.', candidato_id: candidato.id)
    assert candidatura.save
  end

  test "salvar candidatura com campos vazios" do
    candidato = Candidato.new(nome: 'Chico', email: 'num@sei.com', cpf: '12345678910', dataNascimento:'01-01-2000', telefone: '87912345678')
    assert candidato.save
    empregador = Empregador.new(nome: 'João Grilo', nomeEmpresa: 'Padaria Chico e João Grilo', email: 'deixe@disso.homi', cnpj: '12.345.678/0001-90', endereco:'Algum lugar do sertão nordestino', telefone: '87912345678')
    assert empregador.save
    vaga = empregador.vagas.build(titulo: 'Cangaceiro', descricao: 'Só caba valente e com sangue nos olhos.', salario: 1000.00)
    assert vaga.save
    candidatura = vaga.candidaturas.build(mensagem: '', candidato_id: candidato.id)
    assert_not candidatura.save
  end
end
