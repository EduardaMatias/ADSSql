CREATE DATABASE db_supermercado;

USE db_supermercado;

CREATE TABLE tb_cliente(
	cd_cliente INT IDENTITY(1,1) NOT NULL,
	nm_cliente VARCHAR(50) NOT NULL,
	dt_nasc_cliente DATE NOT NULL,

	CONSTRAINT pk_cliente PRIMARY KEY(cd_cliente)
);

SELECT * FROM tb_cliente;

CREATE TABLE tb_pedido(
	cd_pedido INT IDENTITY(1,1) NOT NULL,
	dt_pedido DATE NOT NULL,
	vl_pedido FLOAT NOT NULL,
	cd_cliente_pedido INT NOT NULL,
	
	CONSTRAINT pk_pedido PRIMARY KEY(cd_pedido),
	CONSTRAINT fk_cd_cliente_pedido FOREIGN KEY(cd_cliente_pedido) 
	REFERENCES tb_cliente(cd_cliente)
);

SELECT * FROM tb_pedido;

CREATE TABLE tb_produto(
	cd_produto INT IDENTITY(1,1) NOT NULL,
	nm_produto VARCHAR(50) NOT NULL,
	vl_produto FLOAT NOT NULL,
	
	CONSTRAINT pk_produto PRIMARY KEY(cd_produto)
);

SELECT * FROM tb_produto;

CREATE TABLE tb_item(
	cd_item INT IDENTITY(1,1) NOT NULL,
	cd_pedido_item INT NOT NULL,
	cd_produto_item INT NOT NULL,
	
	CONSTRAINT pk_item PRIMARY KEY(cd_item),
	CONSTRAINT fk_cd_pedido_item FOREIGN KEY(cd_pedido_item) 
	REFERENCES tb_pedido(cd_pedido),
	CONSTRAINT fk_cd_produto_item FOREIGN KEY(cd_produto_item) 
	REFERENCES tb_produto(cd_produto)
);

SELECT * FROM tb_item;

INSERT INTO tb_cliente VALUES('Eduarda', '28-04-2003')

INSERT INTO tb_pedido VALUES('28/04/2022', 10.50, 1)

INSERT INTO tb_produto VALUES('Suco de uva', 10.50)

INSERT INTO tb_item VALUES(1, 1)

UPDATE tb_cliente
SET nm_cliente = 'Paulo'
WHERE cd_cliente = 1;

DELETE FROM tb_cliente 
WHERE nm_cliente = 'Eduarda';

