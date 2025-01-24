CREATE DATABASE OLA;
USE OLA

SELECT * FROM Booking

/*1. Retrieve all successful bookings:*/
SELECT * FROM booking
WHERE Booking_Status = 'Success';

/*2. Find the average ride distance for each vehicle type:*/
SELECT Vehicle_Type, AVG(Ride_Distance)
From Booking
GROUP BY Vehicle_Type

/*3. Get the total number of cancelled rides by customers:*/
SELECT COUNT(*) From Booking
WHERE Booking_Status = "Canceled by Customer"

/*4. List the top 5 customers who booked the highest number of rides:*/

SELECT Customer_ID , COUNT(Booking_ID) as total_rides FROM Booking 
GROUP BY  Customer_ID
ORDER BY total_rides DESC
LIMIT 5

-- 5.) Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) From Booking
WHERE Booking_Status = "Canceled by Driver" AND Canceled_Rides_by_Driver = "Personal & Car related issue"
GROUP  BY Booking_Status
-- or
SELECT COUNT(*) FROM booking
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6.) Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(Driver_Ratings) ,MIN(Driver_Ratings)
From Booking
WHERE Vehicle_Type ="Prime Sedan"

-- 7.) Retrieve all rides where payment was made using UPI:
SELECT * FROM Booking
WHERE Payment_Method = "UPI"

-- 8.) Find the average customer rating per vehicle type: 
SELECT Vehicle_Type , AVG(Customer_Rating) as Cust_Rating
FROM Booking
GROUP BY Vehicle_Type

-- 9.) Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) From Booking
WHERE Booking_Status = "Success"

-- 10.) List all incomplete rides along with the reason: 
CREATE VIEW incompete_ride As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM booking
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM incompete_ride


