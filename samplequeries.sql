--Start of Sample Queries
SELECT student_id, fname, lname, phone_num, email
FROM student
WHERE student_id IN (
    SELECT super_studentid
    FROM works_on
    WHERE pno = 16 AND term = 'Spring 2024');

SELECT s.fname || ' ' || s.lname AS student_name,
       e.name AS emergency_contact_name,
       e.phone AS emergency_contact_phone,
       e.email AS emergency_contact_email,
       e.relationship AS emergency_contact_relationship
FROM student s JOIN emergency_contacts e ON s.student_id = e.sstudent_id
WHERE s.fname = 'Santiago' AND s.lname = 'Quinn';

SELECT s.student_id, s.fname, s.lname, s.phone_num, s.email
FROM student s LEFT JOIN works_on w ON s.student_id = w.super_studentid
WHERE w.super_studentid is NULL;

SELECT feedback_text FROM feedback WHERE pnum = 9;

SELECT pnum, term, AVG(rating) AS average_rating
FROM feedback
GROUP BY pnum, term
ORDER BY average_rating DESC;