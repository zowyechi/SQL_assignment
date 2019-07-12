-- QUESTION 1
-- What's the most expensive listing? What else can you tell me about the listing?

select l.price * l.minimum_nights as min_pay, l.name, l.minimum_nights, l.price, 
	l.neighbourhood, l.host_name, l.availability_365, l.calculated_host_listings_count
from sfo_listings as l
order by 1 desc
limit 5

-- If all data is correct, Josh listing would be the most expensive and you'll stay there for 
-- most of your life.
-- Nikhil's listing sounds more plausible but you need to rent the listing for 3 years.


-- QUESTION 2
-- What neighborhoods seem to be the most popular?
select l.id, l.neighbourhood, l.reviews_per_month, l.availability_365
from sfo_listings as l
where l.reviews_per_month is not null
order by 3 desc
limit 10

-- "24736036" - Outer Richmond has the most reviews per month

select *
from sfo_reviews as rev
where rev.listing_id = 24736036
-- when we look at the comments they're all positive



-- QUESTION 3
-- What time of year is the cheapest time to go to San Francisco? What about the busiest?


select cal.listing_id, DATE_PART('month', cal.calender_date) as mon, count(cal.listing_id)
from sfo_calendar as cal
group by 1,2
order by 3
