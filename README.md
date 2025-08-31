# RideNow
RideNow
A scalable ride-hailing platform with real-time dispatch, secure payments, and post-ride feedback.

Overview

RideNow is a mobile-first ride-hailing application designed to connect passengers and drivers in real time. The system implements end-to-end ride management, including booking, driver allocation, payment processing, and customer feedback. This repository contains the backend database schema, functional requirements, and representative workflows to support a production-grade deployment.

Key Features

User Management: Secure registration and authentication for passengers and drivers. Driver profiles require license verification.

Ride Booking and Dispatch: Passengers submit pickup and drop-off locations; the system assigns the nearest available driver.

Ride Lifecycle Management: Tracks requests from initiation through acceptance, completion, and potential cancellation.

Payment Processing: Supports cash and card transactions with encrypted data handling.

Feedback System: Enables passengers to rate drivers and provide optional comments after ride completion.

Technology Stack

Database: Relational SQL schema with referential integrity and normalization.

Integration: GPS API for accurate location tracking.

Security: Encrypted payment information and secure authentication.

Scalability: Architected to support up to 100,000 concurrent active users.

Database Schema

Core entities include:

Customers

Drivers

Rides

Payments

Ratings

The repository includes SQL DDL scripts for schema creation.

Non-Functional Requirements

Performance: Average response time under two seconds.

Reliability: Target system uptime of 99.5%.

Usability: Designed with an intuitive interface for both passengers and drivers.

Representative Use Cases

Request Ride: Passenger submits pickup/drop-off details; the system assigns a driver.

Accept Ride: Driver accepts or rejects the request; system updates ride status accordingly.

Complete Payment: Passenger finalizes payment (cash or card); transaction is logged.

Provide Feedback: Passenger submits a post-ride rating and optional comments.
