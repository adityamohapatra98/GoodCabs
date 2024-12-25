with cte as (
select city_id,
	count(distinct trip_id) as actual_trips,
	DATE_FORMAT(date, '%Y-%m-01') AS month
from fact_trips
group by DATE_FORMAT(date, '%Y-%m-01'),city_id
)
Select 
	city_name,
	actual_trips,
    c.month,
    total_target_trips,
    case when actual_trips > total_target_trips then 'Above Target' else 'Below Target' end as performance_status,
    round((actual_trips-total_target_trips)/total_target_trips*100,2)as difference
from cte c
join targets_db.monthly_target_trips t
on c.city_id =t.city_id and c.month=t.month
join dim_city d
on c.city_id=d.city_id