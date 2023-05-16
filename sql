QUES 1. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
ANS: (Select city,length(city)
from station
where length(city)=(select Max(length(city)) from station)
order by city asc
limit 1)
union
(select city,length(city)
from station
where length(city)=(select min(city) from station
order by city asc
limit 1)
order by city asc
limit 1

QUES 2. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
ANS: SELECT DISTINCT(CITY)
FROM STATION 
WHERE
(CITY LIKE 'A%'
 OR
CITY LIKE 'E%'
OR 
CITY LIKE 'I%'
OR
CITY LIKE 'O%'
OR
CITY LIKE 'U%');

QUES 3. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
ANS: SELECT CITY
FROM STATION
WHERE (CITY LIKE '%A'
       OR
       CITY LIKE '%E'
       OR
       CITY LIKE '%I'
       OR
       CITY LIKE '%O'
       OR
       CITY LIKE '%U'
       )
       GROUP BY CITY
QUES 4. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
ANS: SELECT CITY
FROM STATION
WHERE (CITY LIKE '%A'
      OR
      CITY LIKE '%E'
      OR
       CITY LIKE '%I'
      OR
       CITY LIKE '%O'
      OR
       CITY LIKE '%U'
      ) AND 
      (CITY LIKE 'A%'
      OR
      CITY LIKE 'E%'
      OR
       CITY LIKE 'I%'
      OR
       CITY LIKE 'O%'
      OR
       CITY LIKE 'U%'
      ) 
      GROUP BY CITY
      
QUES. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
ANS: SELECT CITY
FROM STATION
WHERE (CITY NOT LIKE 'A%' 
       AND
      CITY NOT LIKE 'E%' 
       AND
       CITY NOT LIKE 'I%' 
       AND
       CITY NOT LIKE 'O%' 
       AND
       CITY NOT LIKE 'U%' 
       )
       GROUP BY CITY
 QUES. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
 ANS: SELECT CITY
FROM STATION
WHERE (CITY NOT LIKE '%A'
      AND
      CITY NOT LIKE '%E'
      AND
       CITY NOT LIKE '%I'
      AND
       CITY NOT LIKE '%O'
      AND
       CITY NOT LIKE '%U'
      )
      GROUP BY CITY
      
 QUES. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
 ANS: SELECT CITY
FROM STATION
WHERE (CITY NOT LIKE 'A%'
      AND
      CITY NOT LIKE 'E%'
      AND
       CITY NOT LIKE 'I%'
      AND
       CITY NOT LIKE 'O%'
      AND
       CITY NOT LIKE 'U%'
      ) OR 
      (CITY NOT LIKE '%A'
      AND
      CITY NOT LIKE '%E'
      AND
       CITY NOT LIKE '%I'
      AND
       CITY NOT LIKE '%O'
      AND
       CITY NOT LIKE '%U'
      )
      GROUP BY CITY
      
 QUES. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
 ANS: SELECT CITY
FROM STATION
WHERE (CITY NOT LIKE 'A%'
      AND
      CITY NOT LIKE 'E%'
      AND
       CITY NOT LIKE 'I%'
      AND
       CITY NOT LIKE 'O%'
      AND
       CITY NOT LIKE 'U%'
      ) AND 
      (CITY NOT LIKE '%A'
      AND
      CITY NOT LIKE '%E'
      AND
       CITY NOT LIKE '%I'
      AND
       CITY NOT LIKE '%O'
      AND
       CITY NOT LIKE '%U'
      )
      GROUP BY CITY
      
QUES. Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
ANS: SELECT NAME
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name,3),ID ASC;

QUES. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
ANS: SELECT NAME FROM EMPLOYEE ORDER BY NAME ASC

QUES. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
ANS: SELECT NAME
FROM EMPLOYEE
WHERE (SALARY>2000 AND MONTHS<10)
ORDER BY employee_id ASC

QUES. Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . Round your answer to  decimal places.
ANS: SELECT ROUND(LONG_W,4)
FROM STATION
WHERE LAT_N<137.2345
ORDER BY LAT_N DESC
LIMIT 1

QUES. Query the smallest Northern Latitude (LAT_N) from STATION that is greater than . Round your answer to  decimal places.
ANS: SELECT ROUND(LAT_N,4)
FROM STATION
WHERE LAT_N>38.7780
ORDER BY LAT_N ASC
LIMIT 1

QUES. Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . Round your answer to  decimal places.
ANS: SELECT ROUND(LONG_W,4)
FROM STATION
WHERE LAT_N>38.7780
ORDER BY LAT_N ASC
LIMIT 1

QUES. Consider  and  to be two points on a 2D plane.

 happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.
ANS: SELECT ROUND(ABS((MIN(LAT_N)-MAX(LAT_N))+(MIN(LONG_W)-MAX(LONG_W))),4)
FROM STATION

QUES: Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.
ANS: SELECT ROUND(SQRT(POW((MIN(LAT_N)-MAX(LAT_N)),2)+POW(MIN(LONG_W)-MAX(LONG_W),2)),4)
FROM STATION

QUES. A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
ANS: select round(lat_n,4)
from station
where lat_n>83.49946581 and lat_n<83.92116818
order by lat_n asc limit 1;

Ques. You have been asked to find the job titles of the highest-paid employees.
Your output should include the highest-paid title or multiple titles with the same salary.
ANS: SELECT worker_title AS Best_Paid_title
FROM worker
JOIN title
ON worker_id =worker_ref_id
ORDER BY SALARY DESC
LIMIT 5



