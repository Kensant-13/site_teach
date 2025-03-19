CREATE TABLE Пользователи (
                              id INT PRIMARY KEY AUTO_INCREMENT,
                              имя VARCHAR(100) NOT NULL,
                              email VARCHAR(100) UNIQUE NOT NULL,
                              дата_регистрации DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Проекты (
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         название VARCHAR(255) NOT NULL,
                         описание TEXT,
                         пользователь_id INT,
                         FOREIGN KEY (пользователь_id) REFERENCES Пользователи(id)
);

CREATE TABLE Задачи (
                        id INT PRIMARY KEY AUTO_INCREMENT,
                        тема VARCHAR(255) NOT NULL,
                        дата_выполнения DATE,
                        пользователь_id INT,
                        FOREIGN KEY (пользователь_id) REFERENCES Пользователи(id),
                        проект_id INT,
                        FOREIGN KEY (проект_id) REFERENCES Проекты(id)
);