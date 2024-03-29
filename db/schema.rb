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

ActiveRecord::Schema[7.0].define(version: 2024_03_03_210133) do
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

  create_table "candidaturas", force: :cascade do |t|
    t.text "mensagem"
    t.integer "candidato_id", null: false
    t.integer "vaga_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidato_id"], name: "index_candidaturas_on_candidato_id"
    t.index ["vaga_id"], name: "index_candidaturas_on_vaga_id"
  end

  create_table "empregadores", force: :cascade do |t|
    t.string "nome", default: "", null: false
    t.string "nomeEmpresa", default: "", null: false
    t.string "email", default: "", null: false
    t.string "cnpj", default: "", null: false
    t.string "endereco", default: "", null: false
    t.string "telefone", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnpj"], name: "index_empregadores_on_cnpj"
    t.index ["email"], name: "index_empregadores_on_email"
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

  add_foreign_key "candidaturas", "candidatos"
  add_foreign_key "candidaturas", "vagas"
  add_foreign_key "vagas", "empregadores"
end
