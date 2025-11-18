DELIMITER $$

CREATE FUNCTION dept_student_count(p_department_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*)
    INTO total
    FROM student s
    JOIN faculty f ON s.advisor_id = f.faculty_id
    WHERE f.department_id = p_department_id;

    RETURN total;
END $$

DELIMITER ;