/*
 * ETL Deployment Versioning
 * Project #88 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS, File System
 * Created: 2014
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DeploymentETL')
BEGIN
    ALTER DATABASE DeploymentETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DeploymentETL;
END
GO

CREATE DATABASE DeploymentETL
ON PRIMARY
(
    NAME = 'DeploymentETL_Data',
    FILENAME = 'C:\SQLData\DeploymentETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'DeploymentETL_Log',
    FILENAME = 'C:\SQLData\DeploymentETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE DeploymentETL SET RECOVERY SIMPLE;
ALTER DATABASE DeploymentETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE DeploymentETL;
GO

PRINT 'Database DeploymentETL created successfully';
PRINT 'Project: ETL Deployment Versioning';
PRINT 'Description: SSIS package release management';
GO
