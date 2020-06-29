CREATE OR REPLACE FUNCTION getParameterName(pId IN NUMBER) RETURN VARCHAR2
IS vcName VARCHAR2(20);
BEGIN
    SELECT name
    INTO vcName
    FROM parameter
    WHERE id_parameter = pId;
    RETURN (vcName);
    EXCEPTION
            WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
            WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pcnombre.');
            WHEN STORAGE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
            WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
END;
/
CREATE OR REPLACE FUNCTION getParameterValue(pId IN NUMBER) RETURN VARCHAR2
IS vcValue VARCHAR2(40);
BEGIN
    SELECT value
    INTO vcValue
    FROM parameter
    WHERE id_parameter = pId;
    RETURN (vcValue);
    EXCEPTION
            WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
            WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pcnombre.');
            WHEN STORAGE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
            WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
END;
