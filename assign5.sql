CREATE TABLE Employee (
  Employee_ID INT PRIMARY KEY,
  Name VARCHAR(30) NOT NULL, 
  Email VARCHAR(50), 
  Phone_Number VARCAHR(20) NOT NULL, 
  Address VARCHAR(100), 
  Job_title VARCHAR(20), 
  Pay_rate DOUBLE, 
  Service_ID INT, 
  FOREIGN KEY (Service_ID) REFERENCES Service(Service_ID)
); 

CREATE TABLE Client (
  Client_ID INT PRIMARY KEY, 
  Name VARCHAR(30) NOT NULL, 
  Email VARCHAR(50), 
  Phone_Number VARCHAR(20) NOT NULL, 
  Address VARCHAR(100), 
  Preferred_Employee VARCHAR(30), 
  FOREIGN KEY (Preferred_Employee) REFERENCES Employee(Name)
); 

CREATE TABLE Service (
  Schedule_ID INT PRIMARY KEY, 
  Service_Type VARCHAR(20) NOT NULL, 
  Price DOUBLE NOT NULL
); 

CREATE TABLE Schedule (
  Schedule_ID INT PRIMARY KEY, 
  Work_Time TIME, Date DATE, 
  Employee_ID INT, 
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
); 

CREATE TABLE DATE_TIME(
  date_time DATETIME PRIMARY KEY
); 

CREATE TABLE Appointment (
  date_time DATETIME PRIMARY KEY, 
  Employee_ID INT, 
  Service_ID INT, 
  Client_ID INT, 
  Status VARCHAR(10) NOT NULL, 
  FOREIGN KEY(date_time) REFERENCES DATE_TIME(date_time), 
  FOREIGN KEY(Employee_ID) REFERENCES Employee(Employee_ID), 
  FOREIGN KEY(Service_ID) REFERENCES Service(Service_ID),
  FOREIGN KEY(Client_ID) REFERENCES Client(Client_ID)
);