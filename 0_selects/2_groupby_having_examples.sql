/**
If we want to calculate the total number of assignment_submissions for all students, the count aggregate function is perfect.
**/
SELECT count(assignment_submissions.*) as total_submissions
FROM assignment_submissions;

/**
But what if we wanted to calculate the total number of assignment_submissions for each student individually, and output the totals next to the student's name?
We want to apply the count() function to groups of data, rather than the entire query. The groups in this case are the names of students. We want to apply the count() function for each students.name.

We will start by selecting the student's name from the students table, and the total submissions from the assignment_submissions table.

We need to tell SQL that we want count(assignment_submissions.*) to be run for each students.name, instead of the entire query. To do this, we use the GROUP BY clause.
**/
SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name;

/**
Now that we know how to get the total submissions for currently enrolled students, let's refine the query a bit more. Let's only return currently enrolled students who's total submissions are less than 100
The HAVING clause is evaluated before the SELECT so we can't use the alias total_submissions alias that is created in the SELECT
**/

SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100;