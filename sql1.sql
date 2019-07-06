--The IDs and durations for all trips of duration 
-- greater than 500, ordered by duration.
select t.trip_id, t.duration
from trips as t
where t.duration > 500
order by t.duration

--Every column of the stations table for station id 84.
select *
from station as s
where s.stattion_id = 84

--The min temperatures of all the occurrences of 
-- rain in zip 94301.
select w.mintemperaturef
from weather as w
where w.zip = 94301 and w.events = 'Rain'
