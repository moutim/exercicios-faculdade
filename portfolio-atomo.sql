CREATE TABLE Curso (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    coordenador VARCHAR(100)
);

CREATE TABLE Materia (
    materia_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)
);

CREATE TABLE Professor (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE,
    especialidade VARCHAR(100)
);

CREATE TABLE Aluno (
    aluno_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE,
    cpf VARCHAR(11) UNIQUE,
    data_nascimento DATE,
    endereco VARCHAR(150),
    contato VARCHAR(20),
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)
);

CREATE TABLE Turma (
    turma_id INT PRIMARY KEY AUTO_INCREMENT,
    curso_id INT,
    professor_id INT,
    materia_id INT,
    ano YEAR,
    semestre INT,
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id),
    FOREIGN KEY (professor_id) REFERENCES Professor(professor_id),
    FOREIGN KEY (materia_id) REFERENCES Materia(materia_id)
);

CREATE TABLE Nota (
    nota_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    turma_id INT,
    nota DECIMAL(5, 2),
    FOREIGN KEY (aluno_id) REFERENCES Aluno(aluno_id),
    FOREIGN KEY (turma_id) REFERENCES Turma(turma_id)
);
