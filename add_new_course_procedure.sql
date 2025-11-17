DROP PROCEDURE add_new_course -- if it exists, drop it 
DELIMITER $$

CREATE PROCEDURE add_new_course( -- recreate it
	p_course_code VARCHAR(255), -- parameters for new course
	p_course_title VARCHAR(255),  -- 'p' = procedure
	p_credits INT, 
	p_department_id INT
)
BEGIN

	-- invalid message that pops up if something is invalid
	DECLARE invalid_message VARCHAR(255);
    DECLARE exit HANDLER FOR SQLEXCEPTION -- declare and begin an exit handler for an sql exception
    BEGIN -- this is incase it blows up
        -- rollback and unlock tables if there is an error
        ROLLBACK;
        UNLOCK TABLES;
        SELECT 'A database error occurred. Insert canceled.' AS error_message;
    END;

   -- these are validation checks that check if parameters are empty
    IF p_course_code IS NULL OR p_course_code = '' THEN 
		SET invalid_message = 'Course code must be filled';
	ELSEIF p_course_title IS NULL OR p_course_title = '' THEN 
		SET invalid_message = 'Course title must be filled';
	ELSEIF p_credits IS NULL OR p_credits = '' THEN 
		SET invalid_message = 'Credits must be filled';
	ELSEIF p_department_id IS NULL OR p_department_id = '' THEN 
		SET invalid_message = 'Credits must be filled';
	END IF;
    
     -- if invalid message is not null, select the invalid error message
    IF invalid_message IS NOT NULL THEN
        SELECT invalid_message AS error_message;
    ELSE
        START TRANSACTION;

        -- Idk why we would need this but the example said it prevents people from writing onto the table simultaneously
        LOCK TABLES course WRITE;

        -- The actual insertion
        INSERT INTO course (course_code, course_title, credits, department_id)
        VALUES (p_course_code, p_course_title, p_credits, p_department_id);

        COMMIT;
		
        UNLOCK TABLES; -- unlock the tables after comitting so that you don't hog them.
		-- you don't want to hog them incase somebody needs to access it.

        SELECT 'Course successfully added!' AS success; -- success of success
    END IF;
END $$

DELIMITER ;
