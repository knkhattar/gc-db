/*
* This package is for basic CRUD operations on oracal's HR database.
*
* Also this package is to illustrate the use of procedures,
* functions, variables etc.
*
* */
CREATE OR REPLACE
PACKAGE BODY employee_management
IS
  /*
  * Create employee function.
  * */
FUNCTION create_employee
  (
    last_name      VARCHAR2,
    job_id         VARCHAR2,
    manager_id     NUMBER,
    salary         NUMBER,
    commission_pct NUMBER,
    department_id  NUMBER)
  RETURN NUMBER
IS
BEGIN
  NULL;
END hire;
/*Delete employee procedure */
PROCEDURE delete_employee
  (
    employee_id NUMBER)
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE ('Before I show you v...');
END remove_emp;
/*
* Find employee function.
* */
FUNCTION read_employee
  (
    employee_id NUMBER )
  RETURN VARCHAR2
IS
BEGIN
  NULL;
END;
/*
* Update employee function.
* */
FUNCTION update_employee
  (
    employee_id NUMBER,
    salary      NUMBER )
  RETURN NUMBER
IS
BEGIN
  NULL;
END;
END employee_management;