DELIMITER $$

CREATE PROCEDURE delete_student(
    IN p_student_id INT
)
BEGIN
    DELETE FROM student 
    WHERE student_id = p_student_id;
END $$

DELIMITER ;