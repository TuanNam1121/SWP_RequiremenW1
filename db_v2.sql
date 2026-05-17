
CREATE DATABASE Requirement_W1_V2;
USE Requirement_W1_V2;

-- TABLE: permission
CREATE TABLE permission (
    permissionid INT AUTO_INCREMENT PRIMARY KEY,
    permissionname VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- TABLE: role
CREATE TABLE role (
    roleid INT AUTO_INCREMENT PRIMARY KEY,
    rolename VARCHAR(100) NOT NULL UNIQUE,
    isActive BIT(1) NOT NULL DEFAULT b'1'
);

-- TABLE: role_permissions
CREATE TABLE role_permissions (
    roleid INT NOT NULL,
    permissionid INT NOT NULL,

    PRIMARY KEY (roleid, permissionid),

    CONSTRAINT FK_role_permissions_role
        FOREIGN KEY (roleid)
        REFERENCES role(roleid)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT FK_role_permissions_permission
        FOREIGN KEY (permissionid)
        REFERENCES permission(permissionid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- TABLE: user
CREATE TABLE user (
    userid INT AUTO_INCREMENT PRIMARY KEY,

    roleid INT NOT NULL,

    username VARCHAR(100) NOT NULL UNIQUE,
    passwordhash VARCHAR(255) NOT NULL,

    phone VARCHAR(20),
    email VARCHAR(150) UNIQUE,

    gender ENUM('MALE', 'FEMALE', 'OTHER'),

    fullname VARCHAR(150),

    isActive BIT(1) NOT NULL DEFAULT b'1',

    CONSTRAINT FK_user_role
        FOREIGN KEY (roleid)
        REFERENCES role(roleid)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- TABLE: request
CREATE TABLE request (
    requestid INT AUTO_INCREMENT PRIMARY KEY,

    userid INT NOT NULL,

    message TEXT,

    status ENUM('NEW', 'COMPLETED')
        NOT NULL DEFAULT 'NEW',

    createdat DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    completedat DATETIME NULL,

    CONSTRAINT FK_request_user
        FOREIGN KEY (userid)
        REFERENCES user(userid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- DUMP DATA: permission
INSERT INTO permission(permissionname, description)
VALUES
('VIEW_USER', 'Can view user information'),
('CREATE_USER', 'Can create new users'),
('UPDATE_USER', 'Can update user information'),
('DELETE_USER', 'Can delete users'),
('VIEW_REQUEST', 'Can view requests'),
('HANDLE_REQUEST', 'Can complete requests');

-- DUMP DATA: role
INSERT INTO role(rolename, isActive)
VALUES
('ADMIN', b'1'),
('MANAGER', b'1'),
('STAFF', b'1'),
('PICKER', b'1');

-- =============================================
-- DUMP DATA: role_permissions
-- =============================================

-- ADMIN
INSERT INTO role_permissions(roleid, permissionid)
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6);

-- MANAGER
INSERT INTO role_permissions(roleid, permissionid)
VALUES
(2,1),
(2,3),
(2,5),
(2,6);

-- STAFF
INSERT INTO role_permissions(roleid, permissionid)
VALUES
(3,1),
(3,5);

-- PICKER
INSERT INTO role_permissions(roleid, permissionid)
VALUES
(4,5);

-- =============================================
-- DUMP DATA: user
-- =============================================
INSERT INTO user
(roleid, username, passwordhash, phone, email, gender, fullname, isActive)
VALUES
(
    1,
    'admin',
    'admin123hash',
    '0900000001',
    'admin@gmail.com',
    'MALE',
    'System Administrator',
    b'1'
),
(
    2,
    'manager01',
    'manager123hash',
    '0900000002',
    'manager@gmail.com',
    'FEMALE',
    'Nguyen Thi Manager',
    b'1'
),
(
    3,
    'staff01',
    'staff123hash',
    '0900000003',
    'staff@gmail.com',
    'MALE',
    'Tran Van Staff',
    b'1'
),
(
    4,
    'customer01',
    'customer123hash',
    '0900000004',
    'customer@gmail.com',
    'OTHER',
    'Le Customer',
    b'1'
);

-- =============================================
-- DUMP DATA: request
-- =============================================
INSERT INTO request
(userid, message, status, createdat, completedat)
VALUES
(
    4,
    'Request password resetNeed support for account access',
    'NEW',
    NOW(),
    NULL
),
(
    4,
    'Need support for account access',
    'COMPLETED',
    DATE_SUB(NOW(), INTERVAL 2 DAY),
    NOW()
);

-- =============================================
-- TEST FORGET PASSWORD
-- =============================================

INSERT INTO user
(roleid, username, passwordhash, phone, email, gender, fullname, isActive)
VALUES
(
    2,
    'ducanh',
    'hashpass',
    '0364355772',
    'ducanh06tb@gmail.com',
    'MALE',
    'Nguyen Duc Anh',
    b'1'
);

-- =============================================
-- TEST
-- =============================================
SELECT * FROM permission;
SELECT * FROM role;
SELECT * FROM role_permissions;
SELECT * FROM user;
SELECT * FROM request;
