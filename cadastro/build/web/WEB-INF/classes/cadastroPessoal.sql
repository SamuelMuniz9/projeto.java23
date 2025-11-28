CREATE DATABASE IF NOT EXISTS cadastroPessoal;
USE cadastroPessoal;

-- Tabela PRODUTOS
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco_venda DECIMAL(10,2),
    preco_custo DECIMAL(10,2),
    unidade_medida VARCHAR(20)
);

-- Tabela CLIENTES
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(20),
    emailComercial VARCHAR(100),
    telefoneComercial VARCHAR(20),
    funcaoCargo VARCHAR(200),
    areaFuncionalDepartamento VARCHAR(200),
    nomeDeSuaOrganizacao VARCHAR(200),
    paisRegiao VARCHAR(200),
    cepCodigoPostal VARCHAR(200),
    interessePrincipalProduto VARCHAR(200)
);

-- Tabela ESTOQUE (cada lote pertence a um produto)
CREATE TABLE estoque (
    id_lote INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade_atual INT,
    data_validade DATE,
    data_entrada DATE,
    numero_lote VARCHAR(50),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Tabela VENDA (cada venda tem 1 cliente)
CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE,
    id_cliente INT,
    valor_total DECIMAL(10,2),
    forma_pagamento VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabela VENDA_ITEM (itens que compõem uma venda)
CREATE TABLE venda_item (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    id_lote INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (id_lote) REFERENCES estoque(id_lote),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
