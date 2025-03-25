# **_MySQL School Database_**

**_Overview_**  
This repository contains a comprehensive SQL script to set up a **Computer Science School Database** using MySQL. The script creates the database schema, including tables for **Employees**, **Departments**, **Programs**, **Students**, **Courses**, and more. It also includes sample data and a variety of query examples to illustrate common SQL operations.

---

## **_Database Schema_**

The database, named **ComputerScienceDB**, includes the following tables:

- **Employees**:  
  Stores employee details including personal information, salary, office location, and role.
- **Department**:  
  Contains information about academic departments, including department chair and secretary details.
- **Programs**:  
  Lists available academic programs.
- **Students**:  
  Contains student records with personal details.
- **StudentProgram**:  
  A junction table that associates students with their majors and minors.
- **Courses**:  
  Stores course information such as prerequisites and course credits.
- **CourseSection**:  
  Manages different sections of courses and links them to faculty.
- **Enrollment**:  
  Tracks student enrollments in courses along with their status and grades.
- **CheatingIncidents**:  
  Records incidents of academic dishonesty.

---

## **_Features_**

- **Comprehensive Schema**:  
  Robust design with multiple interrelated tables to simulate a realistic school database.
- **Data Integrity**:  
  Enforced through primary keys, unique constraints, foreign keys, and check constraints.
- **Sample Data**:  
  Preloaded sample records to facilitate testing and exploration of queries.
- **Query Examples**:  
  Demonstrates various SQL operations including simple SELECTs, JOINs, aggregations, updates, and deletions.

---

## **_How to Use This Script_**

### **Prerequisites**

- **MySQL Server**: Ensure that MySQL is installed and running.
- **MySQL Client**: Use a client such as the command line or MySQL Workbench.

### **Running the Script**

1. **Open your MySQL Client**  
   Launch your preferred MySQL client.

2. **Execute the Script**  
   Copy the contents of the `MySQLSchoolDatabase.sql` file and execute it in your MySQL client. This will:
   - Drop the existing **ComputerScienceDB** (if it exists).
   - Create a new **ComputerScienceDB** database.
   - Create all necessary tables with constraints.
   - Insert sample data and include query examples.

3. **Explore and Experiment**  
   Use the provided queries at the end of the script as a starting point for learning and experimentation.

---

## **_Query Examples Included_**

The SQL script demonstrates various query operations such as:
- **Simple SELECTs**: Retrieve records from individual tables.
- **Conditional Queries**: Filter records with conditions (e.g., salary, office location, birth dates).
- **JOIN Operations**: Combine data from related tables (e.g., linking departments with their chairpersons).
- **Aggregate Functions**: Using COUNT, MIN, MAX, and AVG to analyze data.
- **Data Modification**: UPDATE and DELETE operations based on conditions.

---

## **_Educational Purpose_**

This script is provided **for educational purposes only**. It serves as a practical example of designing and manipulating a relational database for a school system. Students and developers are encouraged to study, modify, and extend the script to deepen their understanding of SQL and database design.

---

## **_License_**

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.

---
