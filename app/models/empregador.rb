class Empregador < ApplicationRecord
    has_many :vagas
    
    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    VALID_CNPJ_REGEX = /(\d{2})\.(\d{3})\.(\d{3})\/000[1-2]-(\d{2})/

    validates :nome, presence: { message: "Campo obrigatório" }, length: {minimum: 3, maximum: 256, message: "O nome deve ter um tamanho entre 3 e 256 caracteres"}
    validates :nomeEmpresa, presence: { message: "Campo obrigatório" }, length: {minimum: 3, maximum: 256, message: "O nome da empresa deve ter um tamanho entre 3 e 256 caracteres"}
    validates :email, presence: { message: "Campo obrigatório" }, length: { maximum: 100, message: "Tamanho excede o limite de 100 caracteres" }, format: { with: VALID_EMAIL_REGEX, message: "Formato inválido" }, uniqueness: { case_sensitive: true, message: "O email %{value} já está em uso." }
    validates :cnpj, presence: { message: "Campo obrigatório" }, length: { is:18, message: "O cnpj deve contér 18 caracteres" }, format: { with: VALID_CNPJ_REGEX, message: "Formato inválido" }, uniqueness: { message: "O cnpj %{value} já está em uso." }
    validates :endereco, presence: { message: "Campo obrigatório" }, length: {minimum: 5, maximum: 256, message: "O endereço deve ter um tamanho entre 5 e 256 caracteres"}
    validates :telefone, presence: { message: "Campo obrigatório" }, length: { is:11, message: "O telefone deve contér 11 digitos (DD900000000)" }, numericality: { only_integer: true, message: "Deve ser formado apenas por números" }
end
