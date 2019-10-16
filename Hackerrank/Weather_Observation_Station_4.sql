-- Let N be the number of CITY entries in STATION, and let N' be the number of distinct CITY names in STATION; 
-- query the value of N-N' from STATION. In other words, find the difference between the total number of CITY entries 
--in the table and the number of distinct CITY entries in the table.
select (count(*)-count(distinct city)) as diff from station;
