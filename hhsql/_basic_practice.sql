-- ЗАДАНИЕ 1
DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    full_name VARCHAR(255),
    balance NUMERIC,
    debt NUMERIC,
    category VARCHAR(100),
    credit_score INT
);
-- ТЕСТОВЫЕ ДАННЫЕ:
INSERT INTO clients VALUES
(1, 'Иванов Иван Сергеевич', 45000, 18000, 'VIP', 740),
(2, 'Смирнова Мария Викторовна', 3000, 18000, 'Обычный', 520),
(3, 'Кузнецов Андрей Петрович', 25000, 8000, 'Премиум', 680),
(4, 'Новиков Сергей Иванович', 20000, 10000, 'Заблокирован', 300),
(5, 'Петрова Ольга Алексеевна', 4000, 20000, 'Обычный', 450),
(6, 'Федоров Николай Павлович', 48000, 15000, 'VIP', 710);

-- РЕШЕНИЕ:


---------------------------------------------------------------------

-- ЗАДАНИЕ 2
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    client_id INT,
    category VARCHAR(100),
    amount NUMERIC
);
-- ТЕСТОВЫЕ ДАННЫЕ:
INSERT INTO orders VALUES
(1, 101, NULL, 800),
(2, 102, NULL, 900),
(3, 201, 'Оптовый', 1500),
(4, 202, 'Оптовый', 1500),
(5, 301, 'Розничный', 1800),
(6, 302, 'Розничный', 1700.50);

-- РЕШЕНИЕ:

---------------------------------------------------------------------

-- ЗАДАНИЕ 3
DROP TABLE IF EXISTS animal_conditions;
CREATE TABLE animal_conditions (
    animal_id INT PRIMARY KEY,
    animal_name VARCHAR(100),
    species VARCHAR(100),
    age_years INT,
    diagnosis VARCHAR(255)
);
-- ТЕСТОВЫЕ ДАННЫЕ:
INSERT INTO animal_conditions VALUES
(1, 'Барсик', 'кот', 1, 'Нет проблем'),
(2, 'Пушок', 'собака', NULL, 'Аллергия'),
(3, 'Ричи', 'кот', 0, 'Нет проблем'),
(4, 'Лада', 'собака', 11, NULL),
(5, 'Буся', 'кошка', 7, 'Хронический дерматит'),
(6, 'Мурка', 'кот', 12, 'Нет проблем'),
(7, 'Адель', 'собака', 10, 'Нет проблем');
-- РЕШЕНИЕ:
/*Классификация животных по условиям содержания*/
SELECT
    animal_id,
    animal_name,
    species,
    age_years,
    diagnosis,
    CASE
        WHEN age_years < 1 OR diagnosis ILIKE '%хронич%' THEN 'Особый уход'
        WHEN age_years > 10 THEN 'Пожилое животное'
        WHEN age_years IS NULL OR diagnosis IS NULL THEN 'Недостаточно данных'
        ELSE 'Стандартный уход'
    END AS condition_status
FROM animal_conditions
ORDER BY animal_id;
