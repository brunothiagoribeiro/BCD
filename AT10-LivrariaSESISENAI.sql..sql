CREATE DATABASE IF NOT EXISTS db_livrariasenai;

USE db_livrariasenai;

CREATE TABLE IF NOT EXISTS tb_cliente(
id_cliente INT NOT NULL PRIMARY KEY,
nome VARCHAR(40),
cpf VARCHAR(11),
rg VARCHAR(11),
email VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS tb_clienteEndereco(
id_telefone INT NOT NULL PRIMARY KEY,
telefone VARCHAR(15),
CLIENTE_id_cliente INT,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente (id_cliente)
);

CREATE TABLE IF NOT EXISTS tb_clienteTelefone(
id_endereco INT NOT NULL PRIMARY KEY,
rua VARCHAR(45),
numero INT,
cidade VARCHAR(45),
estado VARCHAR(45),
CLIENTE_id_cliente INT,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente (id_cliente)
);


CREATE TABLE IF NOT EXISTS tb_pedido(
id_pedido INT NOT NULL PRIMARY KEY,
valor DECIMAL(10,2),
dia DATE,
CLIENTE_id_cliente INT,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente (id_cliente)
);

CREATE TABLE  IF NOT EXISTS tb_livro(
id_livro INT NOT NULL PRIMARY KEY,
titulo VARCHAR(45),
categoria VARCHAR(45),
isbn VARCHAR(13),
ano YEAR,
valor DECIMAL(10,2),
autor DECIMAL(50),
EDITORA_id_editora INT,
FOREIGN KEY (EDITORA_id_editora) REFERENCES tb_editora (id_editora)
);

CREATE TABLE  IF NOT EXISTS tb_editora(
id_editora INT NOT NULL PRIMARY KEY,
nome VARCHAR(45),
contato VARCHAR(45),
email VARCHAR(45),
CLIENTE_id_cliente INT
);

CREATE TABLE IF NOT EXISTS tb_estoque(
quantidade INT,
LIVRO_id_livro INT,
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_livro (id_livro)
);

CREATE TABLE IF NOT EXISTS tb_itemPedido(
quantidade INT,
valor DECIMAL,
PEDIDO_id_pedido INT,
FOREIGN KEY (PEDIDO_id_pedido) REFERENCES tb_pedido (id_pedido),
LIVRO_id_livro INT,
FOREIGN KEY (LIVRO_id_livro) REFERENCES tb_livro (id_livro)
);


