-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . 
-- Truncate your answer to 4 decimal places.
select truncate(sum(lat_n),4)
from station
where lat_n > 38.7880 && lat_n < 137.2345;
