DELIMITER $$
CREATE FUNCTION get_department_name_by_course(
p_course_title VARCHAR(255) -- giving course's title to get the department 
)
RETURNS VARCHAR(255) -- idk why I need this but it does return a varchar
DETERMINISTIC
BEGIN
DECLARE dep_name VARCHAR(255); -- this will store the department's name by 
    SELECT d.department_name
    INTO dep_name
    FROM course c
    JOIN department d ON c.department_id = d.department_id
    WHERE c.course_title = p_course_title;
    RETURN dep_name;
    
END$$
DELIMITER ;

    -- so this is how I can explain it. 
    -- you're selectinbg the department name from department and putting it into dep_name
    -- but in order to get it through a course, you need to join the tables by their common
    -- index which is the deparment ID. So you're basically creating a bridge in between the 
    -- tables. If you join them by deparment ID, each of the tables can access each other.
	-- The where clause is essentially a filter so that you ask for a specific department.
    -- So it's like "give me the department where this course is equal to user input"
    -- w/o it, you basically get multiple rows for one answer. 