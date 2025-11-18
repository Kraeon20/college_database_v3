DELIMITER $$

CREATE PROCEDURE add_new_student(
    IN p_first_name VARCHAR(255),
    IN p_last_name VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_date_of_birth DATE,
    IN p_gender VARCHAR(45),
    IN p_address VARCHAR(255),
    IN p_phone VARCHAR(50),
    IN p_gpa DECIMAL(3,2),
    IN p_advisor_id INT
)
BEGIN
    -- Insert into people
    INSERT INTO people (first_name, last_name, email, date_of_birth, gender, address, phone_number)
    VALUES (p_first_name, p_last_name, p_email, p_date_of_birth, p_gender, p_address, p_phone);

    -- Insert into student using the new people_id
    INSERT INTO student (people_id, cumulative_gpa, advisor_id)
    VALUES (LAST_INSERT_ID(), p_gpa, p_advisor_id);
END $$

DELIMITER ;