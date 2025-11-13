DELIMITER $$
CREATE FUNCTION get_advisor_by_student(
    p_student_id INT -- giving student's ID to get the advisor 
)
RETURNS VARCHAR(255)-- idk why I need this but it does return a varchar
DETERMINISTIC
BEGIN
DECLARE advisor_name VARCHAR(255); -- this will store the advisor's name 
    SELECT CONCAT(p.first_name, ' ', p.last_name) AS full_name -- concat so that we can see full name 
    INTO advisor_name -- store that name into this 
    FROM student s
    JOIN faculty f 
        ON s.advisor_id = f.faculty_id -- joining the tables was a bit painful. But I started from student
    JOIN people p                      -- made my way to faculty, then from faculty to people
        ON f.people_id = p.people_id
    WHERE s.student_id = p_student_id; -- filter to get the student's selected advisor where the student = student searched/

    RETURN advisor_name;
END$$
DELIMITER ;
