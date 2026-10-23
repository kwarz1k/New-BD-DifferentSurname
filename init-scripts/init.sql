-- Таблица 1: Основные данные пользователей (оставляем без изменений)
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    mobile_phone VARCHAR(50) NOT NULL,
    home_phone VARCHAR(50),
    birth_date DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    email VARCHAR(150) NOT NULL
);

-- Таблица 2: Паспортные данные (теперь поля могут быть NULL)
CREATE TABLE IF NOT EXISTS passports (
    user_id INT PRIMARY KEY,
    passport_series_number VARCHAR(20), -- Убрано NOT NULL
    last_name VARCHAR(100),            -- Убрано NOT NULL
    first_name VARCHAR(100),           -- Убрано NOT NULL
    middle_name VARCHAR(100),
    birth_date DATE,                   -- Убрано NOT NULL
    issue_date DATE,                   -- Убрано NOT NULL
    department_code VARCHAR(10),       -- Убрано NOT NULL
    issued_by TEXT,                    -- Убрано NOT NULL
    birth_place TEXT,                  -- Убрано NOT NULL
    address TEXT,                      -- Убрано NOT NULL
    foreign_passport VARCHAR(50),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT unique_user_passport UNIQUE (user_id)
);
