use blinkitdb
SELECT *FROM blinkit_table

select count(*) from blinkit_table

select distinct(Item_Fat_Content) from blinkit_table

--total sales

select cast(sum(Sales) /100000 as decimal(10,2)) as Total_Sales
from blinkit_table

--AVG sales

select cast(avg(Sales) as decimal(10,1) )as AVG_Sales from blinkit_table

--No:of Items
select count(*) as No_of_Items from blinkit_table 

--Avg Rating
select cast(avg(Rating) as decimal(10,2))as Avg_Rating from blinkit_table

--Total sales by Fat content
SELECT 
    Item_Fat_Content,
    CAST(SUM(Sales)/1000 AS DECIMAL(10,2)) AS Total_Sales_Thousands,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
    COUNT(*) AS No_of_Items,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_table
GROUP BY Item_Fat_Content
ORDER BY Total_Sales_Thousands DESC;
--Total sales by item type
SELECT 
    Item_Type,
    CAST(SUM(Sales)/1000 AS DECIMAL(10,2)) AS Total_Sales,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
    COUNT(*) AS No_of_Items,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_table
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

--Fat content by outlet for total sales
SELECT 
    Outlet_Location_Type,   
    ISNULL([Low Fat], 0) AS Low_Fat,
    ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT  
        Outlet_Location_Type, 
        Item_Fat_Content,
        CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_table
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT
(
    SUM(Total_Sales)
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;


--Total Sales by Outlet Establishment
SELECT 
    Outlet_Establishment_Year,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS AVG_Sales,
    COUNT(*) AS No_of_Items,
    CAST(AVG(Sales) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_table
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;

-- Total Sales by Fat Content for each Outlet
SELECT 
    Outlet_Identifier,
    Item_Fat_Content,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
    COUNT(*) AS No_of_Items,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_table
GROUP BY Outlet_Identifier, Item_Fat_Content
ORDER BY Outlet_Identifier, Total_Sales DESC;


-- Percentage of Sales by Outlet Size
SELECT 
    Outlet_Size,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM blinkit_table) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_table
GROUP BY Outlet_Size
ORDER BY Sales_Percentage DESC;

--sales by outlet location
SELECT 
    Outlet_Location_Type,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
    COUNT(*) AS No_of_Items,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_table
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;




-- All metrics by Outlet Type
SELECT 
    Outlet_Type,
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
    COUNT(*) AS No_of_Items,
    CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
    CAST(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM blinkit_table) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_table
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;


 