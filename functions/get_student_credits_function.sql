DELIMITER $$
CREATE FUNCTION f_student_credits_taken(
    p_student_id INT -- giving student's ID to get the credits 
)
RETURNS VARCHAR(255)-- idk why I need this but it does return a varchar
DETERMINISTIC
BEGIN
DECLARE credits_taken INT DEFAULT 0; -- this will be the sum of credits and it's default is 0
    SELECT SUM(c.credits)
    INTO credits_taken -- store the sum of the credits 
    FROM enrollment e
    JOIN course_offering co
        ON e.course_offering_id = co.course_offering_id -- joining these tables on course_offering_id to access each other's data
    JOIN course c                     -- made my way to course from course offering table
        ON c.course_id = co.course_id
    WHERE e.student_id = p_student_id; -- I want this student's credits, not all.

    RETURN credits_taken; -- return credits
END$$
DELIMITER ;
