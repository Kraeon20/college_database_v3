USE af25willa1_college_db;

-- =====================================================
-- 1️⃣ People Summary
-- =====================================================
CREATE OR REPLACE VIEW people_summary AS
SELECT 
    people_id,
    first_name,
    last_name,
    email,
    gender,
    date_of_birth
FROM people;

-- =====================================================
-- 2️⃣ Faculty Summary
-- =====================================================
CREATE OR REPLACE VIEW faculty_summary AS
SELECT 
    f.faculty_id,
    p.first_name AS faculty_first_name,
    p.last_name AS faculty_last_name,
    d.department_name,
    f.office_location
FROM faculty f
JOIN people p ON f.people_id = p.people_id
JOIN department d ON f.department_id = d.department_id;

-- =====================================================
-- 3️⃣ Student Summary
-- =====================================================
CREATE OR REPLACE VIEW student_summary AS
SELECT 
    s.student_id,
    p.first_name AS student_first_name,
    p.last_name AS student_last_name,
    s.cumulative_gpa,
    f.faculty_id AS advisor_id,
    pf.first_name AS advisor_first_name,
    pf.last_name AS advisor_last_name
FROM student s
JOIN people p ON s.people_id = p.people_id
LEFT JOIN faculty f ON s.advisor_id = f.faculty_id
LEFT JOIN people pf ON f.people_id = pf.people_id;

-- =====================================================
-- 4️⃣ Staff Summary
-- =====================================================
CREATE OR REPLACE VIEW staff_summary AS
SELECT 
    st.staff_id,
    p.first_name AS staff_first_name,
    p.last_name AS staff_last_name,
    d.department_name,
    st.staffcol AS job_title
FROM staff st
JOIN people p ON st.people_id = p.people_id
JOIN department d ON st.department_id = d.department_id;

-- =====================================================
-- 5️⃣ Course Summary
-- =====================================================
CREATE OR REPLACE VIEW course_summary AS
SELECT 
    c.course_id,
    c.course_code,
    c.course_title,
    c.credits,
    d.department_name
FROM course c
JOIN department d ON c.department_id = d.department_id;

-- =====================================================
-- 6️⃣ Course Offering Summary
-- =====================================================
CREATE OR REPLACE VIEW course_offering_summary AS
SELECT 
    co.course_offering_id,
    c.course_code,
    c.course_title,
    s.semester_term,
    r.room_number,
    r.building,
    f.faculty_id,
    pf.first_name AS instructor_first_name,
    pf.last_name AS instructor_last_name
FROM course_offering co
JOIN course c ON co.course_id = c.course_id
JOIN semester s ON co.semester_id1 = s.semester_id
JOIN room r ON co.room_id1 = r.room_id
JOIN faculty f ON co.faculty_id = f.faculty_id
JOIN people pf ON f.people_id = pf.people_id;

-- =====================================================
-- 7️⃣ Enrollment Summary
-- =====================================================
CREATE OR REPLACE VIEW enrollment_summary AS
SELECT 
    e.enrollment_id,
    p.first_name AS student_first_name,
    p.last_name AS student_last_name,
    c.course_code,
    c.course_title,
    lg.grade_symbol,
    lg.letter_grade_col AS grade_description,
    s.semester_term,
    pf.first_name AS instructor_first_name,
    pf.last_name AS instructor_last_name
FROM enrollment e
JOIN student st ON e.student_id = st.student_id
JOIN people p ON st.people_id = p.people_id
JOIN course_offering co ON e.course_offering_id = co.course_offering_id
JOIN course c ON co.course_id = c.course_id
JOIN semester s ON co.semester_id1 = s.semester_id
JOIN faculty f ON co.faculty_id = f.faculty_id
JOIN people pf ON f.people_id = pf.people_id
JOIN letter_grade lg ON e.letter_grade_id = lg.letter_grade_id;