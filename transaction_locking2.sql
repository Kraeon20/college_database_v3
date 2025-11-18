DELIMITER $$

CREATE PROCEDURE update_faculty_assignment_locked(
    IN p_faculty_id INT,
    IN p_new_department_id INT
)
BEGIN
    START TRANSACTION;

    SELECT * FROM faculty 
    WHERE faculty_id = p_faculty_id
    FOR UPDATE;

    UPDATE faculty
    SET department_id = p_new_department_id
    WHERE faculty_id = p_faculty_id;

    COMMIT;
END $$

DELIMITER ;