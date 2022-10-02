SELECT students.name as student_name, cohorts.name as cohort_name, cohorts.start_date as cohort_start_date, students.start_date as student_start_date
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date
ORDER BY cohort_start_date;

/**
An INNER JOIN will only return results where there is a match between the two tables.
An OUTER JOIN will do the same as an INNER JOIN but also returns unmatched rows in one or both tables. An OUTER JOIN can be LEFT, RIGHT, or FULL.
**/