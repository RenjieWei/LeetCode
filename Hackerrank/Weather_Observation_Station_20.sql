-- A median is defined as a number separating the higher half of a data set from the lower half.
-- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places

Select round(temp.LAT_N,4) 
from station as temp 
where 
(select count(*) from station where Lat_N < temp.LAT_N ) 
= 
(select count(*) from station where Lat_N > temp.LAT_N);
