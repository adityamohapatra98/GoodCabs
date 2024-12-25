select 
	c.city_name,
    month,
    total_passengers,
    repeat_passengers,
    repeat_passengers/total_passengers*100 as monthly_repeat_passenger_rate,
    round(sum(repeat_passengers) over(partition by city_name)/sum(total_passengers) over(partition by city_name)*100,2) as city_repeat_passengers_rate
from fact_passenger_summary s
join dim_city c
on c.city_id=s.city_id