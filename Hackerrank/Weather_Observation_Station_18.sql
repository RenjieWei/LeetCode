-- Query the Manhattan Distance between points  and  and round it to a scale of 4 decimal places.

select round((abs(max(lat_n)-min(lat_n)) + abs(max(long_w)-min(long_w))),4)
from station;
