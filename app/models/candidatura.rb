class Candidatura < ApplicationRecord
  belongs_to :candidato
  belongs_to :vaga

  validates :mensagem, presence: { message: "Campo obrigatório" }, length: {minimum: 5, maximum: 1000, message: "A mensagem deve ter um tamanho entre 5 e 1000 caracteres"}
end
