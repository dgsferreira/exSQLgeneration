DROP DATABASE db_quitanda;

CREATE DATABASE db_quitanda;
# CRATE SCHEMA db_quitanda;

USE db_quitanda;

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	quantidade INT,
    datavalidade DATE,
	preco DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id)
);

Aqui tem todos os comandos de insert e de select
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
values ("tomate",100, "2023-12-15", 8.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
values ("maçã",20, "2023-12-15", 5.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
values ("laranja",50, "2023-12-15", 10.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
values ("banana",200, "2023-12-15", 12.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
values ("uva",1200, "2023-12-15", 30.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
values ("pêra",500, "2023-12-15", 2.99);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos ORDER BY preco ASC LIMIT 3;

#pega a média de preço
SELECT AVG(preco) AS media_preco FROM tb_produtos;

# soma todos os preços
SELECT SUM(preco) FROM tb_produtos;

#Pegar o valor mais baixo
SELECT MIN(preco) FROM tb_produtos;

SELECT nome AS "nome do produto" from tb_produtos;

# Todos os produtos que custem R$5,00, R$8,00 ou 12,00
SELECT * FROM tb_produtos WHERE preco = 5.00 OR preco = 8.00 OR preco = 12.00;
SELECT * FROM tb_produtos WHERE preco IN(5.00, 8.00, 12.00);

# Todos os produtos que custem entre 5,00 e 20,00
SELECT * FROM tb_produtos WHERE preco >= 5.00 AND preco <= 20.00;
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 20.00;

# pesquisar por campo de texto
SELECT * FROM tb_produtos WHERE nome LIKE "%ma%";

# criando tabela de categorias
CREATE TABLE tb_categorias(
	id bigint AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255) NOT NULL
);

# inserindo valores dentro da tabela
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");

INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");

INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");

INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");

INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");

INSERT INTO tb_categorias (descricao)
VALUES ('Outros');

SELECT * FROM tb_categorias;

# alterando a tabela de produtos, para adicionar a coluna "categoriaid"
ALTER TABLE tb_produtos ADD categoriaid BIGINT;

# criando o relacionamento entre as tabelas
ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id);

/*
 ALTER TABLE tabelainicial ADD CONSTRAINT nomebonitinho
 FOREIGN KEY (campo novo) REFERENCES tabela secundaria (id)
*/

SELECT * FROM tb_produtos;

#UPDATE nomedatabela SET nomedacoluna = dado WHERE id = numero
UPDATE tb_produtos SET categoriaid = 3 WHERE id = 1;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 2;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 3;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 4;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 5;
UPDATE tb_produtos SET categoriaid = 1 WHERE id = 6;

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos (nome, quantidade, datavalidade, preco, categoriaid)
VALUES ("Grapefruit", 3000, "2022-03-13", 50.00, 1);

INSERT INTO tb_produtos (nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos (nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

SELECT * FROM tb_produtos;

# selecionar todos os dados da tabela produtos que tenham categoria registrada
SELECT nome, quantidade, datavalidade, preco, tb_categorias.descricao 
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

# selecinar todos os produtos, independente de ter categoria ou não
/* 
isso acontece pq a tabela produtos está na ESQUERDA do comando JOIN, e o LEFT join vai trazer todos os
dados da tabela da esquerda, mesmo que eles não estejam relacionados a um valor na tabela da direita
*/
SELECT nome, quantidade, datavalidade, preco, tb_categorias.descricao 
FROM tb_categorias LEFT JOIN tb_produtos
ON tb_produtos.categoriaid = tb_categorias.id;