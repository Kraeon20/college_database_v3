# 🎓 College Database Management System (CollegeDBV1)

## 📘 Description
The **College Database Management System (CollegeDBV1)** is a MySQL-based relational database designed to support a college’s academic and administrative operations.  
It stores and organizes information about students, faculty, administrators, courses, rooms, semesters, and enrollment data — allowing for efficient management of people, schedules, and academic records.

This schema supports:
- Student enrollment and dormitory management  
- Faculty and administrative staff tracking  
- Course and section scheduling  
- Room assignments and building organization  
- Secure auditing and data integrity

---

## 📑 Table of Contents
1. [Description](#description)  
2. [Database Overview](#database-overview)  
3. [Tables and Descriptions](#tables-and-descriptions)    
4. [Authors](#authors)

---

## 🧩 Database Overview
**Schema Name:** `af25andrb1_CollegeDBV1`  
**Created Using:** MySQL Workbench
**Entities:** 12 Tables  
**Purpose:** A centralized database of a college and everything one might contain.

---

## 🧱 Tables and Descriptions

| Table Name | Description |
|-------------|-------------|
| **People** | Core table storing personal details (name, email, phone, address) for all individuals in the system (students, faculty, and admin). |
| **Admin** | Represents administrative users, each linked to a person record for identity management. |
| **Faculty** | Stores details about teaching staff, including office location and department assignment. |
| **Students** | Contains student-specific information such as dorm assignment, admission and graduation dates, and enrollment status. |
| **Courses** | Holds catalog information about courses offered by the college, including names and descriptions. |
| **Semester** | Defines academic terms (e.g., Fall 2025, Spring 2026) with type and year attributes. |
| **Course_Section** | Links courses, semesters, and faculty to represent individual course offerings. |
| **Enrollment** | Tracks which students are enrolled in specific course sections and records their final grades. |
| **Room** | Represents physical classroom spaces, including capacity and associated building. |
| **Room_Schedule** | Assigns course sections to specific rooms for scheduling purposes. |
| **Building** | Contains data about campus buildings and their abbreviations. |
| **Dorm_room** | Tracks dormitory rooms, occupancy status, and links to building information. |
| **emergency contact** | Stores emergency contact details linked to people (students or staff). |

---

## 👀Views

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

## 👩‍💻 Authors

<img src="andrews_pfp.jpg" alt="Profile Picture" width="100" />

👩‍🎓 **Andrew Bartsch**  
- **GitHub Profile**: [AndrewBartsch42](https://github.com/AndrewBartsch42)  
- **Email**: [anbart02@wsc.edu](mailto:anbart02@wsc.edu)  

---

<img src="rafaels_pfp.jpg" alt="Profile Picture" width="100" />

👨‍🎓 **Rafael Negrete Fonseca**  
- **GitHub Profile**: [rnegrete01](https://github.com/rnegrete01)  
- **Email**: [ranegr01@wsc.edu](mailto:ranegr01@wsc.edu)  
