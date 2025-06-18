-- 1. Criação e uso do banco de dados

CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

-- 2. Criação da tabela tb_classes

CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(50) NOT NULL, 
    tipo_classe ENUM('Agressor', 'Tanque', 'Curandeiro', 'Suporte') NOT NULL
);

-- 3. Criação da tabela tb_personagens

CREATE TABLE tb_personagens (
    id_personagem BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_personagem VARCHAR(100) NOT NULL, 
    poder_ataque BIGINT NOT NULL,
    poder_defesa BIGINT NOT NULL,
    nivel INT NOT NULL CHECK (nivel <= 999),
    id_classe BIGINT
);

-- 4. Adicionando a chave estrangeira usando ALTER TABLE

ALTER TABLE tb_personagens 
ADD CONSTRAINT fk_personagens_classes 
FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe);

-- 5. Inserção de registros em tb_classes

INSERT INTO tb_classes (nome_classe, tipo_classe) VALUES
('Cavaleiro Jedi', 'Tanque'),
('Sith Lord', 'Agressor'),
('Caçador de Recompensas', 'Agressor'),
('Assassino', 'Agressor'),
('Mestre Healer (Curandeiro)', 'Curandeiro');

-- 6. Inserção de registros em tb_personagens

INSERT INTO tb_personagens (nome_personagem, poder_ataque, poder_defesa, nivel, id_classe) VALUES
('Maul', 2200, 1800, 35, 2),
('Vader', 2800, 900, 40, 2),
('Sidious', 1900, 1200, 33, 2),
('Kenobi', 2400, 1500, 38, 1),
('Boba Fett', 1600, 2000, 32, 3),
('Grievous', 2100, 1700, 36, 4),
('Anakin', 2600, 1000, 39, 1),
('Yoda', 2300, 1300, 37, 5);

-- 7. Personagens com poder de ataque maior que 2000

SELECT * FROM tb_personagens
WHERE poder_ataque > 2000;

-- 8. Personagens com poder de ataque maior que 2000

SELECT * FROM tb_personagens
WHERE poder_defesa BETWEEN 1000 AND 2000;

-- 9. Personagens com a letra "C" no nome (case insensitive)

SELECT * FROM tb_personagens WHERE LOWER(nome_personagem) LIKE '%e%';

-- 10. Personagens com poder de ataque maior que 2000

SELECT * FROM tb_personagens
WHERE poder_defesa BETWEEN 1000 AND 2000;

-- 11. INNER JOIN entre tb_personagens e tb_classes

SELECT nome_personagem, poder_ataque, poder_defesa, nivel, tb_classes.tipo_classe
FROM tb_personagens
INNER JOIN tb_classes
ON tb_personagens.id_classe = tb_classes.id;

-- 12. INNER JOIN com filtro por classe específica, exemplo: personagens da classe "Cavaleiro Jedi"
SELECT nome_personagem, poder_ataque, poder_defesa, nivel, tb_classes.tipo_classe
FROM tb_personagens
INNER JOIN tb_classes
ON tb_personagens.id_classe = tb_classes.id
WHERE tb_classes.nome_classe = 'Cavaleiro Jedi';