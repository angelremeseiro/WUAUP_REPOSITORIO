
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/06/2013 13:59:07
-- Generated from EDMX file: C:\CYMIMASA\CYMIMASA\ADO.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Intranet];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[IntranetModelStoreContainer].[Maestra Paises]', 'U') IS NOT NULL
    DROP TABLE [IntranetModelStoreContainer].[Maestra Paises];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Maestra_Paises'
CREATE TABLE [dbo].[Maestra_Paises] (
    [ID_Pais] int  NOT NULL,
    [Nombre_Pais] nchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID_Pais], [Nombre_Pais] in table 'Maestra_Paises'
ALTER TABLE [dbo].[Maestra_Paises]
ADD CONSTRAINT [PK_Maestra_Paises]
    PRIMARY KEY CLUSTERED ([ID_Pais], [Nombre_Pais] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------