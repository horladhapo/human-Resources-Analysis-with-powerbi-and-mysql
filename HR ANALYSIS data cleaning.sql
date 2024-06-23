SELECT * FROM `human resource`;
DESCRIBE `HUMAN RESOURCE`;
DESCRIBE `HUMAN RESOURCE`;

ALTER TABLE `HUMAN RESOURCE`
RENAME COLUMN `ï»¿id` TO `EMPLOYEE_ID`;

ALTER TABLE `HUMAN RESOURCE`
MODIFY BIRTHDATE DATE;

-- STR_TO_DATE (STRING TO DATE) IS A FUNCTION USED TO CONVERT TEXT TO DATE
UPDATE `HUMAN RESOURCE`
SET `BIRTHDATE` = CASE WHEN `BIRTHDATE` LIKE "%/%/%" 
THEN str_to_date(BIRTHDATE,"%M/%D/%Y")
ELSE str_to_date(BIRTHDATE,"%M-%D-%Y") END;

SELECT
CASE WHEN `BIRTHDATE` LIKE "%/%/%" 
THEN str_to_date(BIRTHDATE,"%M/%D/%Y")
ELSE str_to_date(BIRTHDATE,"%M-%D-%Y") END AS T;

UPDATE `HUMAN RESOURCE`
SET BIRTHDATE = CASE WHEN BIRTHDATE LIKE "%/%/%" 
THEN date_format(str_to_date(BIRTHDATE,"%m/%d/%Y"), "%Y-%m-%d")
ELSE date_format(str_to_date(BIRTHDATE,"%m-%d-%Y"), "%Y-%m-%d") end;

UPDATE `HUMAN RESOURCE`
SET hire_date = CASE WHEN hire_date LIKE "%/%/%" 
THEN date_format(str_to_date(hire_date,"%m/%d/%Y"), "%Y-%m-%d")
ELSE date_format(str_to_date(hire_date,"%m-%d-%Y"), "%Y-%m-%d") end;

ALTER TABLE `HUMAN RESOURCE`
MODIFY hire_date DATE;

CREATE VIEW LOCATION AS
SELECT LOCATION, count(EMPLOYEE_ID)
FROM `HUMAN RESOURCE`
GROUP BY LOCATION;


-- show the age distribution of the employees

ALTER TABLE `HUMAN RESOURCE`
ADD COLUMN AGE INT;

ALTER TABLE `HUMAN RESOURCE`
drop COLUMN AGE;


SELECT Floor(DATEDIFF(CURDATE(), birthdate) / 365) AS age, COUNT(employee_id) AS number_of_employees
FROM `human resource`
GROUP BY floor(DATEDIFF(CURDATE(), birthdate) / 365)
ORDER BY age;


ALTER TABLE `HUMAN RESOURCE`
ADD COLUMN AGE INT;
update `human resource`
set Age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());



SELECT
    CONCAT(FLOOR(TIMESTAMPDIFF(YEAR,birthdate, CURDATE()) / 10) * 10, '-', FLOOR(TIMESTAMPDIFF(YEAR,birthdate, CURDATE()) / 10) * 10 + 9) AS age_range,
    COUNT(EMPLOYEE_ID) AS number_of_employees
FROM
    `human resource`
GROUP BY
    age_range
ORDER BY
    age_range;




