json.extract! candidatura, :id, :mensagem, :candidato_id, :vaga_id, :created_at, :updated_at
json.url candidatura_url(candidatura, format: :json)
