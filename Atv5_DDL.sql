DROP SCHEMA IF EXISTS atv5 ;
CREATE SCHEMA IF NOT EXISTS atv5;
USE atv5;

DROP TABLE IF EXISTS Agencia ;


CREATE TABLE IF NOT EXISTS Agencia 
(
	Codigo INT NOT NULL AUTO_INCREMENT,
	Nome VARCHAR(45) NULL,
	Logradouro VARCHAR(45) NULL,
	Numero VARCHAR(45) NUll,
	Bairro VARCHAR(45) NULL,
	Uf VARCHAR(2) NULL,
	Cep VARCHAR(15) NULL,
    PRIMARY KEY (Codigo)
);

DROP TABLE IF EXISTS ContaCorrente ;

CREATE TABLE IF NOT EXISTS ContaCorrente 
(
	Numero INT NOT NULL AUTO_INCREMENT,
	Agencia_Codigo INT NOT NULL,
	Digito INT,
	Saldo DECIMAL(10,2),
    PRIMARY KEY(Numero)
);

ALTER TABLE ContaCorrente 
	ADD CONSTRAINT fk_ContaCorrente_Agencia1
    FOREIGN KEY (Agencia_Codigo)
    REFERENCES Agencia(Codigo);

DROP TABLE IF EXISTS TelefonesAgencia;

CREATE TABLE IF NOT EXISTS TelefonesAgencia 
(
  Telefone VARCHAR(45) NOT NULL,
  Agencia_Codigo INT NOT NULL,
  PRIMARY KEY (Telefone, Agencia_Codigo)
);
  
ALTER TABLE TelefonesAgencia
	ADD CONSTRAINT fk_TelefonesAgencia_Agencia
    FOREIGN KEY (Agencia_Codigo)
    REFERENCES Agencia (Codigo);
 
DROP TABLE IF EXISTS Correntista ;

CREATE TABLE IF NOT EXISTS Correntista 
(
  CPF VARCHAR(11) NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Logradouro VARCHAR(45) NULL,
  Numero VARCHAR(45) NULL,
  Bairro VARCHAR(45) NULL,
  UF VARCHAR(2) NULL,
  CEP VARCHAR(45) NULL,
  DataNascimento DATE NULL,
  RendaMensal DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (CPF)
);
  
DROP TABLE IF EXISTS TelefoneCorrentista;

CREATE TABLE IF NOT EXISTS TelefoneCorrentista
(
	Telefone VARCHAR(45) NOT NULL,
    Correntista_Cpf VARCHAR(11) NOT NULL,
    PRIMARY KEY (Telefone, Correntista_Cpf)
);

ALTER TABLE TelefoneCorrentista
    ADD CONSTRAINT fk_TelefoneCorrentista_Correntista1
    FOREIGN KEY (Correntista_CPF)
    REFERENCES Correntista (CPF);
 
 DROP TABLE IF EXISTS ContaCorrente_has_Correntista ;

CREATE TABLE IF NOT EXISTS ContaCorrente_has_Correntista 
(
  ContaCorrente_Numero INT NOT NULL,
  Correntista_CPF VARCHAR(11) NOT NULL,
  PRIMARY KEY (ContaCorrente_Numero, Correntista_CPF)
);

ALTER TABLE ContaCorrente_has_Correntista
    ADD CONSTRAINT fk_ContaCorrente_has_Correntista_ContaCorrente1
    FOREIGN KEY (ContaCorrente_Numero)
    REFERENCES ContaCorrente (Numero),
    ADD CONSTRAINT fk_ContaCorrente_has_Correntista_Correntista1
    FOREIGN KEY (Correntista_CPF)
    REFERENCES Correntista (CPF);
    
DROP TABLE IF EXISTS Dependente ;

CREATE TABLE IF NOT EXISTS Dependente 
(
  IDDependente INT NOT NULL AUTO_INCREMENT,
  Correntista_CPF VARCHAR(11) NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  DataNascimento DATETIME NULL,
  PRIMARY KEY (IDDependente)
);
  
Alter Table Dependente
    ADD CONSTRAINT fk_Dependente_Correntista1
    FOREIGN KEY (Correntista_CPF)
    REFERENCES Correntista (CPF);
    
    


 

