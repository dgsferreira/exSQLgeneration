-- 1. Criação e uso do banco de dados

CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

-- 2. Criação da tabela tb_categorias

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(100) NOT NULL
);

-- 3. Criação da tabela tb_cursos

CREATE TABLE tb_cursos (
    id_curso BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    duracao INT NOT NULL, -- duração em horas
    id_categoria BIGINT
);

-- 4. Adicionando a chave estrangeira usando ALTER TABLE

ALTER TABLE tb_cursos 
ADD CONSTRAINT fk_cursos_categoria 
FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria);

-- 5. Inserção de 5 registros em tb_categorias

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Programação', 'Cursos relacionados a desenvolvimento de software'),
('Design', 'Cursos de design gráfico, UX/UI e afins'),
('Marketing Digital', 'Cursos sobre marketing e redes sociais'),
('Banco de Dados', 'Cursos de administração e modelagem de dados'),
('Java', 'Cursos específicos da linguagem Java');

-- 6. Inserção de 8 registros em tb_cursos

INSERT INTO tb_cursos (nome_curso, descricao, preco, duracao, id_categoria) VALUES
('Java Básico', 'Introdução à programação em Java', 750.00, 40, 5),
('Java Avançado', 'Tópicos avançados em Java', 1200.00, 60, 5),
('Design Gráfico para Iniciantes', 'Fundamentos do design gráfico', 450.00, 30, 2),
('Marketing Digital Completo', 'Estratégias de marketing online', 900.00, 50, 3),
('SQL para Iniciantes', 'Banco de dados e linguagem SQL', 600.00, 35, 4),
('Programação Web com JavaScript', 'Curso completo de JS', 700.00, 45, 1),
('UX/UI Design', 'Experiência do usuário e design de interface', 850.00, 40, 2),
('Administração de Banco de Dados', 'Gerenciamento de dados corporativos', 1100.00, 55, 4);

-- 7. SELECT: Cursos com valor maior que R$ 500,00

SELECT * FROM tb_cursos WHERE preco > 500.00;

-- 8. SELECT: Cursos com valor entre R$ 600,00 e R$ 1000,00

SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

-- 9. SELECT: Cursos que possuem a letra "J" no nome

SELECT * FROM tb_cursos WHERE nome_curso LIKE '%J%';

-- 10. SELECT: INNER JOIN entre tb_cursos e tb_categorias

SELECT tb_cursos.nome_curso, tb_cursos.preco, tb_cursos.duracao, tb_categorias.nome_categoria, tb_categorias.descricao_categoria
FROM tb_cursos
INNER JOIN tb_categorias
ON tb_cursos.id_categoria = tb_categorias.id_categoria;

-- 11. SELECT: INNER JOIN filtrando cursos da categoria "Java"

SELECT tb_cursos.nome_curso, tb_cursos.preco, tb_categorias.nome_categoria
FROM tb_cursos
INNER JOIN tb_categorias
ON tb_cursos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Java';

