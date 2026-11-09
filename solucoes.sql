-- Questão 1: Selecionar todos os títulos dos livros e seus respectivos anos de publicação.
SELECT titulo, ano_publicacao FROM livros;

-- Questão 2: Quantos livros foram publicados?
SELECT COUNT(*) AS total_livros FROM livros;

-- Questão 3: Calcule a média do ano de publicação dos livros para cada editora. Exiba o nome da editora e a média do ano de publicação.
SELECT e.nome AS editora, AVG(l.ano_publicacao) AS media_ano
FROM livros l
JOIN editoras e ON l.editora_id = e.editora_id
GROUP BY e.nome;

-- Questão 4: Qual é o livro mais antigo e o mais recente no acervo? Exiba o título e o ano de publicação para ambos.
(SELECT titulo, ano_publicacao FROM livros ORDER BY ano_publicacao ASC LIMIT 1)
UNION
(SELECT titulo, ano_publicacao FROM livros ORDER BY ano_publicacao DESC LIMIT 1);

-- Questão 5: Liste todos os livros publicados após o ano 2000.
SELECT * FROM livros WHERE ano_publicacao > 2000;

-- Questão 6: Selecione todos os autores e ordene-os em ordem alfabética crescente pelo nome.
SELECT * FROM autores ORDER BY nome ASC;

-- Questão 7: Liste as editoras que publicaram mais de 2 livros.
SELECT e.nome, COUNT(l.livro_id) AS total_livros
FROM editoras e
JOIN livros l ON e.editora_id = l.editora_id
GROUP BY e.nome
HAVING COUNT(l.livro_id) > 2;

-- Questão 8: Crie uma query que liste o título do livro e uma coluna Status que indique 'Disponível' se o livro não tiver data_devolucao preenchida nos empréstimos, ou 'Emprestado' caso contrário.
SELECT l.titulo,
       CASE 
           WHEN e.data_devolucao IS NULL THEN 'Disponível'
           ELSE 'Emprestado'
       END AS Status
FROM livros l
LEFT JOIN emprestimos e ON l.livro_id = e.livro_id;

-- Questão 9: JOIN (INNER JOIN): Liste o título de todos os livros juntamente com o nome do autor e o nome da editora.
SELECT l.titulo, a.nome AS autor, ed.nome AS editora
FROM livros l
INNER JOIN autores a ON l.autor_id = a.autor_id
INNER JOIN editoras ed ON l.editora_id = ed.editora_id;

-- Questão 10: JOIN (LEFT JOIN) e WHERE: Encontre todos os livros que não possuem um autor cadastrado. Exiba o título do livro.
SELECT l.titulo
FROM livros l
LEFT JOIN autores a ON l.autor_id = a.autor_id
WHERE l.autor_id IS NULL;
