CREATE DATABASE IF NOT EXISTS bd_kevin_villalobos_cumbia;
USE bd_kevin_villalobos_cumbia;


CREATE TABLE riwi_clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE riwi_cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE riwi_branches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL
);

CREATE TABLE riwi_technicians (
    id INT AUTO_INCREMENT PRIMARY KEY,
    technician_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE riwi_service_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_type_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE riwi_equipment_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE riwi_equipment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES riwi_equipment_categories(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE riwi_work_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    work_order_code VARCHAR(20) NOT NULL UNIQUE,
    client_id INT NOT NULL,
    branch_id INT NOT NULL,
    city_id INT NOT NULL,
    technician_id INT NOT NULL,
    equipment_id INT NOT NULL,
    service_type_id INT NOT NULL,
    service_date DATE NOT NULL,
    hours_worked INT NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES riwi_clients(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
    FOREIGN KEY (branch_id) REFERENCES riwi_branches(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
    FOREIGN KEY (city_id) REFERENCES riwi_cities(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
    FOREIGN KEY (technician_id) REFERENCES riwi_technicians(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
    FOREIGN KEY (equipment_id) REFERENCES riwi_equipment(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
    FOREIGN KEY (service_type_id) REFERENCES riwi_service_types(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);