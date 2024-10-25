CREATE TABLE funcionarios (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (100) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
salario DECIMAL(10,2) NOT NULL,
especialidade VARCHAR(100) NOT NULL
);

INSERT INTO funcionarios (nome, cpf, salario, especialidade) 
VALUES 
('João da Silva', '123.456.789-00', 3000.00, 'Desenvolvedor'),
('Maria Oliveira', '987.654.321-00', 3500.00, 'Analista'),
('Carlos Souza', '111.222.333-44', 2800.00, 'Designer'),
('Ana Costa', '555.666.777-88', 4000.00, 'Gerente de Projetos'),
('Fernanda Lima', '999.888.777-66', 4500.00, 'Arquiteta de Sistemas');

CREATE TABLE clientes (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE
);

INSERT INTO clientes (nome,cpf)
VALUES 
('José Almeida', '123.456.789-01'),
('Mariana Santos', '987.654.321-02'),
('Roberto Silva', '111.222.333-03'),
('Clara Ferreira', '444.555.666-04'),
('Lucas Pereira', '777.888.999-05');

CREATE TABLE serviços (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
preço DECIMAL(10,2) NOT NULL
);

INSERT INTO servicos (nome, preco) 
VALUES 
('Consultoria', 150.00),
('Desenvolvimento Web', 2000.00),
('Manutenção de Sistemas', 500.00),
('Design Gráfico', 300.00),
('Treinamento', 600.00);

CREATE TABLE produtos (
id INTO AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
preço DECIMAL(10,2) NOT NULL,
);

INSERT INTO produtos (nome, preco) 
VALUES 
('Pacote de Consultoria Básica', 150.00),
('Kit de Desenvolvimento Web', 2000.00),
('Serviço de Manutenção Premium', 500.00),
('Pacote de Design Gráfico', 300.00),
('Curso de Treinamento Online', 600.00);

CREATE TABLE vendas_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

INSERT INTO vendas_produtos (data_venda, id_cliente, id_produto) 
VALUES 
('2024-10-01', 1, 2),  -- Cliente 1 comprou Produto 2
('2024-10-02', 3, 1),  -- Cliente 3 comprou Produto 1
('2024-10-03', 2, 4),  -- Cliente 2 comprou Produto 4
('2024-10-04', 5, 3),  -- Cliente 5 comprou Produto 3
('2024-10-05', 4, 5);  -- Cliente 4 comprou Produto 5

CREATE TABLE vendas_servicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_servico INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_servico) REFERENCES servicos(id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);

INSERT INTO vendas_servicos (data, id_cliente, id_servico, id_funcionario) 
VALUES 
('2024-10-01', 1, 2, 1),  -- Cliente 1 contratou Serviço 2, atendido pelo Funcionário 1
('2024-10-02', 2, 1, 3),  -- Cliente 2 contratou Serviço 1, atendido pelo Funcionário 3
('2024-10-03', 3, 4, 2),  -- Cliente 3 contratou Serviço 4, atendido pelo Funcionário 2
('2024-10-04', 4, 3, 4),  -- Cliente 4 contratou Serviço 3, atendido pelo Funcionário 4
('2024-10-05', 5, 5, 1);  -- Cliente 5 contratou Serviço 5, atendido pelo Funcionário 1
