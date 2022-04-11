%%sql
postgresql:///international_debt

SELECT count(distinct country_name)
as total_distinct_countries
FROM international_debt;
/* Determines the number of distinct countries in the table */

select distinct indicator_code as distinct_debt_indicators
from international_debt
order by distinct_debt_indicators
/* Creates a table consisting of the different indicators, aliased as distinct_debt_indicators */

SELECT 
    round(sum(debt)/1000000, 2) as total_debt
FROM international_debt; 

/*Rounds the total debt divided by 1 million to 2 digits and aliases as total_debt */

SELECT 
    country_name, 
    sum(debt) as total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt Desc
limit 1;

/*Creates a table consisting of the country with largest total debt */

SELECT 
    indicator_code AS debt_indicator,
    indicator_name,
    avg(debt) as average_debt
FROM international_debt
GROUP BY debt_indicator,indicator_name
ORDER BY average_debt Desc
Limit 10;

/*Creates a table consisting of the 10 countries with highest average debt, grouped by indicator code and name*/

SELECT 
    country_name, 
    indicator_name
FROM international_debt
WHERE debt = (SELECT 
                  MAX(debt)
              FROM international_debt
              WHERE indicator_code='DT.AMT.DLXF.CD');


/*Creates a table consisting of the country and indicator name where debt is the maximum for the indicator code 'DT.AMT.DLXF.CD'*/

select indicator_code, count(indicator_code) as indicator_count
from international_debt
group by indicator_code
order by indicator_count desc,indicator_code Desc
limit 20

/*Selects the indicator_code and the totals, orders it in descending order and limits to 20*/

select country_name, max(debt) as maximum_debt
from international_debt
Group by country_name
order by maximum_debt desc
limit 10
/*Selects the 10 countries with the highest max debt and their maximum debts, and groups by country name*/
