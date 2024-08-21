### Iniciando com SQLC

Vamos utilizar a lib golang-migrate

https://github.com/golang-migrate/migrate

Depois de instalar a lib executar o comando migrate 

migrate create -ext=sql -dir=sql/migrations -seq init

dir - é o diretório que queremos criar as nossas migrates, nesse caso será criado uma pasta "sql/migrations" e será criado 2 arquivos nessa pasta, init_ip.sql é o arquivo de criação das tabelas e o down o drop das nossas tabelas

##### Criar nossas tabelas com nossas migrations

migrate -path=sql/migrations -database "mysql://root:root@tcp(localhost:3306)/courses" -verbose up

-path - indica o path de onde está as nossas migrations, no caso o caminho das pastas

-database - indica o banco de dados, usuário e senha e o banco de dados

-verbose - Serve para descrever os comandos que estão sendo executados

up - já é do comando para executar nossas migrations

migrate -path=caminho_das_nossas/localizaca_das_nossas_migrations -database "banco_de_dados_no_caso_mysql://usuario:password@tcp(ip_do_banco:porta_do_banco)/nome_do_banco" -verbose up

Obs: comando para descrever nossa tabela, mostrar as colunas desc courses

##### Fazer o down das nossas tabelas

migrate -path=sql/migrations -database "mysql://root:root@tcp(localhost:3306)/courses" -verbose down

#### Criando MakeFile

MakeFile serve para executarmos comando nesse caso simplificadamente, então faz um "alias" de todo o comando para apenas 1 palavra, exemplo

createmigration:
    migrate create -ext=sql -dir=sql/migrations -seq init

### Executar comando do Makefiile

make nome_do_comando

ex:
    make createmigration
    make migrate

### Instalando SQLC 

https://sqlc.dev/

Instalando no projeto

go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest


### Criando nosso arquivo SQLC

Criar o arquivo na raiz do projeto

sqlc.yaml

Mais informações sobre o arquivo abrir o arquivo

Depois de criar o sqlc.yaml iremos criar as nossas queries para que o SQLC crie os comandos SQL a partir de uma query

OBS: Nunca alteramos as queries criadas em internal pelo SQLC, alteramos apenas o arquivo query.sql, se alterarmos as queries criadas pelo SQLC não surtirá efeito, toda vez que executar o comando sqlc generate as queries serão alteradas

Depois de criar as nossas queries executar o comando que irá excutar as nossas queries

sqlc generate