-- Switching to the 'master' database to perform administrative tasks
USE master;
GO

-- Documentation: 
-- The following section checks if the 'DataWarehouse' database exists.
-- If it does, it sets it to single-user mode to ensure no active connections,
-- rolls back any open transactions, and drops the existing 'DataWarehouse' database.
-- This process is done to safely recreate the database.

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Setting the database to SINGLE_USER mode to terminate all active connections
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    -- Dropping the existing DataWarehouse database
    DROP DATABASE DataWarehouse;
END;
GO

-- Documentation: 
-- Now we proceed to create the 'DataWarehouse' database as it was dropped in the previous step.
-- The next line creates a new empty 'DataWarehouse' database.

CREATE DATABASE DataWarehouse;
GO

-- Switch to the newly created 'DataWarehouse' database to continue with the setup
USE DataWarehouse;
GO

-- Documentation: 
-- The following section creates the schemas that will be used to organize the data within the 'DataWarehouse' database.
-- Each schema represents a different layer of data transformation: bronze, silver, and gold.

-- Creating 'bronze' schema, which typically contains raw or staging data
CREATE SCHEMA bronze;
GO

-- Creating 'silver' schema, which will typically contain cleaned and transformed data
CREATE SCHEMA silver;
GO

-- Creating 'gold' schema, which will contain highly refined and aggregated data for analytics
CREATE SCHEMA gold;
GO
