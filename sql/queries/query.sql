-- name: ListCategories :many
SELECT * FROM categories;
-- O comentario acima é uma anotação do próprio SQLC, aqui significa que o nome da nossa função será ListCategories e o retorno será muitos registros

-- name: GetCategory :one
SELECT * FROM categories 
WHERE id = ?;
-- O comentario acima é uma anotação do próprio SQLC, aqui significa que o nome da nossa função será GetCategory e o retorno será de 1 registro

-- name: CreateCategory :exec
INSERT INTO categories (id, name, description) 
VALUES (?,?,?);
-- Nesse caso o nome do nosso metódo será CreateCategory e será uma execução, irá executar alguma o comando e sem retorno, pare ter retorno só substituir o :exec para :execresult
-- Com o :execresult teriamos o retorno criado da nossa requisição, mudaria o nosso método na nossa struct

-- name: UpdateCategory :exec
UPDATE categories SET name = ?, description = ? 
WHERE id = ?;

-- name: DeleteCategory :exec
DELETE FROM categories WHERE id = ?;

-- name: CreateCourse :exec
INSERT INTO courses (id, name, description, category_id, price)
VALUES (?,?,?,?,?);
-- Se estivessemos usando POSTGRESS usariamos $1, $2, $3 no lugar de ?, ?, ?, ?

-- name: ListCourses :many
SELECT c.*, ca.name as category_name 
FROM courses c JOIN categories ca ON c.category_id = ca.id;