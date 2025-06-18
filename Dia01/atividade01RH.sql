-- 1. Criar banco de dados
CREATE DATABASE db_rh;

-- 2. Selecionar o banco de dados
USE db_rh;

-- 3. Criar tabela de colaboradores
CREATE TABLE tb_informacoes (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    dataDeAniversario DATE,
    dataDeAdmissao DATE,
    cargo VARCHAR(255),
	salario DECIMAL (19,4) NOT NULL
);

-- 4. Inserir 5 colaboradores
INSERT INTO tb_informacoes (nome, dataDeAniversario, dataDeAdmissao, cargo, salario)
VALUES
("Douglas", "1997-09-03", "2018-03-03", "Gerente", 5000.00),
("Julia", "1990-05-12", "2015-08-20", "Analista de RH", 4200.00),
("Fabio", "1985-11-30", "2010-01-10", "Coordenador", 6200.50),
("Ale", "1992-03-15", "2019-07-01", "Assistente Administrativo", 1500.75),
("Alex", "1988-06-25", "2017-02-17", "Recrutador", 1900.00);


-- 5. Selecionar todos os registros (visualização geral)
SELECT * FROM tb_informacoes;

-- 6. Selecionar colaboradores com salário maior que 2000
SELECT * FROM tb_informacoes WHERE salario > 2000 ;

-- 7. Selecionar colaboradores com salário menor que 2000
SELECT * FROM tb_informacoes WHERE salario < 2000 ;

-- 8. Atualizar um registro
UPDATE tb_informacoes SET salario = 8333.33 WHERE id = 1;

SELECT * FROM tb_informacoes;

