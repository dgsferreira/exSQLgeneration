-- 1. Criação e uso do banco de dados

CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

-- 2. Criação da tabela tb_categorias

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    tipo_categoria VARCHAR(50) NOT NULL
);

-- 3. Criação da tabela tb_produtos

CREATE TABLE tb_produtos (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    id_categoria BIGINT
);

-- 4. Adicionando a chave estrangeira usando ALTER TABLE

ALTER TABLE tb_produtos 
ADD CONSTRAINT fk_produtos_categoria 
FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria);

-- 5.  Inserção de 5 registros em tb_categorias

INSERT INTO tb_categorias (nome_categoria, tipo_categoria) VALUES
('Carnes Bovinas', 'Bovino'),
('Carnes Suínas', 'Suíno'),
('Aves', 'Frango e derivados'),
('Embutidos', 'Industrializados'),
('Exóticas', 'Carnes especiais');

-- 6. Inserção de 8 registros em tb_produtos

INSERT INTO tb_produtos (nome_produto, descricao, preco, quantidade, id_categoria) VALUES
('Picanha Bovina', 'Corte nobre bovino', 89.90, 20, 1),
('Costela Suína', 'Ideal para churrasco', 42.50, 15, 2),
('Filé de Peito de Frango', 'Frango sem osso e sem pele', 27.90, 40, 3),
('Linguiça Toscana', 'Ideal para churrasco', 19.90, 50, 4),
('Coração de Frango', 'Muito usado em espetinhos', 23.00, 35, 3),
('Carne de Cordeiro', 'Corte especial de cordeiro', 119.00, 10, 5),
('Alcatra Bovina', 'Corte macio e saboroso', 64.90, 25, 1),
('Presunto Defumado', 'Produto embutido curado', 55.00, 30, 4);

-- 7. SELECT: Produtos com valor maior que R$ 50,00

SELECT * FROM tb_produtos WHERE preco > 50.00;

-- 8. SELECT: Produtos com valor entre R$ 50,00 e R$ 150,00

SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

-- 9. SELECT: Produtos que possuem a letra "C" no nome

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

-- 10. SELECT: INNER JOIN entre tb_produtos e tb_categorias

SELECT tb_produtos.nome_produto, tb_produtos.preco, tb_produtos.quantidade, tb_categorias.nome_categoria, tb_categorias.tipo_categoria
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria;

-- 11. SELECT: INNER JOIN filtrando produtos da categoria "Aves"

SELECT tb_produtos.nome_produto, tb_produtos.preco, tb_categorias.nome_categoria
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Aves';