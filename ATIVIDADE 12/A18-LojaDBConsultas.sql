CREATE DATABASE IF NOT EXISTS LojaDB;

USE LojaDB;

CREATE TABLE IF NOT EXISTS tb_vendas (
id_nf INT,
id_item INT,
cod_produto INT,
valor_unit DECIMAL(5, 2),
quantidade INT,
desconto INT
);

INSERT INTO tb_vendas (id_nf, id_item, cod_produto, valor_unit, quantidade, desconto) VALUES
(1, 1, 1, 25.00, 10, 5),
(1, 2, 2, 13.00, 3, NULL),
(1, 3, 3, 15.00, 2, NULL),
(1, 4, 4, 10.00, 1, NULL),
(1, 5, 5, 30.00, 1, NULL),
(2, 1, 3, 15.00, 4, NULL),
(2, 2, 4, 10.00, 5, NULL),
(2, 3, 5, 30.00, 7, NULL),
(3, 1, 1, 25.00, 5, NULL),
(3, 2, 4, 10.00, 4, NULL),
(3, 3, 5, 30.00, 5, NULL),
(3, 4, 2, 13.50, 7, NULL),
(4, 1, 5, 30.00, 10, 15),
(4, 2, 4, 10.00, 12, 5),
(4, 3, 1, 25.00, 13, 5),
(4, 4, 2, 13.50, 15, 5),
(5, 1, 3, 15.00, 3, NULL),
(5, 2, 5, 30.00, 6, NULL),
(6, 1, 1, 25.00, 22, 15),
(7, 1, 1, 25.00, 10, 3),
(7, 2, 2, 13.50, 10, 4),
(7, 3, 3, 15.00, 10, 4),
(7, 4, 5, 30.00, 10, 1);

SELECT * FROM tb_vendas;

/*Exercício 1*/
SELECT id_nf, id_item, cod_produto, valor_unit FROM tb_vendas
WHERE desconto IS NULL;

/*Exercício 2*/
SELECT id_nf, id_item, cod_produto, valor_unit,
valor_unit - (valor_unit * (desconto / 100)) AS valor_vendido
FROM tb_vendas
WHERE desconto > 0;

/*Exercício 3*/
UPDATE tb_vendas
SET desconto = 0
WHERE desconto IS NULL;

/*Exercício 4*/
SELECT id_nf, id_item, cod_produto, valor_unit, quantidade * valor_unit
AS valor_total, desconto, valor_unit - (valor_unit * (desconto / 100))
AS valor_vendido
FROM tb_vendas;

/*EXERCICIO 5*/
SELECT id_nf,
SUM(quantidade * valor_unit)
AS valor_total
FROM tb_vendas

/*EXERCICIO 6*/




