
use hr;
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > 10000;


SELECT e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id
WHERE r.region_name = 'Americas';


SELECT DISTINCT d.department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
WHERE e.salary < 15000;

SELECT d.department_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Seattle'
ORDER BY d.department_name
LIMIT 3;

SELECT e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance'
ORDER BY e.salary DESC
LIMIT 1;