Create or replace package control_Gender is
PROCEDURE insert_gender (pdescription IN VARCHAR2);
PROCEDURE remove_gender (pid_gender IN NUMBER);
PROCEDURE update_gender_description(pid_gender IN NUMBER, pdescription IN VARCHAR2);
FUNCTION getGenderDescription(pid_gender IN NUMBER) RETURN VARCHAR2;
FUNCTION get_gender_id(pdescription varchar2) return number;
end control_Gender;
/
CREATE OR REPLACE PACKAGE BODY control_Gender IS

PROCEDURE insert_gender (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO gender(description)
	VALUES(pdescription);
END insert_gender;

PROCEDURE remove_gender (pid_gender IN NUMBER) AS
e_invalid_gender EXCEPTION;
BEGIN
	DELETE FROM gender
	WHERE id_gender = pid_gender;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_gender;
    END IF;
    EXCEPTION
    WHEN e_invalid_gender THEN
        DBMS_OUTPUT.PUT_LINE('No such gender.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_gender;


PROCEDURE update_gender_description(pid_gender IN NUMBER, pdescription IN VARCHAR2) AS
e_invalid_gender EXCEPTION;
BEGIN
	UPDATE gender
	SET description = pdescription
	WHERE id_gender = pid_gender;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_gender;
    END IF;
    EXCEPTION
    WHEN e_invalid_gender THEN
        DBMS_OUTPUT.PUT_LINE('No such gender.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_gender_description;


FUNCTION getGenderDescription(pid_gender IN NUMBER) RETURN VARCHAR2
IS 
    vcGenderDescription VARCHAR2(50);
    BEGIN
        SELECT description
        INTO vcGenderDescription
        FROM gender
        WHERE id_gender = pid_gender;
        RETURN (vcGenderDescription);
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
    
    
    
    
FUNCTION get_gender_id(pdescription varchar2) return number

IS 
    vcGenderID VARCHAR2(50);
    BEGIN
        SELECT description
        INTO vcGenderID
        FROM gender
        WHERE description = pdescription;
        RETURN (vcGenderID);
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
end control_gender;