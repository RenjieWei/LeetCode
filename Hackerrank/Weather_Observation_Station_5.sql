-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number
-- of characters in the name). If there is more than one smallest or largest city, 
-- choose the one that comes first when ordered alphabetically.
(SELECT CITY, CHAR_LENGTH(CITY) FROM STATION
ORDER BY CHAR_LENGTH(CITY), CITY
LIMIT 1)
UNION ALL
(SELECT CITY, CHAR_LENGTH(CITY) FROM STATION
ORDER BY CHAR_LENGTH(CITY) DESC, CITY DESC
LIMIT 1);
