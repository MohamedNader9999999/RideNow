CREATE DATABASE testdb;

USE testdb;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL
);

-- Drivers
CREATE TABLE drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    driver_license_number VARCHAR(50) UNIQUE NOT NULL,
    car_license_number VARCHAR(50) UNIQUE NOT NULL,
    status ENUM('available','on_trip') DEFAULT 'available'
);

-- Rides
CREATE TABLE rides (
    ride_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    driver_id INT,
    pickup_location VARCHAR(255) NOT NULL,
    dropoff_location VARCHAR(255) NOT NULL,
    status ENUM('requested','accepted','completed','cancelled') DEFAULT 'requested',
	start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

-- Payments
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    ride_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    method ENUM('cash','card') NOT NULL,
    status ENUM('pending','paid','failed') DEFAULT 'pending',
    FOREIGN KEY (ride_id) REFERENCES rides(ride_id) ON DELETE CASCADE
);

-- Ratings
CREATE TABLE ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    ride_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    FOREIGN KEY (ride_id) REFERENCES rides(ride_id) ON DELETE CASCADE
);

-- Insert Customers
INSERT INTO customers (full_name, email, phone) VALUES
('Alice Johnson', 'alice@example.com', '1234567890'),
('Bob Smith', 'bob@example.com', '9876543210'),
('Charlie Brown', 'charlie@example.com', '5551112233');

-- Insert Drivers
INSERT INTO drivers (full_name, driver_license_number, car_license_number, status) VALUES
('David Miller', 'DL-12345', 'CAR-111', 'available'),
('Emma Wilson', 'DL-67890', 'CAR-222', 'on_trip'),
('Frank Harris', 'DL-54321', 'CAR-333', 'available');

-- Insert Rides
INSERT INTO rides (customer_id, driver_id, pickup_location, dropoff_location, status, start_time, end_time) VALUES
(1, 1, 'Downtown', 'Airport', 'completed', '2025-08-25 14:30:00', '2025-08-25 15:10:00'),
(2, 2, 'City Center', 'Mall', 'accepted', '2025-08-25 16:00:00', NULL),
(3, 3, 'University', 'Train Station', 'requested', NULL, NULL);

-- Insert Payments
INSERT INTO payments (ride_id, amount, method, status) VALUES
(1, 35.50, 'card', 'paid'),
(2, 18.00, 'cash', 'pending'),
(3, 25.00, 'card', 'pending');

-- Insert Ratings
INSERT INTO ratings (ride_id, rating, comments) VALUES
(1, 5, 'Great ride, friendly driver!'),
(2, 4, 'Good service, but a bit late'),
(3, 3, 'Still waiting for ride to complete');

SELECT * FROM customers;
SELECT * FROM drivers;	
SELECT * FROM rides;
SELECT * FROM payments;
SELECT * FROM ratings;

-- Start the transaction
START TRANSACTION;

INSERT INTO rides (customer_id, driver_id, pickup_location, dropoff_location, status, start_time, end_time) VALUES
(2, 2, 'Downtown', 'Airport', 'completed', '2025-08-25 14:30:00', '2025-08-25 15:10:00');

rollback;
-- If everything is fine, commit the changes
COMMIT;