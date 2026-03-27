# API de Usuários

API REST construída com Ruby + Sinatra + PostgreSQL.

## Endpoints

| Método | Rota | Descrição |
|--------|------|-----------|
| GET | /usuarios | Lista todos os usuários |
| GET | /usuarios/:id | Busca usuário por id |
| POST | /usuarios | Cria um usuário |
| PUT | /usuarios/:id | Atualiza um usuário |
| DELETE | /usuarios/:id | Deleta um usuário |

## Como rodar

1. Instale as dependências:
gem install sinatra pg dotenv puma rackup

2. Configure o `.env` com suas credenciais do banco

3. Rode o servidor:
ruby app.rb