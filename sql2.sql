--What was the hottest day in our data set? Where was that?
select max(w.maxtemperaturef) as mtemp, 
 	w.zip as zip, w.date as wdate
from weather as w
group by 2, 3
order by 1 desc

--How many trips started at each station?
select count(t.trip_id),t.start_station
from trips as t
group by 2

--What's the shortest trip that happened?
select min(t.duration)
from trips as t

--What is the average trip duration, by end station?
select avg(t.duration), t.end_station
from trips as t
group by 2