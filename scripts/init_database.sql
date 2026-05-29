/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script

Author: Claudio
=============================================================
*/


USE master;
GO

-- Create database only if it does not exist
IF DB_ID('DataWarehouse') IS NULL
BEGIN
    PRINT 'Creating database DataWarehouse...';
    CREATE DATABASE DataWarehouse;
END
ELSE
BEGIN
    PRINT 'Database DataWarehouse already exists.';
END
GO

USE DataWarehouse;
GO

-- Create bronze schema
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'bronze'
)
BEGIN
    EXEC('CREATE SCHEMA bronze');
    PRINT 'Schema bronze created.';
END
ELSE
BEGIN
    PRINT 'Schema bronze already exists.';
END
GO

-- Create silver schema
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'silver'
)
BEGIN
    EXEC('CREATE SCHEMA silver');
    PRINT 'Schema silver created.';
END
ELSE
BEGIN
    PRINT 'Schema silver already exists.';
END
GO

-- Create gold schema
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'gold'
)
BEGIN
    EXEC('CREATE SCHEMA gold');
    PRINT 'Schema gold created.';
END
ELSE
BEGIN
    PRINT 'Schema gold already exists.';
END
GO
