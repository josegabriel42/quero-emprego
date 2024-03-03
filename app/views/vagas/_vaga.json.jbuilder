json.extract! vaga, :id, :titulo, :descricao, :salario, :empregador_id, :created_at, :updated_at
json.url vaga_url(vaga, format: :json)
