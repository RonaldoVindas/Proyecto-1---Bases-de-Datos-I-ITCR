Create or replace package control_Institution is
PROCEDURE insert_institution_name( pname IN VARCHAR2);
PROCEDURE remove_institution (pid_institution IN NUMBER);
PROCEDURE update_institution_name(pid_institution IN NUMBER, pname IN VARCHAR2);
FUNCTION getInstitutionName(pid_institution IN NUMBER) RETURN VARCHAR2;
end control_Institution;
/
CREATE OR REPLACE PACKAGE BODY control_Institution IS

PROCEDURE insert_institution_name( pname IN VARCHAR2) AS
BEGIN
    INSERT INTO institution(name)
	VALUES(pname);
	COMMIT;
END insert_institution_name;

PROCEDURE remove_institution (pid_institution IN NUMBER) AS
e_invalid_institution EXCEPTION;
BEGIN
	DELETE FROM institution
	WHERE id_institution = pid_institution;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_institution;
    END IF;
    EXCEPTION
    WHEN e_invalid_institution THEN
        DBMS_OUTPUT.PUT_LINE('No such institution.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_institution;

PROCEDURE update_institution_name(pid_institution IN NUMBER, pname IN VARCHAR2) AS
e_invalid_institution EXCEPTION;
BEGIN
	UPDATE institution
	SET name = pname
	WHERE id_institution = pid_institution;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_institution;
    END IF;
    EXCEPTION
    WHEN e_invalid_institution THEN
        DBMS_OUTPUT.PUT_LINE('No such institution.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_institution_name;


FUNCTION getInstitutionName(pid_institution IN NUMBER) RETURN VARCHAR2
IS 
    vcInstitutionName VARCHAR2(50);
    BEGIN
        SELECT name
        INTO vcInstitutionName
        FROM institution
        WHERE id_institution = pid_institution;
        RETURN (vcInstitutionName);
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
    END getInstitutionName;
    
end control_Institution;