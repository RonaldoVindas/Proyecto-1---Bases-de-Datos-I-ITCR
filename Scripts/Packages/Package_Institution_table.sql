Create or replace package control_Institution is
PROCEDURE insert_institution_name( pname IN VARCHAR2);
PROCEDURE remove_institution (pid_institution IN NUMBER);
PROCEDURE update_institution_name(pid_institution IN NUMBER, pname IN VARCHAR2);
FUNCTION getInstitutionName(pid_institution IN NUMBER) RETURN VARCHAR2;
FUNCTION getInstitutionID(pDescription IN VARCHAR2) RETURN number;
end control_Institution;
/
CREATE OR REPLACE PACKAGE BODY control_Institution IS

PROCEDURE insert_institution_name( pname IN VARCHAR2) AS
BEGIN
    INSERT INTO institution(Institution_name)
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
	SET Institution_name = pname
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
IS vcInstitution VARCHAR2(50);
    BEGIN
        SELECT institution_name
        INTO vcInstitution
        FROM institution
        WHERE id_institution = pid_institution;
        RETURN (vcInstitution);
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
    
    
FUNCTION getInstitutionID(pDescription IN VARCHAR2) RETURN number
is vcInstitutionId number(4);
BEGIN
        SELECT id_Institution
        INTO vcInstitutionId
        FROM institution
        WHERE institution_name = pDescription;
        RETURN ( vcInstitutionId);
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
    END getInstitutionID;

end control_Institution;