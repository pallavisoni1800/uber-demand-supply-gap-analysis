SELECT * FROM uber_project.uber_requests;

use uber_project;


# Requests by Pickup Point and Status
# How many requests were received from each pickup location?
SELECT pickup_point,
       status,
       COUNT(*) AS Total_Requests
FROM uber_requests
GROUP BY pickup_point, status;

# To determine the total number of requests from each pickup location
SELECT pickup_point,
       COUNT(*) AS Total_Requests
FROM uber_requests
GROUP BY pickup_point;


# Question: How many requests were completed and cancelled?
SELECT status,
       COUNT(*) AS Total_Requests
FROM uber_requests
GROUP BY status;


# Question: How many requests were received from City and Airport?
SELECT pickup_point,
       COUNT(*) AS Total_Requests
FROM uber_requests
GROUP BY pickup_point;


# Question: How many completed and cancelled requests came from each pickup location?
SELECT pickup_point,
       status,
       COUNT(*) AS Total_Requests
FROM uber_requests
GROUP BY pickup_point, status;

# Question: How many unique drivers are present in the dataset?
SELECT COUNT(DISTINCT driver_id) AS Total_Drivers
FROM uber_requests;

# Question: Which drivers handled the highest number of requests?
SELECT driver_id,
       COUNT(*) AS Total_Requests
FROM uber_requests
GROUP BY driver_id
ORDER BY Total_Requests DESC;

# Question: How many requests were handled by each driver?
SELECT driver_id,
       COUNT(*) AS Total_Requests
FROM uber_requests
GROUP BY driver_id;

# Question: How many requests came from each pickup point?
SELECT pickup_point,
       COUNT(*) AS Total_Requests
FROM uber_requests
GROUP BY pickup_point;

# Question: How many requests were cancelled from each pickup point?
SELECT pickup_point,
       COUNT(*) AS Cancelled_Requests
FROM uber_requests
WHERE status = 'Cancelled'
GROUP BY pickup_point;

# Question: How many completed trips came from each pickup point?
SELECT pickup_point,
       COUNT(*) AS Completed_Trips
FROM uber_requests
WHERE status = 'Trip Completed'
GROUP BY pickup_point;

# Question: What percentage of requests were cancelled?
SELECT
    ROUND(
        SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Cancellation_Percentage
FROM uber_requests;

# Question: How many requests were marked as "No Cars Available" from each pickup point?
SELECT pickup_point,
       COUNT(*) AS No_Cars_Available
FROM uber_requests
WHERE status = 'No Cars Available'
GROUP BY pickup_point;

# Question: What are all unique status values present in the dataset?
SELECT DISTINCT status
FROM uber_requests;
# Observation:
# Dataset contains only two status values:
# 1. Trip Completed
# 2. Cancelled

# Question: What is the cancellation rate by pickup point?
SELECT pickup_point,
       ROUND(
           SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0
           / COUNT(*),
           2
       ) AS Cancellation_Rate
FROM uber_requests
GROUP BY pickup_point;


# =========================================
# EDA (Exploratory Data Analysis) - Insights
# =========================================

# 1. Total requests received: 4095.

# 2. City generated more requests (2570) than Airport (1525).

# 3. Trip Completed was the most common status.

# 4. City completed 1504 trips while Airport completed 1327 trips.

# 5. City recorded 1066 cancellations whereas Airport recorded only 198 cancellations.

# 6. Overall cancellation percentage was 30.87%.

# 7. Airport cancellation rate was 12.98%.

# 8. City cancellation rate was 41.48%.

# 9. High cancellation rate in City indicates a possible demand-supply mismatch.

# 10. Uber should improve driver availability in City areas to reduce cancellations.
USE uber_project;
SELECT COUNT(*) AS Total_Rows
FROM uber_requests;

SELECT MIN(request_id), MAX(request_id)
FROM uber_requests;

SELECT COUNT(*) AS Total_Rows
FROM uber_project.uber_requests;

SELECT COUNT(*) FROM uber_requests;
SELECT COUNT(DISTINCT request_id)
FROM uber_requests;

SELECT COUNT(DISTINCT request_id) AS Distinct_Requests
FROM uber_requests;

SELECT COUNT(*) AS Total_Rows
FROM uber_requests;

SELECT MIN(request_id), MAX(request_id)
FROM uber_requests;