-- What are the three longest trips on rainy days?
select max(t.duration), w.zip
from trips as t
inner join weather as w on w.zip = t.zip_code
where w.events = 'Rain'
group by 2
order by 1 desc
limit 3

--
WITH rainy as 
(
SELECT 
DATE(date) rain_date
From weather
WHERE events = 'Rain'
GROUP BY 1
) 
SELECT
t.trip_id,
t.duration,
DATE(t.start_date)
FROM trips t
JOIN rainy r
on DATE(t.start_date) = r.rain_date
ORDER BY duration DESC
LIMIT 3


-- Which station is full most often?
select distinct s.name, s.station_id
from stations as s
inner join status as st on s.station_id = st.station_id
where st.docks_available = 0

--
SELECT
status.station_id,
stations.name,
COUNT(CASE WHEN docks_available=0 then 1 END) empty_count
FROM status
JOIN stations
on stations.station_id = status.station_id
GROUP BY 1,2
ORDER BY empty_count DESC


-- Return a list of stations with a count of number of trips starting 
-- at that station but ordered by dock count.
select *
from stations as s
inner join trips as t on s.station_id = st.station_id


--SELECT
start_station,
dockcount,
COUNT(*)
FROM trips
JOIN stations
ON stations.name=trips.start_station
GROUP BY 1, 2
ORDER BY 2 DESC


--(Challenge) What's the length of the longest trip for each day it rains anywhere?