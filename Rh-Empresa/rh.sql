DROP SCHEMA IF EXISTS rh_empresa ;
CREATE SCHEMA IF NOT EXISTS rh_empresa;
USE rh_empresa;

DROP TABLE IF EXISTS Funcionario;

CREATE TABLE IF NOT EXISTS Funcionario
(
    Matricula INT(10) NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(25) NULL,
    Logradouro VARCHAR(25) NULL,
    Numero INT(4) NULL,
    TelefoneFixo VARCHAR(10) NULL,
    TelefoneCelular VARCHAR(10) NULL,
    Salario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Matricula)
);

DROP TABLE IF EXISTS Departamento;

CREATE TABLE IF NOT EXISTS Departamento
(
    Codigo INT(2) NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(10) NULL,
    Ramal VARCHAR(4) NULL,
    PRIMARY KEY (Codigo)
);

DROP TABLE IF EXISTS Departamento_has_Funcionario;

CREATE TABLE IF NOT EXISTS Departamento_has_Funcionario
(
	Matricula_Func INT(10) NOT NULL,
    Codigo_Dep INT(2) NOT NULL,
    Data_Lotacao DATE NULL,
    PRIMARY KEY (Matricula_Func, Codigo_Dep)
);

ALTER TABLE Departamento_has_Funcionario
    ADD CONSTRAINT fk_Departamento_has_Funcionario_Matricula_Func1
    FOREIGN KEY (Matricula_Func)
    REFERENCES Funcionario (Matricula),
    ADD CONSTRAINT fk_Departamento_has_Funcionario_Codigo1
    FOREIGN KEY (Codigo_Dep)
    REFERENCES Departamento (Codigo);

DROP TABLE IF EXISTS Projeto;

CREATE TABLE IF NOT EXISTS Projeto
(
    Codigo INT(3) NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(30) NULL,
    Data_Inicio DATE NULL,
    Data_Termino DATE NULL,
    PRIMARY KEY (Codigo)
);

DROP TABLE IF EXISTS Projeto_Funcionario;

CREATE TABLE IF NOT EXISTS Projeto_Funcionario
(
    Matricula_Func INT(10) NOT NULL,
    Codigo_Proj INT(3) NOT NULL,
    PRIMARY KEY (Matricula_Func, Codigo_Proj)
);

ALTER TABLE Projeto_Funcionario
    ADD CONSTRAINT fk_Projeto_Funcionario_Matricula_Func1
    FOREIGN KEY (Matricula_Func)
    REFERENCES Funcionario (Matricula),
    ADD CONSTRAINT fk_Projeto_Funcionario_Codigo_Proj1
    FOREIGN KEY (Codigo_Proj)
    REFERENCES Projeto (Codigo);



