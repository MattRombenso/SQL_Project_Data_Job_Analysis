-- Jobs for Data Analyst posted on January
SELECT *
FROM (
    SELECT *
    FROM
        job_postings_fact
    WHERE 
        EXTRACT (MONTH FROM job_posted_date) = 1
        AND
        job_title_short = 'Data Analyst'
) AS january_jobs;


-- All jobs posted on January
WITH january_jobs AS (
    SELECT *
    FROM    
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1
)
SELECT *
FROM
    january_jobs;


-- Companies jobs that do not require degree
SELECT 
    company_id,
    name AS company_name
From 
    company_dim
WHERE company_id IN (
    SELECT
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = true
    ORDER BY
        company_id
);


-- Total count of job postings per Company
WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM 
    company_dim
LEFT JOIN 
    company_job_count 
    ON
    company_job_count.company_id = company_dim.company_id
ORDER BY    
    total_jobs DESC;


-- Top 5 skills mentioned in job postings
WITH top_skills AS (
    SELECT
        skill_id,
        COUNT(skill_id) AS skills_count
    FROM
        skills_job_dim
    GROUP BY
        skill_id
)

Select 
    skills_dim.skills AS job_skill,
    top_skills.skills_count
FROM 
    skills_dim
LEFT JOIN
    top_skills
    ON
    top_skills.skill_id = skills_dim.skill_id
ORDER BY
    skills_count DESC
LIMIT
    5;


-- Company size category based on total jobs posted
WITH count_jobs_posted AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT
    company_dim.name AS company_name,
    count_jobs_posted.total_jobs,
    CASE
        WHEN count_jobs_posted.total_jobs < 10 THEN  'small'
        WHEN count_jobs_posted.total_jobs BETWEEN 10 AND 50 THEN 'medium'
        ELSE  'large'
    END AS company_size_category
FROM
    count_jobs_posted
LEFT JOIN
    company_dim
    ON
    company_dim.company_id = count_jobs_posted.company_id
ORDER BY
    count_jobs_posted.total_jobs DESC;


-- Top 5 skills for remote jobs for Data Analyst
WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN
        job_postings_fact AS job_postings
        ON
        job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home = True
        AND
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
)

SELECT 
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM
    remote_job_skills
INNER JOIN
    skills_dim AS skills
    ON
    skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;


