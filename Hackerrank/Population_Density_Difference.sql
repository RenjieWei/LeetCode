-- Query the difference between the maximum and minimum populations in CITY.
select max(population) - min(population) as diff
from city;
