DELIMITER $$

CREATE PROCEDURE delete_course(
	IN p_course_id INT, -- parameter to delete course
    OUT p_message VARCHAR (255) -- input output thing with validation
)
BEGIN
	-- counter that will validate if course already exists or doesn't
	DECLARE course_id_counter INT;
    
    -- Error message for validation. Just read the code.
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SET p_message = 'Error: An Error Occurred. Check Error Number.';
	END;
    
    SELECT COUNT(*) INTO course_id_counter -- increment the counter in course and find given p_course_code
    FROM course
    WHERE course_id = p_course_id;
    
    IF course_id_counter = 0 THEN
		SET p_message = 'Error: Course Does Not Exist.';
	ElSE
		-- go ahead and delete this course			    
		DELETE FROM course WHERE course_id = p_course_id;
        SET p_message = 'Course Deleted Successfully!';
	END IF;
END $$

DELIMITER ; 