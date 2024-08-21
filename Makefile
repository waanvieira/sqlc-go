# Apelido do comando
createmigration:
	migrate create -ext=sql -dir=sql/migrations -seq init

migrate:
	migrate -path=sql/migrations -database "mysql://root:root@tcp(localhost:3306)/courses" -verbose up

migratedown:
	migrate -path=sql/migrations -database "mysql://root:root@tcp(localhost:3306)/courses" -verbose down
# PHONY serve para eliminar a possibilidade de executar outro comando que esteja na raiz do projeto, criando assim uma lista para executar os comandos apenas aqui
.PHONY: migrate migratedown createmigration