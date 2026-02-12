/*
Question: What are the main skills required for a Data Analyst?

Let's analyse:
    - skills required
    - top skills mentioned in jobs posted
    - compare skills for remote and on-site jobs
*/

-- Skills required for a Data Analyst remotely
WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim
        ON
        company_dim.company_id = job_postings_fact.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND
        job_location = 'Anywhere'
        AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 50
)

SELECT 
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN
    skills_job_dim
    ON
    top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
    ON
    skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

-- Skills required for a Data Analyst on-site
WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim
        ON
        company_dim.company_id = job_postings_fact.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND
        job_location != 'Anywhere'
        AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 50
)

SELECT 
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN
    skills_job_dim
    ON
    top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
    ON
    skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;


/*
Key Takeaways:
 - SQL + Python are non-negotiable for both remote and on-site roles.

Remote jobs also favor:
 - Tableau
 - Excel

On-site jobs also show more demand for:
 - SAS
 - R 
*/


/* Jason file for remote jobs
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "salary_year_avg": "170000.0",
    "company_name": "Robert Half",
    "skills": "java"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "salary_year_avg": "170000.0",
    "company_name": "Robert Half",
    "skills": "go"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "salary_year_avg": "170000.0",
    "company_name": "Robert Half",
    "skills": "excel"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "salary_year_avg": "170000.0",
    "company_name": "A-Line Staffing Solutions",
    "skills": "sql"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "salary_year_avg": "170000.0",
    "company_name": "A-Line Staffing Solutions",
    "skills": "python"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "salary_year_avg": "170000.0",
    "company_name": "A-Line Staffing Solutions",
    "skills": "azure"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "skills": "sql"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "skills": "python"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "skills": "azure"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "skills": "databricks"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "skills": "power bi"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "sql"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "r"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "swift"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "excel"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "tableau"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "matlab"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "pandas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Plexus Resource Solutions",
    "skills": "python"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Plexus Resource Solutions",
    "skills": "mysql"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Plexus Resource Solutions",
    "skills": "aws"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": "CEDARS-SINAI",
    "skills": "sas"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": "CEDARS-SINAI",
    "skills": "go"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": "CEDARS-SINAI",
    "skills": "crystal"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": "CEDARS-SINAI",
    "skills": "tableau"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": "CEDARS-SINAI",
    "skills": "sas"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "sql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "python"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "scala"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "r"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "mysql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "postgresql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "couchbase"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "azure"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "databricks"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "aws"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "redshift"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "oracle"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "snowflake"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "watson"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "pyspark"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "airflow"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "linux"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "tableau"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "ssis"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "cognos"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "visio"
  },
  {
    "job_id": 783771,
    "job_title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "salary_year_avg": "160000.0",
    "company_name": "Robert Half",
    "skills": "sql"
  },
  {
    "job_id": 783771,
    "job_title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "salary_year_avg": "160000.0",
    "company_name": "Robert Half",
    "skills": "java"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql server"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "azure"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "power bi"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "ssrs"
  },
  {
    "job_id": 475626,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Realtime Recruitment",
    "skills": "snowflake"
  },
  {
    "job_id": 475626,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Realtime Recruitment",
    "skills": "power bi"
  },
  {
    "job_id": 475626,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Realtime Recruitment",
    "skills": "looker"
  },
  {
    "job_id": 266799,
    "job_title": "Applied Scientist - Maps",
    "salary_year_avg": "157500.0",
    "company_name": "Uber",
    "skills": "sql"
  },
  {
    "job_id": 266799,
    "job_title": "Applied Scientist - Maps",
    "salary_year_avg": "157500.0",
    "company_name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 266799,
    "job_title": "Applied Scientist - Maps",
    "salary_year_avg": "157500.0",
    "company_name": "Uber",
    "skills": "r"
  },
  {
    "job_id": 266799,
    "job_title": "Applied Scientist - Maps",
    "salary_year_avg": "157500.0",
    "company_name": "Uber",
    "skills": "spark"
  },
  {
    "job_id": 485388,
    "job_title": "System Data Analyst",
    "salary_year_avg": "157500.0",
    "company_name": "Edgewater Federal Solutions, Inc.",
    "skills": "sql"
  },
  {
    "job_id": 485388,
    "job_title": "System Data Analyst",
    "salary_year_avg": "157500.0",
    "company_name": "Edgewater Federal Solutions, Inc.",
    "skills": "go"
  },
  {
    "job_id": 485388,
    "job_title": "System Data Analyst",
    "salary_year_avg": "157500.0",
    "company_name": "Edgewater Federal Solutions, Inc.",
    "skills": "oracle"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "sql"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "python"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "r"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "tableau"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "looker"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "datarobot"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "sql"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "python"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "scala"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "java"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "c++"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "redshift"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "snowflake"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "spark"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "airflow"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "hadoop"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "tableau"
  },
  {
    "job_id": 795614,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "sql"
  },
  {
    "job_id": 795614,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "hadoop"
  },
  {
    "job_id": 795614,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "excel"
  },
  {
    "job_id": 795614,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "tableau"
  },
  {
    "job_id": 795614,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "looker"
  },
  {
    "job_id": 565646,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "sql"
  },
  {
    "job_id": 565646,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "hadoop"
  },
  {
    "job_id": 565646,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "excel"
  },
  {
    "job_id": 565646,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "tableau"
  },
  {
    "job_id": 565646,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "looker"
  },
  {
    "job_id": 540057,
    "job_title": "Lead Data Analyst, Growth (Remote)",
    "salary_year_avg": "152500.0",
    "company_name": "Rocket Money",
    "skills": "sql"
  },
  {
    "job_id": 540057,
    "job_title": "Lead Data Analyst, Growth (Remote)",
    "salary_year_avg": "152500.0",
    "company_name": "Rocket Money",
    "skills": "looker"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "sql"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "r"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "go"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "databricks"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "tableau"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "alteryx"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "company_name": "Get It Recruit - Healthcare",
    "skills": "sql"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "company_name": "Get It Recruit - Healthcare",
    "skills": "python"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "company_name": "Get It Recruit - Healthcare",
    "skills": "r"
  },
  {
    "job_id": 73304,
    "job_title": "Mid-Level Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 73304,
    "job_title": "Mid-Level Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "excel"
  },
  {
    "job_id": 73304,
    "job_title": "Mid-Level Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "tableau"
  },
  {
    "job_id": 73304,
    "job_title": "Mid-Level Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sheets"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "nosql"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "vba"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "oracle"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "hadoop"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "excel"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "tableau"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "sql"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "python"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "nosql"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "r"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "sas"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "vba"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "db2"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "oracle"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "hadoop"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "excel"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "tableau"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "sas"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "microstrategy"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "spss"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "sql"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "python"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "sas"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "t-sql"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "snowflake"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "hadoop"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "excel"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "sas"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "ssis"
  },
  {
    "job_id": 1329162,
    "job_title": "Data Analyst - up to 160K+",
    "salary_year_avg": "145000.0",
    "company_name": "Hire With Jarvis",
    "skills": "sql"
  },
  {
    "job_id": 1329162,
    "job_title": "Data Analyst - up to 160K+",
    "salary_year_avg": "145000.0",
    "company_name": "Hire With Jarvis",
    "skills": "excel"
  },
  {
    "job_id": 1329162,
    "job_title": "Data Analyst - up to 160K+",
    "salary_year_avg": "145000.0",
    "company_name": "Hire With Jarvis",
    "skills": "tableau"
  },
  {
    "job_id": 1329162,
    "job_title": "Data Analyst - up to 160K+",
    "salary_year_avg": "145000.0",
    "company_name": "Hire With Jarvis",
    "skills": "power bi"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "python"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "java"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "r"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "javascript"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "c++"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "tableau"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "power bi"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "qlik"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "sql"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "python"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "golang"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "elasticsearch"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "aws"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "bigquery"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "gcp"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "pandas"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "scikit-learn"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "looker"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "kubernetes"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "sql"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "python"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "r"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "sas"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "excel"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "tableau"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "power bi"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "sas"
  },
  {
    "job_id": 149006,
    "job_title": "People Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Insight Global",
    "skills": "sql"
  },
  {
    "job_id": 149006,
    "job_title": "People Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Insight Global",
    "skills": "python"
  },
  {
    "job_id": 149006,
    "job_title": "People Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Insight Global",
    "skills": "oracle"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "sql"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "r"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "swift"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "excel"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "tableau"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "looker"
  },
  {
    "job_id": 208403,
    "job_title": "Data Manager",
    "salary_year_avg": "140000.0",
    "company_name": "Insight Global",
    "skills": "nosql"
  },
  {
    "job_id": 762220,
    "job_title": "Qlik/Power BI Data Analyst | $130K-$150K + ESOP |100% USA-Remote",
    "salary_year_avg": "140000.0",
    "company_name": "IT Pros",
    "skills": "bigquery"
  },
  {
    "job_id": 762220,
    "job_title": "Qlik/Power BI Data Analyst | $130K-$150K + ESOP |100% USA-Remote",
    "salary_year_avg": "140000.0",
    "company_name": "IT Pros",
    "skills": "power bi"
  },
  {
    "job_id": 762220,
    "job_title": "Qlik/Power BI Data Analyst | $130K-$150K + ESOP |100% USA-Remote",
    "salary_year_avg": "140000.0",
    "company_name": "IT Pros",
    "skills": "qlik"
  },
  {
    "job_id": 1049000,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Sisense",
    "skills": "sql"
  },
  {
    "job_id": 1049000,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Sisense",
    "skills": "python"
  },
  {
    "job_id": 1049000,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Sisense",
    "skills": "r"
  },
  {
    "job_id": 1049000,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Sisense",
    "skills": "snowflake"
  },
  {
    "job_id": 1300702,
    "job_title": "Data Analyst (Product Data Analyst)",
    "salary_year_avg": "139000.0",
    "company_name": "Revolut",
    "skills": "sql"
  },
  {
    "job_id": 1300702,
    "job_title": "Data Analyst (Product Data Analyst)",
    "salary_year_avg": "139000.0",
    "company_name": "Revolut",
    "skills": "python"
  },
  {
    "job_id": 1300702,
    "job_title": "Data Analyst (Product Data Analyst)",
    "salary_year_avg": "139000.0",
    "company_name": "Revolut",
    "skills": "scala"
  },
  {
    "job_id": 1300702,
    "job_title": "Data Analyst (Product Data Analyst)",
    "salary_year_avg": "139000.0",
    "company_name": "Revolut",
    "skills": "java"
  },
  {
    "job_id": 1300702,
    "job_title": "Data Analyst (Product Data Analyst)",
    "salary_year_avg": "139000.0",
    "company_name": "Revolut",
    "skills": "c++"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "sql"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "nosql"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "javascript"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "snowflake"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "hadoop"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "phoenix"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "tableau"
  },
  {
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "company_name": "Overmind",
    "skills": "sql"
  },
  {
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "company_name": "Overmind",
    "skills": "python"
  }
]
*/

