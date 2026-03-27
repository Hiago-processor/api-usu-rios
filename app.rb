require 'sinatra'
require 'json'
require 'pg'
require 'dotenv'

DB = PG.connect(
  host:     '127.0.0.1',
  port:     5432,
  dbname:   'meu_banco',
  user:     'postgres',
  password: 'Spacer9090'
)

# Listar todos os usuários
get '/usuarios' do
  content_type :json
  result = DB.exec("SELECT * FROM usuarios")
  result.to_a.to_json
end

# Buscar um usuário por id
get '/usuarios/:id' do
  content_type :json
  result = DB.exec_params("SELECT * FROM usuarios WHERE id = $1", [params[:id]])
  result.to_a.first.to_json
end

# Criar usuário
post '/usuarios' do
  content_type :json
  body = JSON.parse(request.body.read)
  DB.exec_params(
    "INSERT INTO usuarios (nome, email) VALUES ($1, $2)",
    [body['nome'], body['email']]
  )
  { mensagem: 'Usuário criado!' }.to_json
end

# Atualizar usuário
put '/usuarios/:id' do
  content_type :json
  body = JSON.parse(request.body.read)
  DB.exec_params(
    "UPDATE usuarios SET nome = $1, email = $2 WHERE id = $3",
    [body['nome'], body['email'], params[:id]]
  )
  { mensagem: 'Usuário atualizado!' }.to_json
end

# Deletar usuário
delete '/usuarios/:id' do
  content_type :json
  DB.exec_params("DELETE FROM usuarios WHERE id = $1", [params[:id]])
  { mensagem: 'Usuário deletado!' }.to_json
end