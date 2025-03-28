INSERT INTO Пользователи (имя, email, пароль) VALUES
                                          ('Прохоренко Константин', 'Kensant@mail.ru', '123'),
                                          ('Данил Механошин', 'Trash@mail.ru', '321');

INSERT INTO Проекты (название, site_title, описание, пользователь_id) VALUES
                                                              ('Входящие', 'Inbox', 'Описание', 1),
                                                              ('Учеба', 'Studies', 'Описание', 2),
                                                              ('Работа', 'Job', 'Описание', 1),
                                                              ('Домашние дела', 'Household chores', 'Описание', 1),
                                                              ('Авто', 'Auto', 'Описание', 1);

INSERT INTO Задачи (тема, дата_выполнения, статус, пользователь_id, проект_id) VALUES
                                                                                   ('Собеседование в IT компании', '2025-07-28', 'не выполнена', 2, 1),
                                                                                   ('Выполнить тестовое задание', '2025-05-07', 'не выполнена', 1, 1),
                                                                                   ('Сделать задание первого раздела', '2025-12-21', 'выполнена', 1, 2),
                                                                                   ('Встреча с другом', '2025-12-20', 'не выполнена', 1, 3),
                                                                                   ('Купить корм для кота', NULL, 'не выполнена', 1, 4),
                                                                                   ('Заказать пиццу', NULL, 'не выполнена', 2, 4);