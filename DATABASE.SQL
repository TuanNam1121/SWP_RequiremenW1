CREATE DATABASE SWP_Requirement_W1;
USE SWP_Requirement_W1;

-- Role
CREATE TABLE roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL UNIQUE
);

-- Permission
CREATE TABLE permissions (
    permission_id INT AUTO_INCREMENT PRIMARY KEY,
    permission_name VARCHAR(100) NOT NULL UNIQUE
);

-- User
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,

    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,

    role_id INT NOT NULL,

    phone VARCHAR(15) UNIQUE,
    email VARCHAR(255) UNIQUE,

    gender ENUM('Male', 'Female', 'Other'),

    full_name VARCHAR(255),

    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_user_role
        FOREIGN KEY (role_id)
        REFERENCES roles(role_id)
);

-- Request
CREATE TABLE requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,

    status VARCHAR(50) NOT NULL,
    message TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP NULL,

    CONSTRAINT fk_request_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);

-- Role Permission
CREATE TABLE role_permissions (
    role_id INT NOT NULL,
    permission_id INT NOT NULL,

    PRIMARY KEY (role_id, permission_id),

    CONSTRAINT fk_rolepermission_role
        FOREIGN KEY (role_id)
        REFERENCES roles(role_id),


    CONSTRAINT fk_rolepermission_permission
        FOREIGN KEY (permission_id)
        REFERENCES permissions(permission_id)

);


-- =========================================
-- SAMPLE DATA
-- =========================================

INSERT INTO roles(role_name)
VALUES
('ADMIN'), -- 1
('STAFF'); -- 2

INSERT INTO permissions(permission_name)
VALUES
('CHANGE_PASSWORD'),  -- 1
('CREATE_USER'),      -- 2
('UPDATE_USER_INFORMATION'),   -- 3
('DELETE_USER'),   -- 4
('ACTIVE_USER'), -- 5
('DEACTIVE_USER'), -- 6
('UPDATE_ROLE_INFORMATION'), -- 7
('ACTIVE_ROLE'), -- 8
('DEACTIVE_ROLE'), -- 9
('EDIT_ROLE_PERMISSION'); -- 10

INSERT INTO role_permissions(role_id, permission_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 3);

INSERT INTO users (
    username,
    password_hash,
    role_id,
    phone,
    email,
    gender,
    full_name
)
VALUES (
    'admin',
    'hashed_password',
    1,
    '0123456789',
    'admin@gmail.com',
    'Male',
    'System Admin'
),
(
    'staff1',
    'hashed_password',
    2,
    '0987654321',
    'staff1@gmail.com',
    'Female',
    'Tran Thi B'
),
(
    'staff2',
    'hashed_password',
    2,
    '0911222333',
    'staff2@gmail.com',
    'Male',
    'Le Van C'
);