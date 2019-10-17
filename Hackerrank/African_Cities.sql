-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

select distinct ci.name
from city ci
join country co
on ci.countrycode = co.code
where co.continent = 'Africa';
