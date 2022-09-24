# NYC Payroll Data Warehouse Project

## Overview 
In this project, an Azure data warehouse is built. The data is based on [NYC Payroll dataset](https://data.cityofnewyork.us/widgets/k397-673e?mobile_redirect=true).
The purposes of the analysis is how much of the City's budget is being spent on salary and overtime.

In order to adress the purpose, a star schema is designed.

<img src="https://user-images.githubusercontent.com/6762596/192116236-16a66325-d33f-4205-86bf-ec18ed68b575.png" width="500" height="380">

Then this documentation describes the steps to implement the data warehouse: 
1. Extract the Data from PostgreSQL
2. Load the data into external tables in the data warehouse
3. Transform the data to the star schema

## Extract Step
In this scenario, data is extracted from PostgreSQL. Using ingest data feature from Synapse Analytics Workspace.

<img src="https://user-images.githubusercontent.com/6762596/192117869-a083cd78-209c-4cb0-87c1-bbc1a3f0c44f.png" width="500" height="300">


## Load Step

<img src="https://user-images.githubusercontent.com/6762596/192118088-8f48ac78-69f3-4626-a924-bb6288039760.png" width="300" height="500">

![image]()

## Transform Step

<img src="https://user-images.githubusercontent.com/6762596/192118107-44d86322-5627-4cac-a031-8a3c2c93c8b3.png" width="300" height="500">
