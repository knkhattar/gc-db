/*
* This package is for basic CRUD operations on oracal's HR database.
*
* Also this package is to illustrate the use of procedures,
* functions, variables etc.
*
* */
CREATE OR REPLACE
PACKAGE employee_management
AS
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
  RETURN NUMBER;
  /*Delete employee procedure */
PROCEDURE delete_employee
  (
    employee_id NUMBER);
  /*
  * Find employee function.
  * */
FUNCTION read_employee
  (
    employee_id NUMBER )
  RETURN VARCHAR2;
  /*
  * Update employee function.
  * */
FUNCTION update_employee
  (
    employee_id NUMBER,
    salary      NUMBER )
  RETURN NUMBER;
END employee_management;