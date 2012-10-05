create or replace
PACKAGE HR_ORCL_PKG
IS
  --=======================================
  --Desc: This function returns the employee count for the particular department(provided as p_department_id parameter).
  --TestQuery:  SELECT hr_orcl_pkg.emp_count(90) FROM dual;
  --=======================================
FUNCTION emp_count
  (
    p_department_id IN NUMBER)
  RETURN NUMBER;
  --=======================================
  --Desc: This function returns the word count in the passed string.
  --TestQuery: SELECT hr_orcl_pkg.wordcount('The count should be 5') FROM dual;
  --=======================================
FUNCTION wordcount
  (
    str IN VARCHAR2)
  RETURN PLS_INTEGER;
  --=======================================
  --Desc: This function returns the word count in the passed string.
  --TestQuery: SELECT hr_orcl_pkg.wordcount('The count should be 5') FROM dual;
  --=======================================
PROCEDURE set_mydate
  (
    date_in IN DATE);
  --=======================================
  --Desc: This function returns the word count in the passed string.
  --TestQuery: SELECT hr_orcl_pkg.wordcount('The count should be 5') FROM dual;
  --=======================================
FUNCTION get_mydate  RETURN DATE;
  --=======================================
  --Create a function that takes department ID and returns the name of the manager of the department.
  --SELECT hr_orcl_pkg.get_dept_manager_name(3) FROM dual;
  --=======================================
FUNCTION get_dept_manager_name
  (
    p_department_id NUMBER)
  RETURN VARCHAR2;

  --=======================================
  -- Display missing employee ids
  -- get_missing_emp_ids
  --SELECT hr_orcl_pkg.get_dept_manager_name(3) FROM dual;
  --=======================================
  PROCEDURE display_missing_emp_ids;
  --====================== END OF THE PACKAGE ===============================================================
END HR_ORCL_PKG;


--=================================================================================================================================================================
create or replace PACKAGE BODY HR_ORCL_PKG
IS
  g_mydate DATE;
  --=======================================
  --Desc: This function returns the employee count for the particular department(provided as p_department_id parameter).
  --TestQuery:  SELECT hr_orcl_pkg.emp_count(90) FROM dual;
  --=======================================
FUNCTION emp_count
  (
    p_department_id IN NUMBER)
  RETURN NUMBER
                    IS
  V_COUNT NUMBER(2) := 0;
BEGIN
  SELECT COUNT(*)
  INTO V_COUNT
  FROM employees e
  WHERE e.department_id = p_department_id;
  RETURN (v_count);
END emp_count;
--=======================================
--Desc: This function returns the word count in the passed string.
--TestQuery: SELECT hr_orcl_pkg.wordcount('The count should be 5') FROM dual;
--=======================================
FUNCTION wordcount
  (
    str IN VARCHAR2)
  RETURN PLS_INTEGER
AS
  words PLS_INTEGER := 0;
  LEN PLS_INTEGER   := NVL(LENGTH(str),0);
  inside_a_word BOOLEAN;
BEGIN
  FOR i IN 1..len + 1
  LOOP
    IF ASCII(SUBSTR(str, i, 1)) < 33 OR i > LEN THEN
      IF inside_a_word THEN
        words         := words + 1;
        inside_a_word := FALSE;
      END IF;
    ELSE
      inside_a_word := TRUE;
    END IF;
  END LOOP;
  RETURN words;
END;
--=======================================
--Desc: This function returns the word count in the passed string.
--TestQuery: SELECT hr_orcl_pkg.wordcount('The count should be 5') FROM dual;
--=======================================
PROCEDURE set_mydate
  (
    date_in IN DATE)
            IS
BEGIN
  g_mydate := date_in;
END;
--=======================================
--Desc: This function returns the word count in the passed string.
--TestQuery: SELECT hr_orcl_pkg.wordcount('The count should be 5') FROM dual;
--=======================================
FUNCTION get_mydate
  RETURN DATE
IS
BEGIN
  RETURN g_mydate;
END;
--=======================================
--Desc: get_dept_manager_name
--TestQuery: SELECT hr_orcl_pkg.get_dept_manager_name(60) FROM dual;
--TestExceptionQuery : SELECT hr_orcl_pkg.get_dept_manager_name(600000) FROM dual;
--=======================================
FUNCTION get_dept_manager_name
  (
    p_department_id NUMBER)
  RETURN VARCHAR2
IS
  v_mgr_name VARCHAR2(30);
BEGIN
  SELECT EMPLOYEES.FIRST_NAME INTO v_mgr_name
  FROM EMPLOYEES EMPLOYEES,
    departments DEPARTMENTS
  WHERE EMPLOYEES.employee_id = DEPARTMENTS.manager_id AND DEPARTMENTS.department_id = p_department_id;
  
  EXCEPTION WHEN NO_DATA_FOUND
  THEN RETURN('NO DATA FOUND FOR THAT DEPARTMENT ID, PLEASE CHECK YOUR INPUT.');
  
  RETURN (v_mgr_name);
END ;

---====================================
PROCEDURE display_missing_emp_ids
IS
     v_min  number(3);
     v_max  number(3);
     v_c    number(1);
begin
     select min(employee_id), max(employee_id) into v_min, v_max
     from employees;


     for i in  v_min + 1 .. v_max - 1
     loop
           select count(*) into v_c
           from employees 
           where employee_id = i;
           
           if  v_c = 0 then
                dbms_output.put_line(i);
           end if;
    end loop;
     
end;
--====================== END OF THE PACKAGE ===============================================================
END HR_ORCL_PKG;