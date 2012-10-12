
-- CRUD CLIENT
-- CREATE
SET ECHO OFF
SET SERVEROUTPUT ON

DECLARE
  v_num NUMBER;
BEGIN
 v_num := employee_management.create_employee('Karunakar', 'IT_PROG', 124,999,60, 'karunakar@test.com', '03-01-06');
DBMS_OUTPUT.PUT_LINE('v_emp_id: ' + v_num);
END;
--update
SET ECHO OFF
SET SERVEROUTPUT ON

DECLARE

V_MYVAR VARCHAR2(20);

BEGIN
 V_MYVAR:= employee_management.update_employee(207, 9420);

END;
 
--DELETE

SET ECHO OFF
SET SERVEROUTPUT ON


BEGIN
 employee_management.delete_employee(207);

END;

--READ


SET ECHO OFF
SET SERVEROUTPUT ON

DECLARE 
V_MYNAME VARCHAR2(20);
BEGIN
 V_MYNAME:= employee_management.read_employee(180);
 DBMS_OUTPUT.PUT_LINE( V_MYNAME);

END;
