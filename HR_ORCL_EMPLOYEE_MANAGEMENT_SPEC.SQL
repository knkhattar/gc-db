/*
* This package is for basic CRUD operations on oracal's HR database.
*
* Also this package is to illustrate the use of procedures,
* functions, variables etc.
*
* */

create or replace
PACKAGE employee_management
AS
  /*
  * Create employee function.
  * */
FUNCTION create_employee
  (
    p_last_name     VARCHAR2,
    p_job_id        VARCHAR2,
    p_manager_id    NUMBER,
    p_salary        NUMBER,
    p_department_id NUMBER,
    p_email         VARCHAR2,
    p_hire_date     VARCHAR2)
  RETURN NUMBER;
  /*Delete employee procedure */
PROCEDURE delete_employee
  (
    p_employee_id NUMBER);
  /*
  * Find employee function.
  * */
FUNCTION read_employee
  (
    p_employee_id NUMBER )
  RETURN VARCHAR2;
  /*
  * Update employee function.
  * */
FUNCTION update_employee
  (
    p_employee_id NUMBER,
    p_salary      NUMBER ) RETURN VARCHAR2;
    
END employee_management;
