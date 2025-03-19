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
                         дата_начала DATE,
                         дата_окончания DATE,
                         статус ENUM('планируется', 'в процессе', 'завершен'),
                         пользователь_id INT,
                         FOREIGN KEY (пользователь_id) REFERENCES Пользователи(id)
);

CREATE TABLE Задачи (
                        id INT PRIMARY KEY AUTO_INCREMENT,
                        тема VARCHAR(255) NOT NULL,
                        статус ENUM('новая', 'в работе', 'завершена'),
                        приоритет ENUM('низкий', 'средний', 'высокий'),
                        дата_выполнения DATE,
                        проект_id INT,
                        FOREIGN KEY (проект_id) REFERENCES Проекты(id)
);