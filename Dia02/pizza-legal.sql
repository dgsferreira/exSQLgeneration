-- 1. Criação e uso do banco de dados

CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

-- 2. Criação da tabela tb_categorias

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    tipo_categoria ENUM('Salgada', 'Doce', 'Vegetariana', 'Vegana') NOT NULL
);

-- 3. Criação da tabela tb_pizzas

CREATE TABLE tb_pizzas (
    id_pizza BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(100) NOT NULL,
    ingredientes TEXT NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    id_categoria BIGINT
);

-- 4. Adicionando a chave estrangeira usando ALTER TABLE

ALTER TABLE tb_pizzas 
ADD CONSTRAINT fk_pizzas_categorias 
FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria);

-- 5.  Inserção de 5 registros em tb_categorias

INSERT INTO tb_categorias (nome_categoria, tipo_categoria) VALUES
('Tradicional', 'Salgada'),
('Especial', 'Salgada'),
('Doces Gourmet', 'Doce'),
('Vegetarianas', 'Vegetariana'),
('Veganas Premium', 'Vegana');

--  6. Inserção de 8 registros em tb_pizzas

INSERT INTO tb_pizzas (nome_pizza, ingredientes, preco, tamanho, id_categoria) VALUES
('Margherita', 'Molho, mussarela, tomate e manjericão', 42.00, 'Média', 1),
('Quatro Queijos', 'Mussarela, parmesão, gorgonzola e catupiry', 55.00, 'Grande', 2),
('Frango com Catupiry', 'Frango desfiado, catupiry e milho', 48.00, 'Média', 1),
('Brigadeiro', 'Chocolate, granulado e leite condensado', 38.00, 'Média', 3),
('Romeu e Julieta', 'Goiabada e queijo', 46.00, 'Média', 3),
('Vegetariana Suprema', 'Pimentão, cebola, azeitona, milho e brócolis', 50.00, 'Grande', 4),
('Pepperoni', 'Molho, mussarela e pepperoni', 60.00, 'Grande', 2),
('Pizza Vegana de Cogumelos', 'Molho, cogumelos, rúcula e queijo vegano', 65.00, 'Grande', 5);

-- 7. SELECT – Pizzas com valor maior que R$ 45,00

SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- 8. SELECT – Pizzas com valor entre R$ 50,00 e R$ 100,00

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- 9. SELECT – Pizzas com a letra "M" no nome

SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%m%';

-- 10. . SELECT – INNER JOIN entre tb_pizzas e tb_categorias

SELECT nome_pizza, preco, tamanho, tb_categorias.nome_categoria, tb_categorias.tipo_categoria
FROM tb_pizzas
INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id_categoria;

-- 11. SELECT – INNER JOIN filtrando por categoria específica (ex: Doce)

SELECT nome_pizza, preco, tamanho, tb_categorias.nome_categoria, tb_categorias.tipo_categoria
FROM tb_pizzas
INNER JOIN tb_categorias
ON tb_pizzas.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.tipo_categoria = 'Doce';