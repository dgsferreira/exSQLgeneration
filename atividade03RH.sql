-- 1. Criar banco de dados
CREATE DATABASE db_escola;

-- 2. Selecionar o banco de dados
USE db_escola;

-- 3. Criar a tabela de estudantes com 5 atributos relevantes
CREATE TABLE tb_estudantes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    dataNascimento DATE,
    matricula VARCHAR(20) UNIQUE,
    turma VARCHAR(10),
    notaFinal DECIMAL(4,2) NOT NULL
);

-- 4. Inserir 8 estudantes
INSERT INTO tb_estudantes (nome, dataNascimento, matricula, turma, notaFinal)
VALUES 
("Ana Clara", "2008-03-15", "2023001", "7A", 8.5),
("Bruno Silva", "2007-08-22", "2023002", "8B", 6.8),
("Carlos Henrique", "2009-01-10", "2023003", "6A", 7.2),
("Daniela Souza", "2008-05-09", "2023004", "7B", 5.9),
("Eduardo Lima", "2007-11-25", "2023005", "8A", 9.1),
("Fernanda Torres", "2008-02-18", "2023006", "7A", 4.5),
("Gabriel Santos", "2009-06-30", "2023007", "6B", 7.9),
("Helena Costa", "2007-12-03", "2023008", "8C", 6.0);

-- 5. Selecionar todos os registros (visualização geral)
SELECT * FROM tb_estudantes;

-- 6. SELECT - estudantes com nota maior que 7.0
SELECT * FROM tb_estudantes WHERE notaFinal > 7.0;

-- 7. SELECT - estudantes com nota menor que 7.0
SELECT * FROM tb_estudantes WHERE notaFinal < 7.0;

-- 8. Atualizar um registro (ex: corrigir nota de Fernanda Torres)
UPDATE tb_estudantes
SET notaFinal = 7.5
WHERE id = 6;

SELECT * FROM tb_estudantes;