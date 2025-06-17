
 ----Test Environment----

Create database test_env

Use test_env

Select * from Products;

Select * from Test_Inventory;

Select Distinct Product_ID from Test_Inventory;

Select * from Test_Inventory a 
left join Products p on p.Product_ID =a.Product_ID;


Select * into New_table from
(Select a.Order_Date_DD_MM_YYYY,a.Product_ID,a.Availability,a.Demand,p.Product_Name,p.Unit_Price
from Test_Inventory a 
left join Products p on p.Product_ID =a.Product_ID)x;


Select * from New_table;


---- Production Environment----


Create Database PROD;

Use PROD;

Select * from Prod_Environment_Data;

--Data_Quality_Check--

Select Distinct Order_Date_DD_MM_YYYY from Prod_Environment_Data
Where Order_Date_DD_MM_YYYY is null or Order_Date_DD_MM_YYYY = '';

Select Distinct Product_ID from Prod_Environment_Data;

Select Distinct Availability from Prod_Environment_Data;

Select Distinct Demand from Prod_Environment_Data;


---Data_Transformation---

Update  Prod_Environment_Data Set Product_ID =7 where Product_ID = 21;

Update  Prod_Environment_Data Set Product_ID =11 where Product_ID = 22;

Select Distinct Product_ID from Prod_Environment_Data order by Product_ID;


Select * into New_table from
(Select a.Order_Date_DD_MM_YYYY,a.Product_ID,a.Availability,a.Demand,p.Product_Name,p.Unit_Price
from Prod_Environment_Data a 
left join Products p on p.Product_ID =a.Product_ID)x;

Select * from New_table;