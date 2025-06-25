
SELECT * FROM water_supply_sanitation_africa LIMIT 100;

1. THE AVERAGE WATER AVAILABILITY FOR EACH COUNTRY
SELECT 
    Country, 
    AVG(`Water Availability (liters per capita per day)`) AS Avg_Water_Availability
FROM Water_Supply_Sanitation_Africa
GROUP BY Country
ORDER BY Avg_Water_Availability DESC;

2. DETAILS OF COMMUNITIES WHERE AT LEAST ONE WATER POINT IS NON-FUNCTIONAL
SELECT * 
FROM Water_Supply_Sanitation_Africa
WHERE `Number of Non-Functional Water Points` > 0;

3. THE TOP FIVE COMMUNITIES WITH THE HIGHEST ANNUAL SANITATION MAINTENANCE COSTS
SELECT * 
FROM Water_Supply_Sanitation_Africa
ORDER BY `Annual Maintenance Cost (USD)` DESC
LIMIT 5;

4. TOTAL NUMBER OF FUNCTIONAL AN NON FUNCTIONAL WATER POINTS PER COUNTRY
SELECT 
    Country, 
    SUM(`Number of Functional Water Points`) AS Total_Functional_Water_Points, 
    SUM(`Number of Non-Functional Water Points`) AS Total_Non_Functional_Water_Points
FROM `Water_Supply_Sanitation_Africa`
GROUP BY Country
ORDER BY Total_Functional_Water_Points DESC;

5. COMMUNITIES WITH A HIGH INCIDENCE OF WATERBORNE DISEASES (>20%)
SELECT * 
FROM Water_Supply_Sanitation_Africa
WHERE `Waterborne Diseases Incidence Rate (%)` > 20;

6. THE AVERAGE DISTANCE TO THE WATER SOURCE PER REGION
SELECT 
    Region, 
    AVG(`Average Distance to Water Source (km)`) AS Avg_Distance_To_Water_Source
FROM Water_Supply_Sanitation_Africa
GROUP BY Region
ORDER BY Avg_Distance_To_Water_Source DESC;

7. THE COMMUNITIES THAT RECEIVE BOTH GOVERNMENT AND NGO SUPPORT
SELECT * 
FROM Water_Supply_Sanitation_Africa
WHERE `Government Support` = 'Yes' 
AND `NGO Support` = 'Yes';

8. THE COMMUNITY WITH THE HIGHEST POPULATION PER COUNTRY
SELECT * 
FROM Water_Supply_Sanitation_Africa AS ws
WHERE Population = (
    SELECT MAX(Population) 
    FROM Water_Supply_Sanitation_Africa 
    WHERE Country = ws.Country)
    ;
    
SHOW COLUMNS FROM Water_Supply_Sanitation_Africa;