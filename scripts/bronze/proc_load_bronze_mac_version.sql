/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
CREATE OR ALTER PROCEDURE bronze.load_bronze as
    BEGIN
    TRUNCATE TABLE bronze.crm_cust_info;
    BULK INSERT bronze.crm_cust_info
    FROM '/var/opt/mssql/data/cust_info.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0A',
        FIRSTROW = 2
    );


    -- CRM files
    TRUNCATE TABLE bronze.crm_prd_info;
    BULK INSERT bronze.crm_prd_info
    FROM '/var/opt/mssql/data/prd_info.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0A',
        FIRSTROW = 2
    );

    TRUNCATE TABLE bronze.crm_sales_details;
    BULK INSERT bronze.crm_sales_details
    FROM '/var/opt/mssql/data/sales_details.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0A',
        FIRSTROW = 2
    );

    -- ERP files
    TRUNCATE TABLE bronze.erp_cust_az12
    BULK INSERT bronze.erp_cust_az12
    FROM '/var/opt/mssql/data/CUST_AZ12.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0A',
        FIRSTROW = 2
    );

    TRUNCATE TABLE bronze.erp_loc_a101
    BULK INSERT bronze.erp_loc_a101
    FROM '/var/opt/mssql/data/LOC_A101.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0A',
        FIRSTROW = 2
    );

    TRUNCATE TABLE bronze.erp_px_cat_g1v2
    BULK INSERT bronze.erp_px_cat_g1v2
    FROM '/var/opt/mssql/data/PX_CAT_G1V2.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0A',
        FIRSTROW = 2
    );
END
