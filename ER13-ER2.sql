--DDL 
CREATE DATABASE RpgOnline
GO

USE RpgOnline
GO

CREATE TABLE Usuarios (
	Email varchar(50) PRIMARY KEY,
	Senha varchar(50) NOT NULL,
	Nome_Usuario varchar(50) NOT NULL
)
GO

CREATE TABLE Classes (
	Id_Classe INT PRIMARY KEY IDENTITY,
	Nome_Classe varchar(50) UNIQUE NOT NULL,
	Descricao varchar(255)
)
GO

CREATE TABLE Personagens(
	Id_Personagem INT PRIMARY KEY IDENTITY,
	Nome_Personagem VARCHAR(30) UNIQUE NOT NULL,
	Email VARCHAR(50) UNIQUE FOREIGN KEY REFERENCES Usuarios(Email),
	Id_Classe INT FOREIGN KEY REFERENCES Classes(Id_Classe)
)
GO

CREATE TABLE Habilidades (
	Id_Habilidade INT PRIMARY KEY IDENTITY,
	Nome_Habilidade VARCHAR(50) UNIQUE NOT NULL
)
GO

CREATE TABLE ClasseHabilidade (
	Id_Classe INT FOREIGN KEY REFERENCES Classes(Id_Classe),
	Id_Habilidade INT FOREIGN KEY REFERENCES Habilidades(Id_Habilidade)
)

--DML
INSERT INTO Usuarios VALUES ('milton@milton.com.br','1000ton','12345')
INSERT INTO Usuarios VALUES ('simon@123.com.br','Simon','12345')
INSERT INTO Usuarios VALUES ('mf@mf.com.br','Mfilho','12345')

INSERT INTO Classes VALUES ('Arqueiro','Arqueiro sorrateiro e furtivo se esconde nas sombras para não ser notado')
INSERT INTO Classes VALUES ('Gigante','O guerreiro mais forte dos reinos')
INSERT INTO Classes VALUES ('Mago','Seu poderes mágicos fazem a diferença no campo de batalha')

INSERT INTO Habilidades VALUES ('Arco Mágico') ,('Escudo de Aço'),('Feitiço de Ouro')

INSERT INTO Personagens (Nome_Personagem, Email, Id_Classe) VALUES ('1000tonAug','milton@milton.com.br',3)
INSERT INTO Personagens (Nome_Personagem, Email, Id_Classe) VALUES ('SimonSouza','simon@123.com.br',2)

INSERT INTO ClasseHabilidade (Id_Classe,Id_Habilidade) VALUES (1,1), (2,2), (3,3)


UPDATE Usuarios 
SET Nome_Usuario='1000tonSouza'
WHERE email= 'milton@milton.com.br'

UPDATE Habilidades
SET Nome_Habilidade = 'Arco Mágico Supremo'
WHERE Id_Habilidade = 1


--DQL
SELECT * FROM Personagens

SELECT Usuarios.Nome_Usuario, Personagens.Nome_Personagem, Classes.Nome_Classe FROM Usuarios 
INNER JOIN Personagens ON Usuarios.Email = Personagens.Email
INNER JOIN Classes ON Classes.Id_Classe = Personagens.Id_Classe
WHERE Usuarios.Nome_Usuario='1000tonSouza'

SELECT Usuarios.Nome_Usuario, Personagens.Nome_Personagem FROM Usuarios LEFT JOIN Personagens
ON Usuarios.Email = Personagens.Email


SELECT Usuarios.Nome_Usuario, Personagens.Nome_Personagem FROM Usuarios RIGHT JOIN Personagens
ON Usuarios.Email = Personagens.Email

SELECT Usuarios.Nome_Usuario, Personagens.Nome_Personagem FROM Usuarios FULL OUTER JOIN Personagens
ON Usuarios.Email = Personagens.Email

