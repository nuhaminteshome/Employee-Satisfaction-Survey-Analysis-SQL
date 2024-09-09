# -- 1. Which three departments had the highest satisfaction scores, and which three had the lowest satisfaction scores?
SELECT * FROM hr_data.`employee attrition`;

SELECT 
	dept,
	round(AVG(satisfaction_level),3) AS avg_satisfaction
FROM hr_data.`employee attrition`
GROUP BY 1
ORDER BY 2 desc;

#-- 2. What is the relationship between salary and satisfaction score?
#Answer: employees with a higher salary had a higher satisfaction score
SELECT 
	distinct salary
FROM hr_data.`employee attrition`;

--- 'low', 'medium', 'high'
SELECT 
	salary,
    round(AVG(satisfaction_level),3) AS avg_satisfaction
FROM hr_data.`employee attrition`
GROUP BY salary
ORDER BY 2;


# -- 3. How did the top two and bottom two depts perform in the following arears
# top two : management and product_mng
# bottom two: hr and accounting

# -- a. last_evaluation

SELECT 
	Case
		when dept in ('management', 'product_mng') then 'top_dept' 
        when dept in ('hr', 'accounting') then 'bottom_dept'
	end as top_bot,
    ROUND(AVG(last_evaluation),3)AS avg_last_evaluation

FROM hr_data.`employee attrition`
WHERE dept in ('management', 'product_mng', 'hr', 'accounting')
GROUP BY 1;

# -- b. number_project
SELECT 
	Case
		when dept in ('management', 'product_mng') then 'top_dept' 
        when dept in ('hr', 'accounting') then 'bottom_dept'
	end as top_bot,
    ROUND(AVG(number_project),3)AS avg_number_project

FROM hr_data.`employee attrition`
WHERE dept in ('management', 'product_mng', 'hr', 'accounting')
GROUP BY 1;


# -- c. average_montly_hours

SELECT 
	Case
		when dept in ('management', 'product_mng') then 'top_dept' 
        when dept in ('hr', 'accounting') then 'bottom_dept'
	end as top_bot,
   AVG(average_montly_hours) AS hours_worked
FROM hr_data.`employee attrition`
WHERE dept in ('management', 'product_mng', 'hr', 'accounting')
GROUP BY 1;

# -- d. time_spend_company
SELECT 
	Case
		when dept in ('management', 'product_mng') then 'top_dept' 
        when dept in ('hr', 'accounting') then 'bottom_dept'
	end as top_bot,
   AVG(time_spend_company) AS time_at_company
FROM hr_data.`employee attrition`
WHERE dept in ('management', 'product_mng', 'hr', 'accounting')
GROUP BY 1;

