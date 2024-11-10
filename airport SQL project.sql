create database airport;
use airport;
show tables;
select*from airports2 limit 5;


 ---- P.S 1 Get idea of travel insides between two pairs of airports help me to find
  --- most frequent routes
   ---- find out total numbers of passengers travel details based on that 1.I can take decisions to plan someairline
    --- solution sum aggregate function
	   --- group by source airport
	  -- destination airport
      select origin_airport,
       destination_airport,
       sum(passengers) as total_passengers
       from airport2
       group by origin_airport,destination_airport
       order by total_passengers desc;
       
      
      
      
      
      
    --- ps 2 find out highest and lowest seat occupancy(optimize flight cpacity,improving operational efficiency
	   --- how to do?????
     --- calculate average seat utilization for each flight
       ---- total numbers of passengers\total number of available seat(average) as average seats
         --- group by origial airport,destination airport order  by average seats 
         
         
select origin_airport,
       destination_airport,
       ave(CAST(passengers as FLOAT) / NULLIF(seats,0))*100 as average_seats_available_utilization
       from airport2
       group by origin_airport,destination_airport
       order by average_seats_avilable_utilization desc;
       
       
       
       
       
         --problrm statement 3
      
            select origin_airport,
       destination_airport,
       sum(passengers) as total_passengers
       from airport2
       group by origin_airport,destination_airport
       order by total_passengers desc limit 5;
	