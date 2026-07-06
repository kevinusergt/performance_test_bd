USE bd_kevin_villalobos_cumbia;

INSERT INTO riwi_clients (client_name) VALUES ('Globant Tech SAS');

INSERT INTO riwi_work_orders (work_order_code, client_id, branch_id, city_id, technician_id, equipment_id, service_type_id, service_date, hours_worked, cost) 
VALUES ('WO1021', LAST_INSERT_ID(), 1, 3, 1, 1, 1, CURDATE(), 4, 240.00);


 
UPDATE riwi_technicians 
SET technician_name = 'Juan Carlos Perez Q.' 
WHERE id = 1;


INSERT INTO riwi_equipment (equipment_name, category_id) VALUES ('Asus ZenBook Pro', 1);


DELETE FROM riwi_equipment 
WHERE equipment_name = 'Asus ZenBook Pro' 
AND id NOT IN (SELECT DISTINCT id FROM riwi_work_orders);
