/* 

Author: Firdaus
Date  : 2026-04-20
Script: init_database.sql

Objective: This script is to create a database and schema initialization within the database.

*/
USE master

CREATE DATABASE DataWarehouse;

USE DataWarehouse;

--CREATE SCHEMA
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
