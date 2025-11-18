DELIMITER // 
CREATE OR REPLACE FUNCTION f_validate_gpa(input_gpa VARCHAR(4))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	IF input_gpa IS NULL THEN
		RETURN 'No GPA to Validate';
        
	ELSEIF input_gpa NOT REGEXP '^[0-9]+\\.[0-9]{1,2}$' THEN
        RETURN 'GPA must be a number with 1 or 2 decimal places (no letters allowed)';
    END IF;
    
	SET input_gpa := CAST(input_gpa AS DECIMAL(3,1));
        
	IF input_gpa  < 0.0 or input_gpa > 4.0 then
		RETURN 'A GPA cannot be less than a 0.0 or more than a 4.0';    
	
    END IF;
    RETURN 'GPA is Good to Use!';
END//

