CREATE TABLE Estado (
    idEstado INT PRIMARY KEY,
    UF CHAR(2),
    descricao VARCHAR(100)
);

CREATE TABLE Cidade (
    idCidade INT PRIMARY KEY,
    descricao VARCHAR(100),
    idEstado INT,
    FOREIGN KEY (idEstado) REFERENCES Estado(idEstado)
);

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cpfCnpj VARCHAR(20),
    dataNasc DATE
);

CREATE TABLE Telefone (
    idTelefone INT PRIMARY KEY,
    numero VARCHAR(15),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Email (
    idEmail INT PRIMARY KEY,
    email VARCHAR(100),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY,
    logradouro VARCHAR(100),
    complemento VARCHAR(50),
    idCliente INT,
    idCidade INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idCidade) REFERENCES Cidade(idCidade)
);

CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY,
    descricao VARCHAR(100)
);

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    descricao VARCHAR(200),
    quantidade INT,
    idCliente INT,
    idEstoque INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque)
);

CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY,
    status VARCHAR(50),
    dataPrevisao DATE,
    idPedido INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

CREATE TABLE Categoria (
    idCategoria INT PRIMARY KEY,
    tipo VARCHAR(50),
    dimensoes VARCHAR(100)
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(200),
    preco DECIMAL(10,2),
    imagem VARCHAR(255),
    idCategoria INT,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

ALTER TABLE Cliente MODIFY idCliente INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Telefone MODIFY idTelefone INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Email MODIFY idEmail INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE Endereco MODIFY idEndereco INT AUTO_INCREMENT PRIMARY KEY;
