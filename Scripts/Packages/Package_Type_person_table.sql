Create or replace package control_type_person is
PROCEDURE insert_type_person (pdescription IN VARCHAR2);
PROCEDURE remove_type_person (pid_type_person IN NUMBER);
PROCEDURE update_type_person_description(pid_type_person IN NUMBER, pdescription IN VARCHAR2);
FUNCTION getTypePersonDescription(pId IN NUMBER) Return varchar2;
end control_type_person;
/
create or replace package body control_type_person is

PROCEDURE insert_type_person (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO type_person(description)
	VALUES(pdescription);
	COMMIT;
END insert_type_person;

PROCEDURE remove_type_person (pid_type_person IN NUMBER) AS
e_invalid_type_person EXCEPTION;
BEGIN
	DELETE FROM type_person
	WHERE id_type_person = pid_type_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_type_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_type_person THEN
        DBMS_OUTPUT.PUT_LINE('No such type of person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_type_person; 

PROCEDURE update_type_person_description(pid_type_person IN NUMBER, pdescription IN VARCHAR2) AS
e_invalid_type_person EXCEPTION;
BEGIN
	UPDATE type_person
	SET description = pdescription
	WHERE id_type_person = pid_type_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_type_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_type_person THEN
        DBMS_OUTPUT.PUT_LINE('No such type of person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_type_person_description;


FUNCTION getTypePersonDescription(pId IN NUMBER) RETURN VARCHAR2
IS vcTypePersonDescription VARCHAR2(50);
BEGIN
    SELECT description
    INTO vcTypePersonDescription
    FROM type_person
    WHERE id_type_person = pId;
    RETURN (vcTypePersonDescription);
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

end control_type_person;
