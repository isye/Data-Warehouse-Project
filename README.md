# NYC Payroll Data Warehouse Project

## Overview 
This project describes ELT process to an Azure data warehouse. The data is based on [NYC Payroll dataset](https://data.cityofnewyork.us/widgets/k397-673e?mobile_redirect=true). The data is in csv format. But this project uses scenario to extract data from RDBMS database, in this case PostgreSQL. So, the csv csv data is transformed to PostgreSQL first. In order to avoid redundancy, the data is normalised first. From the csv table, the employee data, agency and job title are separated into each master table. So, the final PostgreSQL database consist of 4 tables: agencymaster (master table for agency), empmaster (master table for employee), titlemaster (master table for job title) and nycpayrol (table for payroll data).  

The purposes of the analysis is to analyse how much of the City's budget is being spent on salary and overtime.

In order to adress the purpose, a star schema is designed.

<img src="https://user-images.githubusercontent.com/6762596/192116236-16a66325-d33f-4205-86bf-ec18ed68b575.png" width="500" height="380">

The steps are: 
1. Extract the Data from PostgreSQL
2. Load the data into external tables in the data warehouse
3. Transform the data to the star schema

## Extract Step
In this scenario, data is extracted from PostgreSQL. Using ingest data feature from Synapse Analytics Workspace, data from PostgreSQL is extracted into Azure Data Blob.

<img src="https://user-images.githubusercontent.com/6762596/192117869-a083cd78-209c-4cb0-87c1-bbc1a3f0c44f.png" width="500" height="300">


## Load Step
The load process creates external table as staging table from Azure Data Blob. The sql scripts for these processes are  Load_Agency_Master.sql, Load_Emp_Master.sql, Load_NYC_Payroll.sql, Load_Title_Master.sql.

<img src="https://user-images.githubusercontent.com/6762596/192118088-8f48ac78-69f3-4626-a924-bb6288039760.png" width="300" height="500">


## Transform Step
The transform step creates star schema database from staging tables in load step. The sql script to do this step is Transform_to_the_Star_Schema.sql.

<img src="https://user-images.githubusercontent.com/6762596/192118107-44d86322-5627-4cac-a031-8a3c2c93c8b3.png" width="300" height="500">
