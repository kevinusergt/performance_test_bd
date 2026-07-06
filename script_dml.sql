USE bd_tu_nombre_tu_apellido_tu_clan;

INSERT INTO riwi_clients (client_name) VALUES ('Globant Tech SAS');

INSERT INTO riwi_work_orders (work_order_code, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours_worked, cost) 
VALUES ('WO1021', LAST_INSERT_ID(), 1, 1, 1, 1, CURDATE(), 4, 240.00);


 
UPDATE riwi_technicians 
SET riwi_technician_name = 'Juan Carlos Perez Q.' 
WHERE riwi_technician_id = 1;


INSERT INTO riwi_equipment (equipment_name, category_id) VALUES ('Asus ZenBook Pro', 1);


DELETE FROM riwi_equipment 
WHERE equipment_name = 'Asus ZenBook Pro' 
AND equipment_id NOT IN (SELECT DISTINCT equipment_id FROM riwi_work_orders);
