/*
Questions: What are the top skills based on salary?

Let's analyse:
    - average salary associated with skill
    - avoid null values
*/


SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
    ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
    ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
    AND 
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 50;

/*
- Top-paying “Data Analyst” roles skew toward engineering: Skills like PySpark, Databricks, Airflow, Kubernetes, 
and cloud platforms dominate the highest salaries, showing that the best-paid analysts build and scale data systems, not just dashboards.

- Big data + cloud expertise is the main salary driver: Distributed computing (Spark, Hadoop), modern warehouses (Snowflake, BigQuery), 
and cloud platforms (AWS, GCP, Azure) consistently push roles into higher pay bands.

- Classic analyst tools are table stakes, not differentiators: Python, R, BI tools, and SQL cap around ~$100k; 
salary jumps come from automation, MLOps exposure, and production-level tooling (Git, CI/CD, Linux).
*/