USE bd_kevin_villalobos_cumbia;

-- La cantidad de órdenes atendidas por técnico

SELECT t.technician_name AS Technician, COUNT(wo.id) AS TotalOrders
FROM riwi_technicians t
LEFT JOIN riwi_work_orders wo ON t.id = wo.technician_id
GROUP BY t.id, t.technician_name
ORDER BY TotalOrders DESC;





-- El historial de servicios realizados por ciudad (Conexión a través de la sede)

SELECT c.city_name AS City, COUNT(wo.id) AS TotalServices
FROM riwi_cities c
INNER JOIN riwi_work_orders wo ON c.id = wo.city_id
GROUP BY c.id, c.city_name
ORDER BY TotalServices DESC;





-- Total de servicios realizados por tipo de servicio

SELECT st.service_type_name AS ServiceType, COUNT(wo.id) AS TotalRequested
FROM riwi_service_types st
LEFT JOIN riwi_work_orders wo ON st.id = wo.service_type_id
GROUP BY st.id, st.service_type_name
ORDER BY TotalRequested DESC;





-- Equipos con mayor cantidad de mantenimientos

SELECT e.equipment_name AS Equipment, COUNT(wo.id) AS TotalMaintenances
FROM riwi_equipment e
INNER JOIN riwi_work_orders wo ON e.id = wo.equipment_id
GROUP BY e.id, e.equipment_name
ORDER BY TotalMaintenances DESC;





-- Clientes con mayor número de órdenes de servicio

SELECT c.client_name AS Client, COUNT(wo.id) AS TotalOrdersPlaced
FROM riwi_clients c
INNER JOIN riwi_work_orders wo ON c.id = wo.client_id
GROUP BY c.id, c.client_name
ORDER BY TotalOrdersPlaced DESC;





-- Cantidad de órdenes gestionadas por sede

SELECT b.branch_name AS Branch, COUNT(wo.id) AS OperationalLoad
FROM riwi_branches b
INNER JOIN riwi_work_orders wo ON b.id = wo.branch_id
GROUP BY b.id, b.branch_name
ORDER BY OperationalLoad DESC;

