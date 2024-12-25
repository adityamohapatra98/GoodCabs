SELECT c.city_name, 
       CONCAT(ROUND(SUM(CASE WHEN trip_count="2-Trips" THEN repeat_passenger_count ELSE 0 END)/SUM(repeat_passenger_count)*100,2),"%") AS  "2-Trips",
       CONCAT(ROUND(SUM(CASE WHEN trip_count="3-Trips" THEN repeat_passenger_count ELSE 0 END)/SUM(repeat_passenger_count)*100,2),"%") AS  "3-Trips",
       CONCAT(ROUND(SUM(CASE WHEN trip_count="4-Trips" THEN repeat_passenger_count ELSE 0 END)/SUM(repeat_passenger_count)*100,2),"%") AS  "4-Trips",
       CONCAT(ROUND(SUM(CASE WHEN trip_count="5-Trips" THEN repeat_passenger_count ELSE 0 END)/SUM(repeat_passenger_count)*100,2),"%") AS  "5-Trips",
       CONCAT(ROUND(SUM(CASE WHEN trip_count="6-Trips" THEN repeat_passenger_count ELSE 0 END)/SUM(repeat_passenger_count)*100,2),"%") AS  "6-Trips",
       CONCAT(ROUND(SUM(CASE WHEN trip_count="7-Trips" THEN repeat_passenger_count ELSE 0 END)/SUM(repeat_passenger_count)*100,2),"%") AS  "7-Trips",
       CONCAT(ROUND(SUM(CASE WHEN trip_count="8-Trips" THEN repeat_passenger_count ELSE 0 END)/SUM(repeat_passenger_count)*100,2),"%") AS  "8-Trips",
       CONCAT(ROUND(SUM(CASE WHEN trip_count="9-Trips" THEN repeat_passenger_count ELSE 0 END)/SUM(repeat_passenger_count)*100,2),"%") AS  "9-Trips",
       CONCAT(ROUND(SUM(CASE WHEN trip_count="10-Trips" THEN repeat_passenger_count ELSE 0 END)/SUM(repeat_passenger_count)*100,2),"%") AS  "10-Trips"
FROM dim_repeat_trip_distribution r 
JOIN dim_city c ON c.city_id=r.city_id
GROUP BY c.city_id;