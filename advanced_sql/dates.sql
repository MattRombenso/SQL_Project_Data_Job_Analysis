SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date,
    EXTRACT (DAY FROM job_posted_date) AS day,
    EXTRACT (MONTH FROM job_posted_date) AS month,
    EXTRACT (YEAR FROM job_posted_date) AS year
FROM
    job_postings_fact;


SELECT 
    COUNT(job_id) AS job_posted_count,
    EXTRACT (MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;



SELECT
    job_schedule_type,
    AVG(salary_year_avg)  AS avg_yearly_salary,
    AVG(salary_hour_avg)  AS avg_hourly_salary
FROM
    job_postings_fact
WHERE
    job_posted_date >= DATE '2023-06-01'
    AND 
    salary_year_avg IS NOT NULL
    OR
    salary_hour_avg IS NOT NULL
GROUP BY
    job_schedule_type
ORDER BY
    job_schedule_type;


SELECT
    COUNT(job_id) AS number_postings,
    EXTRACT (MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS month
FROM
    job_postings_fact
WHERE
    job_posted_date >= TIMESTAMP '2023-01-01 00:00:00'
    AND
    job_posted_date <= TIMESTAMP '2024-01-01 00:00:00'
GROUP BY
    month 
ORDER BY
    month;


SELECT 
    cd.name,
    jpf.job_title_short,
    jpf.job_posted_date
FROM   
    job_postings_fact AS jpf
JOIN
    company_dim AS cd
    ON
    jpf.company_id = cd.company_id
WHERE
    jpf.job_health_insurance = '1'
    AND
    job_posted_date >= DATE '2023-04-01'
    AND
    job_posted_date < DATE '2023-07-01'


SELECT DISTINCT
    cd.name
FROM   
    job_postings_fact AS jpf
JOIN
    company_dim AS cd
    ON
    jpf.company_id = cd.company_id
WHERE
    jpf.job_health_insurance = '1'
    AND 
    jpf.job_posted_date >= DATE_TRUNC('quarter', DATE '2023-04-01')
    AND
    jpf.job_posted_date <  DATE_TRUNC('quarter', DATE '2023-04-01') + INTERVAL '3 months';


SELECT DISTINCT
    cd.name
FROM   
    job_postings_fact AS jpf
JOIN
    company_dim AS cd
    ON
    jpf.company_id = cd.company_id
WHERE
    jpf.job_health_insurance = '1'
    AND 
    EXTRACT (MONTH FROM jpf.job_posted_date) BETWEEN 4 AND 6;



