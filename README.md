# SQL-Challenge: Employee Database

## Overview

It’s been two weeks since I was hired as a new data engineer at Pewlett Hackard. My first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files. The project involves data modelling, data engineering, and data analysis.

## Repository Structure

```
.
├── EmployeeSQL
│   └── EmployeeSQL.sql       # SQL queries and table schemas
├── Employee_ERD.png          # ERD diagram
├── Resources
│   ├── departments.csv       # CSV data for departments
│   ├── dept_emp.csv          # CSV data for department-employee relations
│   ├── dept_manager.csv      # CSV data for department managers
│   ├── employees.csv         # CSV data for employees
│   ├── salaries.csv          # CSV data for salaries
│   └── titles.csv            # CSV data for job titles
└── README.md                 # This README file
```

## Prerequisites

- SQL Database (e.g., PostgreSQL)
- An SQL client to run the queries (e.g. pgAdmin)

## Instructions

### Data Modeling

Inspect the CSV files and create an ERD of the tables. The ERD model is available as `Employee_ERD.png` in the repository.

### Data Engineering

1. Use the `EmployeeSQL.sql` file to create the tables and establish the relationships as per the ERD.
2. Import the CSV files into the corresponding SQL tables.

### Data Analysis

Run the queries present in the `EmployeeSQL.sql` to answer various questions about the data.

## Running the SQL queries

1. Open your SQL client.
2. Connect to your database.
3. Run the queries from `EmployeeSQL.sql`.

## ERD Model

The Entity-Relationship Diagram (ERD) can be viewed in the file `Employee_ERD.png`.

**README file generated by GPT4
