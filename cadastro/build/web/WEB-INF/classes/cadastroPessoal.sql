CREATE DATABASE IF NOT EXISTS cadastroPessoal;
USE cadastroPessoal;

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco_venda DECIMAL(10,2),
    preco_custo DECIMAL(10,2),
    unidade_medida VARCHAR(20)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100),
    cpf_cnpj VARCHAR(20),
    endereco VARCHAR(200)
);

CREATE TABLE estoque (
    id_lote INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    quantidade_atual INT,
    data_validade DATE,
    data_entrada DATE,
    numero_lote VARCHAR(50),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE,
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    valor_total DECIMAL(10,2),
    forma_pagamento VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE venda_item (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_lote INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (id_lote) REFERENCES estoque(id_lote),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
