DELIMITER $$

CREATE PROCEDURE enroll_student_locked(
    IN p_student_id INT,
    IN p_course_offering_id INT,
    IN p_letter_grade_id INT
)
BEGIN
    START TRANSACTION;

    -- Lock the enrollment table row for this student & offering
    SELECT * FROM enrollment
    WHERE student_id = p_student_id
      AND course_offering_id = p_course_offering_id
    FOR UPDATE;

    -- Insert enrollment
    INSERT INTO enrollment (letter_grade_id, student_id, course_offering_id)
    VALUES (p_letter_grade_id, p_student_id, p_course_offering_id);

    COMMIT;
END $$

DELIMITER ;