class CreateEmpregadores < ActiveRecord::Migration[7.0]
  def change
    create_table :empregadores do |t|
      t.string :nome, null: false, default: ''
      t.string :nomeEmpresa, null: false, default: ''
      t.string :email, null: false, index: true, default: ''
      t.string :cnpj, null: false, index: true, default: ''
      t.string :endereco, null: false, default: ''
      t.string :telefone, null: false, default: ''

      t.timestamps
    end
  end
end
