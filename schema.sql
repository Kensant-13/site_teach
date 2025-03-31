CREATE DATABASE site_teach;
USE site_teach;

CREATE TABLE Users (
                              id INT PRIMARY KEY AUTO_INCREMENT,
                              имя VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
                              email VARCHAR(100) UNIQUE NOT NULL,
                              пароль VARCHAR(60) NOT NULL,
                              дата_регистрации DATETIME DEFAULT CURRENT_TIMESTAMP
) COLLATE='utf8_general_ci';
CREATE TABLE Projects (
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         название VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
                         site_title VARCHAR(255) NOT NULL,
                         описание TEXT COLLATE 'utf8_general_ci',
                         пользователь_id INT,
                         FOREIGN KEY (пользователь_id) REFERENCES Пользователи(id)
) COLLATE='utf8_general_ci';

CREATE TABLE Tasks (
                        id INT PRIMARY KEY AUTO_INCREMENT,
                        название VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
                        дата_выполнения DATE DEFAULT NULL,
                        статус ENUM('выполнена', 'не выполнена') DEFAULT 'не выполнена' COLLATE 'utf8_general_ci',
                        пользователь_id INT,
                        FOREIGN KEY (пользователь_id) REFERENCES Пользователи(id),
                        проект_id INT,
                        FOREIGN KEY (проект_id) REFERENCES Проекты(id)
) COLLATE='utf8_general_ci';