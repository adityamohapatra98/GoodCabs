with cte as(
SELECT 
	t.city_id,
	city_name,
    monthname(date) as month,
	sum(fare_amount) as Revenue,
    dense_rank() over(partition by city_name order by sum(fare_amount) desc) as rnk    
FROM trips_db.fact_trips t
JOIN dim_city c
ON t.city_id=c.city_id
GROUP BY city_id,monthname(date)
),cte2 as (
select *,revenue/sum(revenue) over (partition by city_name)*100 as contribution
from cte )
select city_name,month,revenue,concat(round(contribution,2),' %') as contribution_to_revenue
from cte2
where rnk =1