-- Task1
-- USE little_lemon_db;
-- DELIMITER //
-- CREATE PROCEDURE AddBooking(IN bookingID INT, IN bookingDate DATE, IN tableNumber INT, IN staffID INT, IN customerID INT, IN orderID INT)
-- BEGIN
-- 	INSERT INTO Bookings (BookingID, Date, TableNo, Staff_StaffID, Customers_CustomerID, Orders_OrderID)
--     VALUES (bookingID, bookingDate, tableNumber, staffID, customerID, orderID);
--     SELECT 'New booking added.' AS Confirmation;
-- END //
-- DELIMITER ;

-- CALL AddBooking(9, '2022-12-30', 3, 1, 4, 1); 

-- Task2
USE little_lemon_db;
-- DELIMITER //
-- CREATE DEFINER='capstone_meta'@'localhost' PROCEDURE UpdateBooking(IN bookingID INT, IN bookingDate DATE, IN tableNumber INT)
-- BEGIN
-- 	SET SQL_SAFE_UPDATES = 0;
-- 	UPDATE little_lemon_db.Bookings SET TableNo = tableNumber WHERE Bookings.BookingID=9 AND Bookings.Date=bookingDate;
-- 	SELECT CONCAT('Booking ', bookingID, ' is updated.') AS Confirmation;
-- 	SET SQL_SAFE_UPDATES = 1;
-- END //
-- DELIMITER ; 
-- Call UpdateBooking(9, '2022-12-17', 17);

-- Task3
-- USE little_lemon_db;
-- DELIMITER //
-- CREATE PROCEDURE CancelBooking(IN bookingID INT)
-- BEGIN
-- 	DELETE FROM little_lemon_db.Bookings WHERE Bookings.BookingID = bookingID;
--     SELECT CONCAT('Booking ', bookingID, ' is cancelled') AS Confirmation;
-- END //
-- DELIMITER ;
-- CALL CancelBooking(9);

