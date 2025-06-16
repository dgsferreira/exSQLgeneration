-- 1. Criar banco de dados
CREATE DATABASE db_ecommerce;

-- 2. Selecionar o banco de dados
USE db_ecommerce;

-- 3. Criar tabela de colaboradores
CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (255) NOT NULL,
    quantidade INT, 
	preco DECIMAL (19,4) NOT NULL,
	categoria VARCHAR (100),
    marca VARCHAR (255)
);

-- 4. Inserir 1 produtos
INSERT INTO tb_produtos (nome, quantidade, preco, categoria, marca)
VALUES ("Star Wars", 33, 39.90, "Livros", "Universo dos Livros");

SELECT * FROM tb_produtos;

-- 4. Inserir 4 produtos
INSERT INTO tb_produtos (nome, quantidade, preco, categoria , marca)
VALUES 
("Senhor dos Anéis", 20, 49.90, "Livros", "HarperCollins"),
("Harry Potter", 25, 44.90, "Livros", "Rocco"),
("Percy Jackson", 18, 35.00, "Livros", "Intrínseca"),
("Duna", 15, 59.90, "Livros", "Aleph");

-- 5. Selecionar todos os registros (visualização geral)
SELECT * FROM tb_produtos;

-- 7. Selecionar produtos com preço maior que 40.00
SELECT * FROM tb_produtos WHERE preco > 40.00 ;

-- 7. Selecionar produtos com preço menor que 40.00
SELECT * FROM tb_produtos WHERE preco < 40.00 ;

-- 8. Atualizar um registro
UPDATE tb_produtos SET quantidade = 30 WHERE id = 5;

SELECT * FROM tb_produtos;