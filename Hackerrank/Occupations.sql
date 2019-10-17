-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding 
-- Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

-- Note: Print NULL when there are no more names corresponding to an occupation.

set @r1 = 0, @r2 = 0, @r3 = 0, @r4 = 0;
select min(Doctor), min(professor), min(Singer), min(Actor)
from
(select Case Occupation
        when 'Doctor' then @r1:=@r1+1
        when 'Professor' then @r2 := @r2+1
        when 'Singer' then @r3 := @r3+1
        when 'Actor' then @r4 := @r4+1
    end as RowNumber,
    Case when Occupation = 'Doctor' then Name end as Doctor,
    Case when Occupation = 'Professor' then Name end as Professor,
    Case when Occupation = 'Singer' then Name end as Singer,
    Case when Occupation = 'Actor' then Name end as Actor
    from Occupations order by Name) t
    Group by RowNumber;
