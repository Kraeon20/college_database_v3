
DELIMITER // 

CREATE or REPLACE PROCEDURE p_update_gpa( in p_student_id INT, in p_new_gpa varchar(20))
BEGIN 
	DECLARE validation_msg VARCHAR(255); 
	DECLARE v_current_gpa DECIMAL(3,2);
    DECLARE v_new_gpa DECIMAL(3,2);
    DECLARE v_avg_gpa DECIMAL(3,2);
    
    START TRANSACTION;
		SET validation_msg = f_validate_gpa(p_new_gpa);
        
        -- If validation failed, rollback and exit with and the error message the validation function returns
        IF validation_msg <> 'GPA is Good to Use!' THEN
            ROLLBACK;
                SELECT validation_msg as error_message;
        END IF;
        
        -- sets our gpa 
		SET v_new_gpa = CAST(p_new_gpa AS DECIMAL(3,1));
        
        -- gets the studnt's current cumulative gpa and store that value into v_current_gpa 
        SELECT cumulative_gpa
        INTO v_current_gpa
        FROM student
        WHERE student_id = p_student_id
        FOR UPDATE; -- locks the students gpa row so it cant be updated until i finish updating
				
	 IF v_current_gpa IS NULL THEN
				ROLLBACK;
				SELECT 'GPA not updated: student not found';
			END IF;

			--  new cumulative GPA by averaging ig we cant use agravate functions so no avg
			SET v_avg_gpa = ROUND((v_current_gpa + v_new_gpa) / 2, 2);
	
		IF validation_msg = 'GPA is Good to Use!' THEN
			UPDATE student
			SET cumulative_gpa = v_avg_gpa
			WHERE student_id = p_student_id;

			COMMIT;
		END IF; 
	END//
DELIMITER ;