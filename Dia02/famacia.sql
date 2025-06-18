-- 1. Criação e uso do banco de dados

CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

-- 2. Criação da tabela tb_categoria

CREATE TABLE tb_categoria (
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
FOREIGN KEY (id_categoria) REFERENCES tb_categoria(id_categoria);

-- 5.  Inserção de 5 registros em tb_categoria

INSERT INTO tb_categoria (nome_categoria, tipo_categoria) VALUES
('Medicamentos', 'Uso contínuo'),
('Vitaminas', 'Suplementos'),
('Higiene Pessoal', 'Cuidados diários'),
('Dermocosméticos', 'Cosméticos'),
('Infantil', 'Cuidados com bebês');

--  6. Inserção de 8 registros em tb_produtos

INSERT INTO tb_produtos (nome_produto, descricao, preco, quantidade, id_categoria) VALUES
('Paracetamol 500mg', 'Analgésico e antitérmico', 12.90, 100, 1),
('Vitamina C 1g', 'Suplemento de ácido ascórbico', 34.90, 80, 2),
('Sabonete Líquido Neutro', 'Para peles sensíveis', 19.99, 50, 3),
('Protetor Solar FPS 50', 'Uso facial e corporal', 59.90, 60, 4),
('Pomada para Assaduras', 'Cuidados infantis', 21.50, 30, 5),
('Multivitamínico A-Z', 'Suplemento diário', 64.90, 40, 2),
('Shampoo Anticaspa', 'Controle da caspa e oleosidade', 32.00, 70, 3),
('Creme Hidratante Facial', 'Hidratação profunda', 75.00, 25, 4);

-- 7. SELECT: Produtos com valor maior que R$ 50,00

SELECT * FROM tb_produtos WHERE preco > 50.00;

-- 8. SELECT: Produtos com valor entre R$ 5,00 e R$ 60,00

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

-- 10. SELECT: Produtos que possuem a letra "C" no nome

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

-- 11. SELECT: INNER JOIN entre tb_produtos e tb_categoria

SELECT tb_produtos.nome_produto, tb_produtos.preco, tb_produtos.quantidade, tb_categoria.nome_categoria, tb_categoria.tipo_categoria
FROM tb_produtos
INNER JOIN tb_categoria
ON tb_produtos.id_categoria = tb_categoria.id_categoria;

-- 12. SELECT: INNER JOIN filtrando produtos da categoria "Cosméticos"

SELECT tb_produtos.nome_produto, tb_produtos.preco, tb_categoria.nome_categoria
FROM tb_produtos
INNER JOIN tb_categoria
ON tb_produtos.id_categoria = tb_categoria.id_categoria
WHERE tb_categoria.nome_categoria = 'Dermocosméticos';