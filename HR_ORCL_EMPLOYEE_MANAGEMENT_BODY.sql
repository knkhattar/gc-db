/*
* This package is for basic CRUD operations on oracal's HR database.
*
* Also this package is to illustrate the use of procedures,
* functions, variables etc.
*
* */

create or replace
PACKAGE BODY employee_management
IS
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
  RETURN NUMBER
IS
  v_newemployeeid NUMBER(6,0);
BEGIN
  SELECT MAX(EMPLOYEES.EMPLOYEE_ID)+1 INTO v_newemployeeid FROM employees;
  INSERT
  INTO EMPLOYEES
    (
      employee_id,
      last_name,
      job_id,
      manager_id,
      salary,
      department_id,
      email,
      hire_date
    )
    VALUES
    (
      v_newemployeeid,
      p_last_name,
      p_job_id,
      p_manager_id,
      p_salary,
      p_department_id,
      p_email,
      p_hire_date
    );
  COMMIT;
  RETURN v_newemployeeid;
END create_employee;
/*Delete employee procedure */
PROCEDURE delete_employee
  (
    p_employee_id NUMBER
  )
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE
  (
    'Before I show you v...'
  )
  ;
  DELETE FROM employees WHERE employee_id = p_employee_id;
END delete_employee;
/*
* Find employee function.
* */
FUNCTION read_employee
  (
    p_employee_id NUMBER )
  RETURN VARCHAR2
                                 IS
  v_employeename VARCHAR2 ( 20 ) := '';
BEGIN
  SELECT employees.first_name
  INTO v_employeename
  FROM employees
  WHERE employee_id = p_employee_id;
  
  RETURN v_employeename;
END;
/*
* Update employee function.
* */
FUNCTION update_employee
  (
    p_employee_id NUMBER,
    p_salary      NUMBER )
  RETURN VARCHAR2
IS
BEGIN
  UPDATE employees SET salary = p_salary WHERE employee_id = p_employee_id ;
  RETURN 'SUCCESS';
END;
END employee_management;
