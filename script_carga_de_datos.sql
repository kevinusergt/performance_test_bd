
USE bd_kevin_villalobos_cumbia;

INSERT INTO riwi_cities (city_name) VALUES 
('Bogotá'), 
('Medellín'), 
('Cali'), 
('Barranquilla'), 
('Cartagena'), 
('Pereira'), 
('Bucaramanga'), 
('Cúcuta'), 
('Manizales'), 
('Santa Marta');

INSERT INTO riwi_equipment_categories (category_name) VALUES 
('Laptop'), 
('Desktop'), 
('Networking'), 
('Printer');

INSERT INTO riwi_clients (client_name) VALUES 
('Acme Ltd'), 
('Innova SAS'), 
('NovaTech'), 
('BioHealth'), 
('SoftCorp'), 
('Vision SA'), 
('RetailOne'), 
('EduCenter'), 
('HealthPlus'), 
('MegaFoods');

INSERT INTO riwi_technicians (technician_name) VALUES 
('Juan Perez'), 
('Maria Gomez'), 
('Carlos Ruiz'), 
('Laura Diaz'), 
('Andres Mora');

INSERT INTO riwi_service_types (service_type_name) VALUES 
('Preventive'),
('Corrective'),
('Installation');


INSERT INTO riwi_branches (branch_name) VALUES 
('North Office'), 
('HQ'), 
('West Branch'), 
('Main Office'), 
('Coastal'), 
('Coffee Branch'), 
('East Office'), 
('NorthEast Branch'), 
('Central Office'), 
('Caribbean');

INSERT INTO riwi_equipment (equipment_name, category_id) VALUES 
('Dell Latitude 5420', 1), 
('HP ProDesk', 2), 
('Cisco Switch 2960', 3), 
('Canon Printer Pixma', 4), 
('Lenovo ThinkPad', 1);


INSERT INTO riwi_work_orders (work_order_code, client_id, branch_id, city_id, technician_id, equipment_id, service_type_id, service_date, hours_worked, cost) VALUES 
('WO1001', 1, 1, 1, 1, 1, 1, '2026-05-01', 2, 120.00),
('WO1002', 1, 1, 1, 1, 1, 1, '2026-05-02', 3, 180.00),
('WO1003', 2, 2, 2, 2, 2, 2, '2026-05-03', 4, 250.00),
('WO1004', 2, 2, 2, 2, 2, 2, '2026-05-04', 2, 150.00),
('WO1005', 3, 3, 3, 3, 3, 3, '2026-05-05', 5, 500.00),
('WO1006', 3, 3, 3, 3, 3, 3, '2026-05-06', 4, 450.00),
('WO1007', 4, 4, 4, 4, 4, 2, '2026-05-07', 2, 130.00),
('WO1008', 4, 4, 4, 4, 4, 2, '2026-05-08', 3, 200.00),
('WO1009', 5, 5, 5, 5, 5, 1, '2026-05-09', 2, 140.00),
('WO1010', 5, 5, 5, 5, 5, 1, '2026-05-10', 3, 190.00),
('WO1011', 6, 6, 6, 1, 2, 3, '2026-05-11', 6, 550.00),
('WO1012', 6, 6, 6, 1, 2, 3, '2026-05-12', 5, 520.00),
('WO1013', 7, 7, 7, 2, 1, 2, '2026-05-13', 2, 160.00),
('WO1014', 7, 7, 7, 2, 1, 2, '2026-05-14', 3, 210.00),
('WO1015', 8, 8, 8, 3, 3, 1, '2026-05-15', 2, 125.00),
('WO1016', 8, 8, 8, 3, 3, 1, '2026-05-16', 2, 135.00),
('WO1017', 9, 9, 9, 4, 4, 3, '2026-05-17', 4, 400.00),
('WO1018', 9, 9, 9, 4, 4, 3, '2026-05-18', 5, 430.00),
('WO1019', 10, 10, 10, 5, 5, 2, '2026-05-19', 3, 220.00),
('WO1020', 10, 10, 10, 5, 5, 2, '2026-05-20', 4, 260.00);




