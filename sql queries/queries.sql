Create database Ola;
Use Ola;


Create View Successful_Bookings As
SELECT * FROM bookings
WHERE Booking_Status = 'Success';
#1. Retrieve all successful bookings:
SELECT * From Successful_Bookings;



Create View ride_distance_for_each_vehicle As
select Vehicle_Type, AVG (Ride_Distance)
as Ride_Distance From Bookings
GROUP BY Vehicle_Type;
#2. Find the average ride distance for each vehicle type:
Select * from ride_distance_for_each_vehicle;



Create View cancelled_rides_by_customers As
SELECT COUNT(*) FROM bookings 
WHERE Booking_Status = 'cancelled by Customer';
#3. Get the total number of cancelled rides by customers:
select * from cancelled_rides_by_customers;



Create View top_5_customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides 
FROM bookings 
GROUP BY Customer_ID 
ORDER BY total_rides DESC LIMIT 5;
#4. List the top 5 customers who booked the highest number of rides:
Select * from top_5_customers;


Create View rides_canceled_by_drivers_due_to_personal_and_car_related_issues As
SELECT COUNT(*) FROM bookings
 WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';
 #5. Get the number of rides canceled by drivers due to personal and car-related issues:
Select * from rides_canceled_by_drivers_due_to_personal_and_car_related_issues;


Create View max_min_driver_rating As
SELECT MAX(Driver_Ratings) as max_rating,
 MIN(Driver_Ratings) as min_rating 
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select * from max_min_driver_rating;

Create View UPI_Payment As
SELECT * FROM bookings
 WHERE Payment_Method = 'UPI';
 #7. Retrieve all rides where payment was made using UPI:
Select * from UPI_Payment;


Create View avg_cust_rating_per_vehicle_type As
SELECT Vehicle_Type, AVG(Customer_Rating)
 as avg_customer_rating FROM bookings
GROUP BY Vehicle_Type;
#8. Find the average customer rating per vehicle type:
Select * from avg_cust_rating_per_vehicle_type;


Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_value 
FROM bookings 
WHERE Booking_Status = 'Success';
#9. Calculate the total booking value of rides completed successfully:
Select * from total_successful_ride_value;


Create View incomplete_ride As
SELECT Booking_ID, Incomplete_Rides_Reason
 FROM bookings
 WHERE Incomplete_Rides = 'Yes';
#10. List all incomplete rides along with the reason:
Select * from incomplete_ride;
