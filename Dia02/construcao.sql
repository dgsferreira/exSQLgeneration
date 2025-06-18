-- 1. Criação e uso do banco de dados

CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

-- 2. Criação da tabela tb_categorias

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(100) NOT NULL
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

-- 5. Inserção de 5 registros em tb_categorias

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Ferramentas', 'Ferramentas manuais e elétricas'),
('Material Elétrico', 'Cabos, tomadas e dispositivos elétricos'),
('Hidráulica', 'Torneiras, tubos e conexões'),
('Pintura', 'Tintas, pincéis e acessórios'),
('Madeira', 'Madeiras e derivados para construção');

-- 6. Inserção de 8 registros em tb_produtos

INSERT INTO tb_produtos (nome_produto, descricao, preco, quantidade, id_categoria) VALUES
('Martelo de Borracha', 'Ideal para acabamento', 85.50, 40, 1),
('Furadeira Elétrica', 'Potência de 600W', 320.00, 15, 1),
('Cabo de Energia 2,5mm', 'Rolo com 50 metros', 150.00, 25, 2),
('Torneira Monocomando', 'Metal cromado', 210.00, 30, 3),
('Pincel 3 polegadas', 'Para tinta látex', 18.90, 100, 4),
('Tinta Acrílica Branca', '18 litros', 250.00, 20, 4),
('Tábuas de Pinus 2x10', 'Madeira tratada', 75.00, 50, 5),
('Parafuso 3,5x25mm', 'Pacote com 100 unidades', 12.00, 200, 1);

-- 7. SELECT: Produtos com valor maior que R$ 100,00

SELECT * FROM tb_produtos WHERE preco > 100.00;

-- 8. SELECT: Produtos com valor entre R$ 70,00 e R$ 150,00

SELECT * FROM tb_produtos WHERE preco BETWEEN 70.00 AND 150.00;

-- 9. SELECT: Produtos que possuem a letra "C" no nome

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

-- 10. SELECT: INNER JOIN entre tb_produtos e tb_categorias

SELECT tb_produtos.nome_produto, tb_produtos.preco, tb_produtos.quantidade, tb_categorias.nome_categoria, tb_categorias.descricao_categoria
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria;

-- 11. SELECT: INNER JOIN filtrando produtos da categoria "Hidráulica"

SELECT tb_produtos.nome_produto, tb_produtos.preco, tb_categorias.nome_categoria
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Hidráulica';