# Tech Support Service Management Database System

## Project Description
This project focuses on the transformation, normalization, and deployment of a relational database architecture designed for a technology support service enterprise. The initial production logging dataset suffered from severe data quality issues, such as duplicated corporate accounts, inconsistently indexed technician rosters, mismatched equipment naming structures, and redundant geographical entity assignments. 


---

## Technologies Used
*   **Development Tools**: 
MySQL Workbench
draw.io

---

## Explanation of the Normalization Process

To clean the Excel sheet, I followed three rules called Normal Forms:

1.  **First Normal Form (1FN)**: I made sure that every cell has only one piece of data. No mixed text in a single box. Every table now has a unique `id`.
2.  **Second Normal Form (2FN)**: I separated the big Excel sheet into smaller tables for the main entities: `riwi_clients`, `riwi_technicians`, and `riwi_service_types`. This stops the repetition of names.
3.  **Third Normal Form (3FN)**: I fixed the tables that depend on other tables. 
    *   I separated `riwi_equipment_categories` from `riwi_equipment`.
    *   I separated `riwi_cities` from `riwi_branches`.
    *   I removed `city_id` from the `riwi_work_orders` table because the branch already knows its own city. This prevents errors when updating data.

---
## Database Structure

The project has **8 tables** in total:

1.  **`riwi_clients`**: Stores the names of the clients.
2.  **`riwi_cities`**: Stores the names of the cities.
3.  **`riwi_branches`**: Stores the company branches.
4.  **`riwi_technicians`**: Stores the names of the technicians.
5.  **`riwi_service_types`**: Stores the types of work (`Preventive`, `Corrective`, `Installation`).
6.  **`riwi_equipment_categories`**: Stores categories like Laptop or Printer.
7.  **`riwi_equipment`**: Stores the specific models of computers and links them to a category.
8.  **`riwi_work_orders`**: The main table that connects everything using IDs. It saves the date, hours worked, and cost.

---

# Tech Support Service Management

## Project Description
This project is about creating a MySQL database for a tech support company. The original Excel file had many problems like duplicate client names, misspelled cities, and repeated equipment categories. I cleaned all the data and organized it into 8 different tables to avoid mistakes and repeating information.

---

## Technologies Used
*   **Database Engine (DBMS)**: MySQL Server 8.0
*   **Database Tool (GUI)**: MySQL Workbench 8.0
*   **Diagram Tool**: dbdiagram.io

---

## Database Engine
The database engine is **MySQL** using **InnoDB**. I chose InnoDB because it supports foreign keys (to connect tables) and keeps the data safe from errors when saving information.

---

## Explanation of the Normalization Process

To clean the Excel sheet, I followed three rules called Normal Forms:

1.  **First Normal Form (1FN)**: I made sure that every cell has only one piece of data. No mixed text in a single box. Every table now has a unique `id`.
2.  **Second Normal Form (2FN)**: I separated the big Excel sheet into smaller tables for the main entities: `riwi_clients`, `riwi_technicians`, and `riwi_service_types`. This stops the repetition of names.
3.  **Third Normal Form (3FN)**: I fixed the tables that depend on other tables. 
    *   I separated `riwi_equipment_categories` from `riwi_equipment`.
    *   I separated `riwi_cities` from `riwi_branches`.
    *   I removed `city_id` from the `riwi_work_orders` table because the branch already knows its own city. This prevents errors when updating data.

---

## Database Structure

The project has **8 tables** in total:

1.  **`riwi_clients`**: Stores the names of the clients.
2.  **`riwi_cities`**: Stores the names of the cities.
3.  **`riwi_branches`**: Stores the company branches and connects them to a city.
4.  **`riwi_technicians`**: Stores the names of the technicians.
5.  **`riwi_service_types`**: Stores the types of work (`Preventive`, `Corrective`, `Installation`).
6.  **`riwi_equipment_categories`**: Stores categories like Laptop or Printer.
7.  **`riwi_equipment`**: Stores the specific models of computers and links them to a category.
8.  **`riwi_work_orders`**: The main table that connects everything using IDs. It saves the date, hours worked, and cost.

---

## Entity Relationship Diagram

This is how the tables connect to each other:

       +-----------------+                  +-------------------+

       |   riwi_cities   |                  |  riwi_categories  |
       +-----------------+                  +-------------------+

       | * id (PK)       |                  | * id (PK)         |
       |   city_name     |                  |   category_name   |
       +--------+--------+                  +---------+---------+

                | (1)                                 | (1)
                |                                     |
                | (N)                                 | (N)
       +--------▼--------+                  +---------▼---------+

       |  riwi_branches  |                  |  riwi_equipment   |
       +-----------------+                  +-------------------+

       | * id (PK)       |                  | * id (PK)         |
       |   branch_name   |                  |   equipment_name  |
       | # city_id (FK)  |                  | # category_id (FK)|
       +--------+--------+                  +---------+---------+

                | (1)                                 | (1)
                |                                     |
                +-----------------+     +-------------+

                                  |     |
                                  |     |
  +-------------------+           |     |           +---------------------+

  |   riwi_clients    |           |     |           |   riwi_technicians  |
  +-------------------+           |     |           +---------------------+

  | * id (PK)         +---+ (1)   |     |   (1) +---> * id (PK)           |
  |   client_name     |   |       |     |       |   |   technician_name   |
  +-------------------+   |       |     |       |   +---------------------+

                          |       |     |       |
                          | (N)   | (N) | (N)   | (N)
                        +-▼-------▼─────▼-------▼-+

                        |    riwi_work_orders     |
                        +-------------------------+

                        | * id (PK)               |
                        |   work_order_code       |
                        | # client_id (FK)        |
                        | # branch_id (FK)        |
                        | # technician_id (FK)    |
                        | # equipment_id (FK)     |
                        | # service_type_id (FK)  |
                        |   service_date          |
                        |   hours_worked          |
                        |   cost                  |
                        +------------▲------------+
                                     | (N)
                                     |
                                     | (1)
                          +----------+----------+

                          |  riwi_service_types |
                          +---------------------+

                          | * id (PK)           |
                          |   service_type_name |
                          +---------------------+

  Leyenda:
  (*) PRIMARY KEY (PK)  = Es la llave primaria única.
  (#) FOREIGN KEY (FK)  = Es la llave foránea que conecta las tablas.
  (1) a (N)             = Es la relación de Uno a Muchos.

---

---

## Database Creation Instructions

1.  Open **MySQL Workbench**.
2.  Open and run the file `script_ddl.sql`.
3.  This script will create the database and all the 8 tables automatically.

```sql
CREATE DATABASE IF NOT EXISTS bd_kevin_villalobos_cumbia;
USE bd_kevin_villalobos_cumbia;
```

---

## Data Loading Instructions

1.  After creating the tables, open the file `script_carga_de_datos.sql`.
2.  Run the script to insert the clean data.
3.  The master tables will fill first, and the `riwi_work_orders` table will fill at the end using the correct reference IDs.

---

## Explanation of each SQL Query

*   **Query 1**: Counts how many orders each technician solved. It helps to see who is working the most.
*   **Query 2**: Shows the number of services done in each city. It helps to see the most active cities.
*   **Query 3**: Counts the total services grouped by type. It shows that "Repair" was successfully joined into "Corrective".
*   **Query 4**: Shows which machines have the highest number of maintenance orders.
*   **Query 5**: Lists the clients with the highest number of work orders to know who our best clients are.
*   **Query 6**: Counts the orders managed by each branch to check the operational work load.

---

## Developer Information
*   **Full Name**: Kevin Josue Villalobos Ruiz
*   **Clan**: Cumbia