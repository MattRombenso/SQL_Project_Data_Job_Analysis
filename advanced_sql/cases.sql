SELECT
    job_title_short,
    job_location,
    CASE 
        WHEN job_location = 'Anywhere' THEN  'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE  'Onsite'
    END AS location_category
FROM
    job_postings_fact;


SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE 
        WHEN job_location = 'Anywhere' THEN  'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE  'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category; 


SELECT
    CASE 
        WHEN salary_year_avg BETWEEN 0 AND 60000 THEN  'Low'
        WHEN salary_year_avg BETWEEN 60001 AND 90000 THEN 'Medium'
        ELSE  'High'
    END AS salary_category,
    COUNT(*) AS number_of_jobs
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    salary_category
ORDER BY
    number_of_jobs DESC;


SELECT
    location_category,
    salary_category,
    COUNT(*) AS number_of_jobs
FROM (
    SELECT
        CASE 
            WHEN job_location = 'Anywhere' THEN 'Remote'
            WHEN job_location = 'New York, NY' THEN 'Local'
            ELSE 'Onsite'
        END AS location_category,
        CASE 
            WHEN salary_year_avg BETWEEN 0 AND 60000 THEN 'Low'
            WHEN salary_year_avg BETWEEN 60001 AND 90000 THEN 'Medium'
            ELSE 'High'
        END AS salary_category
    FROM
        job_postings_fact
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
) derived_table
GROUP BY
    location_category,
    salary_category
ORDER BY
    location_category,
    salary_category;


SELECT
    cd.name AS company_name,
    jpf.salary_year_avg,
    jpf.job_health_insurance
FROM
    job_postings_fact AS jpf
JOIN
    company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE
    jpf.job_title_short = 'Data Analyst'
    AND jpf.job_location = 'Anywhere'          
    AND jpf.salary_year_avg BETWEEN 60000 AND 90000
ORDER BY
    jpf.salary_year_avg DESC;