CREATE TABLE Escola 
( 
 cnpj INT PRIMARY KEY AUTO_INCREMENT,  
 nome_escola VARCHAR(20),  
 cpf_professor INT,  
 id_escola_endereco INT,  
 id_escola_telefone INT,  
 id_matricula INT
); 

CREATE TABLE Turma 
( 
 id_turma INT PRIMARY KEY AUTO_INCREMENT,  
 turno VARCHAR(7) NOT NULL,  
 sala INT NOT NULL,  
 quantid_alunos INT NOT NULL,  
 ano_letivo INT NOT NULL,  
 cnpj INT,  
 id_matricula INT,  
 id_fluencia INT,  
 CHECK (turno LIKE 'M%' AND 'T%' AND 'N%')
); 

CREATE TABLE Aluno 
( 
 id_matricula INT PRIMARY KEY AUTO_INCREMENT,  
 nome_aluno VARCHAR(30),  
 sobrenome_aluno VARCHAR(30),  
 id_turma INT,  
 id_endereco_aluno INT,  
 cnpj INT  
); 

CREATE TABLE Professor 
( 
 cpf_professor INT PRIMARY KEY,
 nome_professor VARCHAR(30) NOT NULL,  
 id_fluencia INT,  
 id_cnpj INT,  
 id_professor_telefone INT  
); 

CREATE TABLE Avaliacao_Fluencia 
( 
 id_fluencia INT PRIMARY KEY AUTO_INCREMENT,  
 id_turma INT,  
 cpf_professor INT,  
 id_audio INT,  
 id_data_aval INT,  
 id_nota INT  
); 

CREATE TABLE data_avaliacao 
( 
 data_aval DATE NOT NULL,  
 id_fluencia INT,  
 id_data_aval INT PRIMARY KEY AUTO_INCREMENT  
); 

CREATE TABLE notas_testes 
( 
 nota_teste FLOAT NOT NULL,  
 id_fluencia INT,  
 id_nota INT PRIMARY KEY AUTO_INCREMENT  
); 

CREATE TABLE arquivo_audio 
( 
 id_audio INT PRIMARY KEY AUTO_INCREMENT,
 nome_audio VARCHAR(30) NOT NULL,  
 id_fluencia INT
); 

CREATE TABLE escola_telefone 
( 
 id_escola_telefone INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 numero_1 INT NOT NULL,  
 numero_2 INT,
 cnpj INT    
); 

CREATE TABLE endereco_aluno 
( 
 id_endereco_aluno INT PRIMARY KEY AUTO_INCREMENT,
 rua_aluno VARCHAR(25) NOT NULL,  
 num_casa_aluno INT NOT NULL,  
 complemento_aluno VARCHAR(15),  
 bairro VARCHAR(20) NOT NULL,  
 id_matricula INT  
); 

CREATE TABLE professor_telefone 
( 
 id_professor_telefone INT PRIMARY KEY,  
 numero_1 INT NOT NULL,  
 numero_2 INT
); 

CREATE TABLE escola_endereco 
( 
 id_escola_endereco INT PRIMARY KEY AUTO_INCREMENT,  
 rua_escola VARCHAR(25) NOT NULL,  
 num_escola_endereco INT NOT NULL,  
 complemento_escola VARCHAR(15),  
 bairro VARCHAR(15),  
 cnpj INT
); 

ALTER TABLE professor 
CHANGE id_cnpj cnpj INT;
ALTER TABLE Escola ADD FOREIGN KEY(cpf_professor) REFERENCES Professor (cpf_professor);
ALTER TABLE Escola ADD FOREIGN KEY(id_escola_endereco) REFERENCES escola_endereco (id_escola_endereco);
ALTER TABLE Escola ADD FOREIGN KEY(id_escola_telefone) REFERENCES escola_telefone (id_escola_telefone);
ALTER TABLE Turma ADD FOREIGN KEY(cnpj) REFERENCES Escola (cnpj);
ALTER TABLE Turma ADD FOREIGN KEY(id_matricula) REFERENCES Aluno (id_matricula);
ALTER TABLE Turma ADD FOREIGN KEY(id_fluencia) REFERENCES Avaliacao_Fluencia (id_fluencia);
ALTER TABLE Aluno ADD FOREIGN KEY(id_turma) REFERENCES Turma (id_turma);
ALTER TABLE Aluno ADD FOREIGN KEY(id_endereco_aluno) REFERENCES endereco_aluno (id_endereco_aluno);
ALTER TABLE Aluno ADD FOREIGN KEY(cnpj) REFERENCES Escola (cnpj);
ALTER TABLE Professor ADD FOREIGN KEY(id_fluencia) REFERENCES Avaliacao_Fluencia (id_fluencia);
ALTER TABLE Professor ADD FOREIGN KEY(cnpj) REFERENCES Escola (cnpj);
ALTER TABLE Professor ADD FOREIGN KEY(id_professor_telefone) REFERENCES professor_telefone (id_professor_telefone);
ALTER TABLE Avaliacao_Fluencia ADD FOREIGN KEY(id_turma) REFERENCES Turma (id_turma);
ALTER TABLE Avaliacao_Fluencia ADD FOREIGN KEY(cpf_professor) REFERENCES Professor (cpf_professor);
ALTER TABLE Avaliacao_Fluencia ADD FOREIGN KEY(id_audio) REFERENCES arquivo_audio (id_audio);
ALTER TABLE Avaliacao_Fluencia ADD FOREIGN KEY(id_data_aval) REFERENCES data_avaliacao (id_data_aval);
ALTER TABLE Avaliacao_Fluencia ADD FOREIGN KEY(id_nota) REFERENCES notas_testes (id_nota);
ALTER TABLE data_avaliacao ADD FOREIGN KEY(id_fluencia) REFERENCES Avaliacao_Fluencia (id_fluencia);
ALTER TABLE notas_testes ADD FOREIGN KEY(id_fluencia) REFERENCES Avaliacao_Fluencia (id_fluencia);
ALTER TABLE arquivo_audio ADD FOREIGN KEY(id_fluencia) REFERENCES Avaliacao_Fluencia (id_fluencia);
ALTER TABLE escola_telefone ADD FOREIGN KEY(cnpj) REFERENCES Escola (cnpj);
ALTER TABLE endereco_aluno ADD FOREIGN KEY(id_matricula) REFERENCES Aluno (id_matricula);
ALTER TABLE escola_endereco ADD FOREIGN KEY(cnpj) REFERENCES Escola (cnpj);

#acrescentar id_matricula à escola
ALTER TABLE Escola ADD id_matricula INT;
ALTER TABLE Escola ADD FOREIGN KEY(id_matricula) REFERENCES Aluno (id_matricula);

#acrescentar id_turma à escola
ALTER TABLE Escola ADD id_turma INT;
ALTER TABLE Escola ADD FOREIGN KEY(id_turma) REFERENCES Turma (id_turma);

#acrescentar id_matricula à turma
ALTER TABLE Turma ADD id_matricula INT;
ALTER TABLE Turma ADD FOREIGN KEY(id_matricula) REFERENCES Aluno (id_matricula);

#acrescentar id_fluencia à turma
ALTER TABLE Turma ADD id_fluencia INT;
ALTER TABLE Turma ADD FOREIGN KEY(id_fluencia) REFERENCES avaliacao_fluencia (id_fluencia);