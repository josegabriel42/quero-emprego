class Vaga < ApplicationRecord
  belongs_to :empregador

  validates :titulo, presence: { message: "Campo obrigatório" }, length: {minimum: 3, maximum: 100, message: "O título deve ter um tamanho entre 3 e 100 caracteres"}
  validates :descricao, presence: { message: "Campo obrigatório" }, length: {minimum: 5, maximum: 256, message: "A descrição deve ter um tamanho entre 5 e 256 caracteres"}
  validates :salario, presence: { message: "Campo obrigatório" }, numericality: { greater_than: 0, less_than: BigDecimal(10**10), message: 'O salário deve ser um número decimal e maior que 0' }, format: { with: /\A\d{1,10}(\.\d{1,2})?\z/, message: 'Formato inválido.' }
end
