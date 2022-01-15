

/*  Inc 5000 companies Data Exploration Project */
														

-- Create Inc 5000 companies DB and import required data before running queries 
CREATE TABLE inc_companies (
    profile VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    state VARCHAR(50) NOT NULL,
    revenue DECIMAL(10 , 4 ) NULL,
    growth_percentage DECIMAL(10 , 2 ) NULL,
    industry VARCHAR(255) NOT NULL,
    workers INT NOT NULL,
    previous INT NOT NULL,
    founded INT NOT NULL,
    yrs_on_list INT NOT NULL,
    metro VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL
);

-- Average revenue for the companies classified according to industry 
SELECT 
    industry, AVG(revenue)
FROM
    project.`inc 5000 companies`
GROUP BY industry;


 
 -- The industries that were most and least represented in this list 
SELECT 
    industry, COUNT(industry) AS industry_count
FROM
    project.`inc 5000 companies`
GROUP BY industry
ORDER BY industry_count DESC;
 

 
 -- Determine the industries that saw and increase in revenue growth
SELECT 
    state, SUM(revenue) AS revenue
FROM
    project.`inc 5000 companies`
GROUP BY state
ORDER BY revenue;


 
-- Shows the number of current workers according to previous and newly hired workers --
SELECT 
    name,
    workers,
    previous_workers,
    (workers - previous_workers) AS current_workers
FROM
    project.`inc 5000 companies`
ORDER BY workers DESC;
 