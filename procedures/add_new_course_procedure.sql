DELIMITER $$

CREATE PROCEDURE add_new_course(
	p_course_code VARCHAR(255), -- parameters for new course
	p_course_title VARCHAR(255),  -- 'p' = procedure
	p_credits INT, 
	p_department_id INT
)
BEGIN

	-- invalid message that pops up if something is invalid
	DECLARE invalid_message VARCHAR(255);
    
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
	
    -- if invalid message is null, proceed to create new course
    IF invalid_message IS NULL THEN
		INSERT INTO course (course_code, course_title, credits, department_id)
		VALUES (p_course_code, p_course_title, p_credits, p_department_id);
	ELSE 
		-- if it isn't null, error message. IDK
		SELECT invalid_message AS error_message;
	END IF;
END $$

DELIMITER ; 