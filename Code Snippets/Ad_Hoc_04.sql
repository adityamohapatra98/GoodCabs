with cte as 
(
SELECT
	city_name,
    sum(new_passengers) as total_new_passengers
FROM trips_db.fact_passenger_summary f
JOIN dim_city c
ON f.city_id=c.city_id
GROUP BY f.city_id
)
,
cte2 as 
(
select *,dense_rank() over(order by total_new_passengers desc) as rnk from cte
)
,
cte3 as 
(
select *,dense_rank() over(order by total_new_passengers asc) as rnk from cte
)
select city_name,total_new_passengers,'Top 3' as city_category
from cte2
where rnk <=3
UNION
select city_name,total_new_passengers,'Bottom 3' as city_category
from cte3
where rnk <=3