with cte as (
Select 
	city_name,
    count(distinct trip_id) as total_trips,
    avg(fare_amount/distance_travelled_km) as average_fare_per_km,
    sum(fare_amount)/count(distinct trip_id) as average_fare_per_trip,
    (count(distinct trip_id)/sum(count(distinct trip_id)) over()) *100 as contribution_to_total_trips
from dim_city c
join fact_trips f
on c.city_id=f.city_id
group by city_name
)
select 
	city_name,
	total_trips,
    round(average_fare_per_km,2) as average_fare_per_km,
    round(average_fare_per_trip,2) as average_fare_per_trip,
    round(contribution_to_total_trips,2) as contribution_to_total_trips
from cte