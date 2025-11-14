# College_Database_V3
![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![Status](https://img.shields.io/badge/Version-2.1-success)
![Workbench](https://img.shields.io/badge/Workbench-Compatible-orange)


## What is This Database?
The **#College_Database_V3** is a MySQL-based relational database designed to support a basic college’s academic and administrative operations.
It stores and organizes information about students, faculty, administrators, courses, rooms, semesters, and enrollment data — allowing for efficient management of people, schedules, and academic records. 


The database is designed to track:

- General people records  
- Student, faculty, and staff details  
- Academic departments  
- Courses and semester offerings  
- Enrollment and student grades  
- Rooms and scheduling  

---

## Table of Contents
1. [Description](#what-is-this-database?)
2. [EER Diagram](#eer-diagram)
3. [Tables and Descriptions](#tables-and-descriptions)
4. [Views](#views)
5. [Stored Procedures](#stored-procedures)
6. [Stored Functions](#stored-functions)
7. [Locking Transactions](#locking-transactions)
8. [Authors](#authors)

---
## EER Diagram 

<img width="543" height="373" alt="image" src="https://github.com/user-attachments/assets/6aed9a3b-4f54-4bab-85b3-31a59a2422af" />

---


## Tables and Descriptions

| Table Name | Purpose / Description |
|------------|------------------------|
| **[people](#1-people)** | Table storing general personal information for every individual in the system. |
| **[student](#2-student)** | Extends `people` with student-specific details such as GPA and advisor. |
| **[faculty](#3-faculty)** | Extends `people` to store faculty information including department and office location. |
| **[staff](#4-staff)** | Extends `people` to represent non-faculty employees (administrative & support staff). |
| **[department](#5-department)** | Stores academic departments such as "Computer Science" or "Mathematics". |
| **[course](#6-course)** | Contains general information about courses (title, code, credit hours). |
| **[course_offering](#7-course_offering)** | Represents a specific instance of a course taught during a semester, including room and faculty. |
| **[semester](#8-semester)** | Stores semester terms (e.g., Fall 2025). |
| **[room](#9-room)** | Contains room and building information for scheduling classes. |
| **[enrollment](#10-enrollment)** | Records which students are enrolled in which course offerings, including grades. |
| **[letter_grade](#11-letter_grade)** | Defines the grading scale (A, B+, etc.) with min/max score thresholds. |


---
##  Database Tables

Below is a summary of all tables and their columns.

---

### **1. `people`**
Stores general personal information.

| Column         | Description        |
|----------------|--------------------|
| people_id      | Primary identifier |
| first_name     | First name         |
| last_name      | Last name          |
| email          | Email address      |
| date_of_birth  | Date of birth      |
| gender         | Gender             |
| address        | Home address       |
| phone_number   | Contact number     |

---

### **2. `student`**
Extends base `people` information for students.

| Column         | Description              |
|----------------|--------------------------|
| student_id     | Student identifier       |
| people_id      | FK → people              |
| cumulative_gpa | Overall GPA              |
| advisor_id     | FK → faculty             |

---

### **3. `faculty`**

| Column          | Description            |
|-----------------|------------------------|
| faculty_id      | Faculty identifier     |
| people_id       | FK → people            |
| department_id   | FK → department        |
| office_location | Office location        |

---

### **4. `staff`**

| Column        | Description           |
|---------------|-----------------------|
| staff_id      | Staff identifier      |
| people_id     | FK → people           |
| department_id | FK → department       |
| staffcol      | Additional attribute  |

---

### **5. `department`**

| Column         | Description |
|----------------|-------------|
| department_id  | Identifier  |
| department_name| Name        |

---

### **6. `course`**

| Column       | Description      |
|--------------|------------------|
| course_id    | Identifier       |
| course_code  | Code (e.g., CS101) |
| course_title | Title            |
| credits      | Credit hours     |

---

### **7. `course_offering`**

| Column             | Description              |
|--------------------|--------------------------|
| course_offering_id | Identifier               |
| course_id          | FK → course              |
| semester_id        | FK → semester            |
| room_id            | FK → room                |
| faculty_id         | FK → faculty             |
| schedule           | Meeting days/times       |

---

### **8. `semester`**

| Column       | Description         |
|--------------|---------------------|
| semester_id  | Identifier          |
| semester_term| e.g., Fall 2025     |

---

### **9. `room`**

| Column       | Description        |
|--------------|--------------------|
| room_id      | Identifier         |
| room_number  | Room number        |
| building     | Building name      |
| capacity     | Seating capacity   |

---

### **10. `enrollment`**

| Column             | Description            |
|--------------------|------------------------|
| enrollment_id      | Identifier             |
| enrollment_date    | Date enrolled          |
| enrollment_modified| Last modification date |
| letter_grade_id    | FK → letter_grade      |
| student_id         | FK → student           |
| course_offering_id | FK → course_offering   |

---

### **11. `letter_grade`**

| Column          | Description          |
|-----------------|----------------------|
| letter_grade_id | Identifier           |
| grade           | e.g., A, B+          |
| min_score       | Minimum percentage   |
| max_score       | Maximum percentage   |

---


## Views 

| View Name | Description |
|-------------|-------------|
| **Course Catalog** | Shows the courses and the associated data with each section. |
| **Emergency Contacts** | Shows the currently enrolled students emergency contact information. |
| **Faculty Offices** | Shows the faculty name and office location. |
| **Grade Book** | Shows the current grades for students and which class that grade was given. |
| **Course Section Location** | Shows the courses and Location. |
| **Faculty Courses** | Shows the Course section with the faculties office information. |
| **Student Dorms** | Shows the students and where their dorm room is. |
| **Students Enrolled** | Shows the students and the courses they are enrolled in if they haven't graduated. |

---

## Stored Procedures
| Stored Procedure | What It Does | Who Did It |
|------------------|--------------|------------|
| **Add a new student** | Adds a new student and their basic info into the system. | William |
| **Delete a student** | Removes a student and any related data. | William |
| **Get courses by department** | Shows all courses that belong to a specific department. | Steven |
| **Update a student's GPA** | Updates or fixes a student’s GPA. | Steven |
| **Add a new course** | Creates a new course in the system. | Rafael |
| **Delete a course** | Deletes a course and anything tied to it. | Rafael |

--- 

## Stored Functions
| Stored Function | What It Returns | Who Did It |
|-----------------|-----------------|------------|
| **Get full name of a person** | Combines first and last name into one value. | William |
| **Calculate total students in a department** | Returns how many students belong to a department. | William |
| **Get course offering per semester** | Shows which courses are offered in a given term/semester. | Steven |
| **Return GPA label** | Converts GPA into labels like “High Honors”, “Honors”, “Satisfactory”, etc. | Steven |
| **Get department name by course** | Returns which department a course belongs to. | Rafael |
| **Get grade value** | Converts letter grades into numeric values (A = 4.0). | Rafael |

---

 ## Locking Transactions
| Locking Transaction | What It Does | Who Did It |
|----------------------|--------------|------------|
| **Enroll a student with a lock** | Enrolls a student safely without conflicts or double-enrolling. | William |
| **Update faculty assignment** | Changes which faculty member teaches a course offering. | William |
| **Transfer a student to another advisor** | Moves a student from one advisor to another. | Steven |
| **Adjust a course's credits** | Updates the credit hours for a course. | Steven |
| **Update a room's capacity** | Changes the max capacity of a classroom. | Rafael |
| **Delete a department and its courses** | Deletes a department and all related courses safely. | Rafael |

---

## Developers

 **Williams Asante**  
- **GitHub Profile**: [Kraeon20](https://github.com/Kraeon20)  
- **Email**: [wiasan01@wsc.edu](mailto:wiasan01@wsc.edu)  


**Rafael Negrete Fonseca**  
- **GitHub Profile**: [rnegrete01](https://github.com/rnegrete01)  
- **Email**: [ranegr01@wsc.edu](mailto:ranegr01@wsc.edu)  


 **Steven Cain**  
- **GitHub Profile**: [Stevencain3](https://github.com/Stevencain3)  
- **Email**: [stcain01@wsc.edu](mailto:stcain01@wsc.edu)  

