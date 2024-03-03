class CreateCandidatos < ActiveRecord::Migration[7.0]
  def change
    create_table :candidatos do |t|
      t.string :nome, null: false, default: ''
      t.string :email, null: false, index: true, default: ''
      t.string :cpf, null: false, index: true, default: ''
      t.date :dataNascimento, null: false, default: ''
      t.string :telefone, null: false, default: ''

      t.timestamps
    end
  end
end
