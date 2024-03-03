# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_03_03_153451) do
  create_table "candidatos", force: :cascade do |t|
    t.string "nome", default: "", null: false
    t.string "email", default: "", null: false
    t.string "cpf", default: "", null: false
    t.date "dataNascimento", null: false
    t.string "telefone", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_candidatos_on_cpf"
    t.index ["email"], name: "index_candidatos_on_email"
  end

  create_table "empregadores", force: :cascade do |t|
    t.string "nome"
    t.string "nomeEmpresa"
    t.string "email"
    t.string "cnpj"
    t.string "endereco"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vagas", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.decimal "salario"
    t.integer "empregador_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empregador_id"], name: "index_vagas_on_empregador_id"
  end

  add_foreign_key "vagas", "empregadores"
end