/* Jason file for on-site jobs
[
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "salary_year_avg": "400000.0",
    "company_name": "ЛАНИТ",
    "skills": "oracle"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "salary_year_avg": "400000.0",
    "company_name": "ЛАНИТ",
    "skills": "kafka"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "salary_year_avg": "400000.0",
    "company_name": "ЛАНИТ",
    "skills": "linux"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "salary_year_avg": "400000.0",
    "company_name": "ЛАНИТ",
    "skills": "git"
  },
  {
    "job_id": 209315,
    "job_title": "Data base administrator",
    "salary_year_avg": "400000.0",
    "company_name": "ЛАНИТ",
    "skills": "svn"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "sql"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "python"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "r"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "sas"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "matlab"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "spark"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "airflow"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "excel"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "tableau"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "power bi"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "sas"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "python"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "r"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "vba"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "excel"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "tableau"
  },
  {
    "job_id": 641501,
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "salary_year_avg": "375000.0",
    "company_name": "Citigroup, Inc",
    "skills": "excel"
  },
  {
    "job_id": 641501,
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "salary_year_avg": "375000.0",
    "company_name": "Citigroup, Inc",
    "skills": "word"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "sql"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "python"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "sql"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "python"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "r"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "bigquery"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "snowflake"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "tableau"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "power bi"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "looker"
  },
  {
    "job_id": 894135,
    "job_title": "Research Scientist",
    "salary_year_avg": "285000.0",
    "company_name": "OpenAI",
    "skills": "github"
  },
  {
    "job_id": 285766,
    "job_title": "Partner Technology Manager, Data Analytics and AI",
    "salary_year_avg": "254000.0",
    "company_name": "Google",
    "skills": "gcp"
  },
  {
    "job_id": 144450,
    "job_title": "Data Analyst",
    "salary_year_avg": "240000.0",
    "company_name": "Anthropic",
    "skills": "sql"
  },
  {
    "job_id": 144450,
    "job_title": "Data Analyst",
    "salary_year_avg": "240000.0",
    "company_name": "Anthropic",
    "skills": "python"
  },
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "salary_year_avg": "240000.0",
    "company_name": "Coda Search│Staffing",
    "skills": "sql"
  },
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "salary_year_avg": "240000.0",
    "company_name": "Coda Search│Staffing",
    "skills": "python"
  },
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "salary_year_avg": "240000.0",
    "company_name": "Coda Search│Staffing",
    "skills": "pandas"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "salary_year_avg": "239777.5",
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "salary_year_avg": "239777.5",
    "company_name": "TikTok",
    "skills": "python"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "salary_year_avg": "239777.5",
    "company_name": "TikTok",
    "skills": "r"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "salary_year_avg": "239777.5",
    "company_name": "TikTok",
    "skills": "express"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "salary_year_avg": "239777.5",
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "salary_year_avg": "239777.5",
    "company_name": "TikTok",
    "skills": "python"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "salary_year_avg": "239777.5",
    "company_name": "TikTok",
    "skills": "r"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "salary_year_avg": "239777.5",
    "company_name": "TikTok",
    "skills": "express"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "company_name": "Asana",
    "skills": "sql"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "company_name": "Asana",
    "skills": "snowflake"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "company_name": "Asana",
    "skills": "asana"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "sql"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "python"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "nosql"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "scala"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "r"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "sas"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "oracle"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "spark"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "matplotlib"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "excel"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "tableau"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "power bi"
  },
  {
    "job_id": 437377,
    "job_title": "Principal, Data Analyst",
    "salary_year_avg": "234000.0",
    "company_name": "Walmart Global Tech",
    "skills": "sas"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "sql"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "r"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "sas"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "tableau"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "sas"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "qlik"
  },
  {
    "job_id": 204500,
    "job_title": "Reference Data Analyst",
    "salary_year_avg": "225000.0",
    "company_name": "Selby Jennings",
    "skills": "sql"
  },
  {
    "job_id": 204500,
    "job_title": "Reference Data Analyst",
    "salary_year_avg": "225000.0",
    "company_name": "Selby Jennings",
    "skills": "python"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "sql"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "db2"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "azure"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "aws"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "oracle"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "tableau"
  },
  {
    "job_id": 1092247,
    "job_title": "Director, Internal Audit, Data Analytics",
    "salary_year_avg": "225000.0",
    "company_name": "Options Clearing Corporation",
    "skills": "alteryx"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "python"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "r"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "pandas"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "jupyter"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "matplotlib"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "plotly"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "ggplot2"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "dplyr"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "seaborn"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "excel"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "power bi"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "dax"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "alteryx"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "git"
  },
  {
    "job_id": 1145894,
    "job_title": "E-commerce Data Analyst",
    "salary_year_avg": "224500.0",
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 1145894,
    "job_title": "E-commerce Data Analyst",
    "salary_year_avg": "224500.0",
    "company_name": "TikTok",
    "skills": "tableau"
  },
  {
    "job_id": 544491,
    "job_title": "Data Analyst Manager, TikTok-US-Data Security",
    "salary_year_avg": "222500.0",
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 544491,
    "job_title": "Data Analyst Manager, TikTok-US-Data Security",
    "salary_year_avg": "222500.0",
    "company_name": "TikTok",
    "skills": "python"
  },
  {
    "job_id": 544491,
    "job_title": "Data Analyst Manager, TikTok-US-Data Security",
    "salary_year_avg": "222500.0",
    "company_name": "TikTok",
    "skills": "r"
  },
  {
    "job_id": 200616,
    "job_title": "TikTok Shop - Data Analyst",
    "salary_year_avg": "222093.5",
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 200616,
    "job_title": "TikTok Shop - Data Analyst",
    "salary_year_avg": "222093.5",
    "company_name": "TikTok",
    "skills": "python"
  },
  {
    "job_id": 200616,
    "job_title": "TikTok Shop - Data Analyst",
    "salary_year_avg": "222093.5",
    "company_name": "TikTok",
    "skills": "r"
  },
  {
    "job_id": 200616,
    "job_title": "TikTok Shop - Data Analyst",
    "salary_year_avg": "222093.5",
    "company_name": "TikTok",
    "skills": "tableau"
  },
  {
    "job_id": 4635,
    "job_title": "Research Scientist / Research Engineer (Greater NYC Area, NY)",
    "salary_year_avg": "220000.0",
    "company_name": "MosaicML",
    "skills": "go"
  },
  {
    "job_id": 4635,
    "job_title": "Research Scientist / Research Engineer (Greater NYC Area, NY)",
    "salary_year_avg": "220000.0",
    "company_name": "MosaicML",
    "skills": "pytorch"
  },
  {
    "job_id": 1493775,
    "job_title": "Staff Consultant - Data Analyst - Springfield, VA location",
    "salary_year_avg": "218500.0",
    "company_name": "Ball",
    "skills": "python"
  },
  {
    "job_id": 1493775,
    "job_title": "Staff Consultant - Data Analyst - Springfield, VA location",
    "salary_year_avg": "218500.0",
    "company_name": "Ball",
    "skills": "r"
  },
  {
    "job_id": 1493775,
    "job_title": "Staff Consultant - Data Analyst - Springfield, VA location",
    "salary_year_avg": "218500.0",
    "company_name": "Ball",
    "skills": "go"
  },
  {
    "job_id": 1493775,
    "job_title": "Staff Consultant - Data Analyst - Springfield, VA location",
    "salary_year_avg": "218500.0",
    "company_name": "Ball",
    "skills": "matlab"
  },
  {
    "job_id": 908145,
    "job_title": "Staff Consultant - Data Analyst --- Springfield, VA location",
    "salary_year_avg": "218500.0",
    "company_name": "Ball",
    "skills": "python"
  },
  {
    "job_id": 908145,
    "job_title": "Staff Consultant - Data Analyst --- Springfield, VA location",
    "salary_year_avg": "218500.0",
    "company_name": "Ball",
    "skills": "r"
  },
  {
    "job_id": 908145,
    "job_title": "Staff Consultant - Data Analyst --- Springfield, VA location",
    "salary_year_avg": "218500.0",
    "company_name": "Ball",
    "skills": "go"
  },
  {
    "job_id": 908145,
    "job_title": "Staff Consultant - Data Analyst --- Springfield, VA location",
    "salary_year_avg": "218500.0",
    "company_name": "Ball",
    "skills": "matlab"
  },
  {
    "job_id": 314402,
    "job_title": "Lead Data Analyst LIVE - USDS",
    "salary_year_avg": "217550.0",
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 314402,
    "job_title": "Lead Data Analyst LIVE - USDS",
    "salary_year_avg": "217550.0",
    "company_name": "TikTok",
    "skills": "python"
  },
  {
    "job_id": 314402,
    "job_title": "Lead Data Analyst LIVE - USDS",
    "salary_year_avg": "217550.0",
    "company_name": "TikTok",
    "skills": "express"
  },
  {
    "job_id": 686872,
    "job_title": "88-50100161 Statistical Scientist",
    "salary_year_avg": "215642.5",
    "company_name": "F. Hoffmann-La Roche AG",
    "skills": "r"
  },
  {
    "job_id": 375513,
    "job_title": "Product Manager-Data, TikTok E-commerce",
    "salary_year_avg": "215500.0",
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 375513,
    "job_title": "Product Manager-Data, TikTok E-commerce",
    "salary_year_avg": "215500.0",
    "company_name": "TikTok",
    "skills": "flow"
  },
  {
    "job_id": 597627,
    "job_title": "Senior Research and Data Analyst",
    "salary_year_avg": "213000.0",
    "company_name": "Guidehouse",
    "skills": "sql"
  },
  {
    "job_id": 597627,
    "job_title": "Senior Research and Data Analyst",
    "salary_year_avg": "213000.0",
    "company_name": "Guidehouse",
    "skills": "python"
  },
  {
    "job_id": 597627,
    "job_title": "Senior Research and Data Analyst",
    "salary_year_avg": "213000.0",
    "company_name": "Guidehouse",
    "skills": "r"
  },
  {
    "job_id": 597627,
    "job_title": "Senior Research and Data Analyst",
    "salary_year_avg": "213000.0",
    "company_name": "Guidehouse",
    "skills": "tableau"
  },
  {
    "job_id": 1644870,
    "job_title": "Data Analyst-SME",
    "salary_year_avg": "210267.0",
    "company_name": "Noblis",
    "skills": "python"
  },
  {
    "job_id": 1644870,
    "job_title": "Data Analyst-SME",
    "salary_year_avg": "210267.0",
    "company_name": "Noblis",
    "skills": "aws"
  },
  {
    "job_id": 1644870,
    "job_title": "Data Analyst-SME",
    "salary_year_avg": "210267.0",
    "company_name": "Noblis",
    "skills": "git"
  },
  {
    "job_id": 112060,
    "job_title": "Business Intelligence Data Analyst - Global Monetization Product ...",
    "salary_year_avg": "208500.0",
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 112060,
    "job_title": "Business Intelligence Data Analyst - Global Monetization Product ...",
    "salary_year_avg": "208500.0",
    "company_name": "TikTok",
    "skills": "python"
  },
  {
    "job_id": 112060,
    "job_title": "Business Intelligence Data Analyst - Global Monetization Product ...",
    "salary_year_avg": "208500.0",
    "company_name": "TikTok",
    "skills": "tableau"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "python"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "nosql"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "mongodb"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "mysql"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "postgresql"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "mongodb"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "cassandra"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "spark"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "pandas"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "hadoop"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "kafka"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "express"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "tableau"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "power bi"
  },
  {
    "job_id": 36333,
    "job_title": "Data Analytics- USDS",
    "salary_year_avg": "204584.5",
    "company_name": "TikTok",
    "skills": "flow"
  },
  {
    "job_id": 925491,
    "job_title": "Data Analyst-SME",
    "salary_year_avg": "204000.0",
    "company_name": "Noblis",
    "skills": "python"
  },
  {
    "job_id": 925491,
    "job_title": "Data Analyst-SME",
    "salary_year_avg": "204000.0",
    "company_name": "Noblis",
    "skills": "aws"
  },
  {
    "job_id": 925491,
    "job_title": "Data Analyst-SME",
    "salary_year_avg": "204000.0",
    "company_name": "Noblis",
    "skills": "git"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "sql"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "python"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "scala"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "r"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "spark"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "tableau"
  },
  {
    "job_id": 239588,
    "job_title": "Senior, Data Analyst",
    "salary_year_avg": "202000.0",
    "company_name": "Walmart Global Tech",
    "skills": "power bi"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Intuit Inc",
    "skills": "sql"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Intuit Inc",
    "skills": "python"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Intuit Inc",
    "skills": "nosql"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Intuit Inc",
    "skills": "r"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Intuit Inc",
    "skills": "excel"
  },
  {
    "job_id": 374039,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Intuit Inc",
    "skills": "tableau"
  },
  {
    "job_id": 958605,
    "job_title": "Staff Analytics Engineer, Guest Data",
    "salary_year_avg": "200000.0",
    "company_name": "Airbnb",
    "skills": "sql"
  },
  {
    "job_id": 958605,
    "job_title": "Staff Analytics Engineer, Guest Data",
    "salary_year_avg": "200000.0",
    "company_name": "Airbnb",
    "skills": "python"
  },
  {
    "job_id": 958605,
    "job_title": "Staff Analytics Engineer, Guest Data",
    "salary_year_avg": "200000.0",
    "company_name": "Airbnb",
    "skills": "scala"
  },
  {
    "job_id": 958605,
    "job_title": "Staff Analytics Engineer, Guest Data",
    "salary_year_avg": "200000.0",
    "company_name": "Airbnb",
    "skills": "spark"
  },
  {
    "job_id": 958605,
    "job_title": "Staff Analytics Engineer, Guest Data",
    "salary_year_avg": "200000.0",
    "company_name": "Airbnb",
    "skills": "airflow"
  },
  {
    "job_id": 958605,
    "job_title": "Staff Analytics Engineer, Guest Data",
    "salary_year_avg": "200000.0",
    "company_name": "Airbnb",
    "skills": "tableau"
  },
  {
    "job_id": 539110,
    "job_title": "Data Analytics Lead",
    "salary_year_avg": "200000.0",
    "company_name": "Snakorpio Group Inc.",
    "skills": "sql"
  },
  {
    "job_id": 539110,
    "job_title": "Data Analytics Lead",
    "salary_year_avg": "200000.0",
    "company_name": "Snakorpio Group Inc.",
    "skills": "python"
  },
  {
    "job_id": 539110,
    "job_title": "Data Analytics Lead",
    "salary_year_avg": "200000.0",
    "company_name": "Snakorpio Group Inc.",
    "skills": "java"
  },
  {
    "job_id": 539110,
    "job_title": "Data Analytics Lead",
    "salary_year_avg": "200000.0",
    "company_name": "Snakorpio Group Inc.",
    "skills": "azure"
  },
  {
    "job_id": 539110,
    "job_title": "Data Analytics Lead",
    "salary_year_avg": "200000.0",
    "company_name": "Snakorpio Group Inc.",
    "skills": "aws"
  },
  {
    "job_id": 539110,
    "job_title": "Data Analytics Lead",
    "salary_year_avg": "200000.0",
    "company_name": "Snakorpio Group Inc.",
    "skills": "snowflake"
  },
  {
    "job_id": 539110,
    "job_title": "Data Analytics Lead",
    "salary_year_avg": "200000.0",
    "company_name": "Snakorpio Group Inc.",
    "skills": "tableau"
  },
  {
    "job_id": 1281297,
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "company_name": "Upstart",
    "skills": "python"
  },
  {
    "job_id": 1281297,
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "company_name": "Upstart",
    "skills": "r"
  },
  {
    "job_id": 1281297,
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "company_name": "Upstart",
    "skills": "sas"
  },
  {
    "job_id": 1281297,
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "company_name": "Upstart",
    "skills": "vba"
  },
  {
    "job_id": 1281297,
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "company_name": "Upstart",
    "skills": "databricks"
  },
  {
    "job_id": 1281297,
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "company_name": "Upstart",
    "skills": "redshift"
  },
  {
    "job_id": 1281297,
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "company_name": "Upstart",
    "skills": "snowflake"
  },
  {
    "job_id": 1281297,
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "company_name": "Upstart",
    "skills": "excel"
  },
  {
    "job_id": 1281297,
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "company_name": "Upstart",
    "skills": "tableau"
  },
  {
    "job_id": 1281297,
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "company_name": "Upstart",
    "skills": "looker"
  },
  {
    "job_id": 1281297,
    "job_title": "Staff Data Analyst, Credit Analytics",
    "salary_year_avg": "200000.0",
    "company_name": "Upstart",
    "skills": "sas"
  },
  {
    "job_id": 1803208,
    "job_title": "Research Engineer - Credit Insight",
    "salary_year_avg": "200000.0",
    "company_name": "Trusting Social",
    "skills": "sql"
  },
  {
    "job_id": 107183,
    "job_title": "Research Engineer (f/m/div.)",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 1202839,
    "job_title": "Technology Research Engineer for Power Semiconductors (f/m/div.)",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 1202839,
    "job_title": "Technology Research Engineer for Power Semiconductors (f/m/div.)",
    "salary_year_avg": "200000.0",
    "company_name": "Bosch Group",
    "skills": "github"
  },
  {
    "job_id": 1426728,
    "job_title": "Research Engineer (partial work abroad)",
    "salary_year_avg": "200000.0",
    "company_name": "WINGS-ICT-SOLUTIONS",
    "skills": "python"
  },
  {
    "job_id": 1426728,
    "job_title": "Research Engineer (partial work abroad)",
    "salary_year_avg": "200000.0",
    "company_name": "WINGS-ICT-SOLUTIONS",
    "skills": "java"
  },
  {
    "job_id": 59895,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Intuit Inc",
    "skills": "sql"
  },
  {
    "job_id": 59895,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Intuit Inc",
    "skills": "python"
  },
  {
    "job_id": 59895,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Intuit Inc",
    "skills": "r"
  },
  {
    "job_id": 59895,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Intuit Inc",
    "skills": "excel"
  },
  {
    "job_id": 59895,
    "job_title": "Staff Business Data Analyst",
    "salary_year_avg": "200000.0",
    "company_name": "Intuit Inc",
    "skills": "tableau"
  },
  {
    "job_id": 21632,
    "job_title": "Research Engineer - Physics (H/F)",
    "salary_year_avg": "200000.0",
    "company_name": "Withings",
    "skills": "python"
  },
  {
    "job_id": 21632,
    "job_title": "Research Engineer - Physics (H/F)",
    "salary_year_avg": "200000.0",
    "company_name": "Withings",
    "skills": "c"
  }
]
*/