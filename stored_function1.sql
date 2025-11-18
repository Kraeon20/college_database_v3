DELIMITER $$

CREATE FUNCTION get_full_name(p_people_id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE full_name VARCHAR(255);

    SELECT CONCAT(first_name, ' ', last_name)
    INTO full_name
    FROM people
    WHERE people_id = p_people_id;

    RETURN full_name;
END $$

DELIMITER ;