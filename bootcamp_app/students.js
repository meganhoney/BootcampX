const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
SELECT students.id as student_id, students.name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
// Store all potentially malicious values in an array.
const values = [`%${cohortName}%`, limit];
/*
pool.query is a function that accepts an SQL query as a JavaScript string. Using the ` (backtick), we can write a multi line string like this to make our SQL look nicer. The function then returns a promise that contains our result when the query is successful.
*/
pool.query(queryString, values)
.then(res => {
  // The result (res) is an array of javascript objects
  // console.log(res);
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));