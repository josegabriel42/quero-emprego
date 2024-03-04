class Candidato < ApplicationRecord
    has_many :candidaturas, dependent: :destroy
    
    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    validates :nome, presence: { message: "Campo obrigatório" }, length: {minimum: 3, maximum: 256, message: "O nome deve ter um tamanho entre 3 e 256 caracteres"}
    validates :dataNascimento, presence: { message: "Campo obrigatório" }, comparison: { less_than_or_equal_to: Date.today, message: "A data não pode ser superior à atual."}
    validates :cpf, presence: { message: "Campo obrigatório" }, length: { is:11, message: "O cpf deve contér 11 caracteres" }, numericality: { only_integer: true, message: "Deve ser formado apenas por números" }, uniqueness: { message: "O cpf %{value} já está em uso." }
    validates :email, presence: { message: "Campo obrigatório" }, length: { maximum: 100, message: "Tamanho excede o limite de 100 caracteres" }, format: { with: VALID_EMAIL_REGEX, message: "Formato inválido" }, uniqueness: { case_sensitive: true, message: "O email %{value} já está em uso." }
    validates :telefone, presence: { message: "Campo obrigatório" }, length: { is:11, message: "O telefone deve contér 11 digitos (DD900000000)" }, numericality: { only_integer: true, message: "Deve ser formado apenas por números" }
end
