CREATE OR REPLACE PACKAGE control_person IS
PROCEDURE insert_person (pid_person IN NUMBER,pfirst_name IN VARCHAR2, plast_name VARCHAR2, pbirth_day DATE,  pemail VARCHAR, pid_gender NUMBER, pid_institution NUMBER, pid_type_person NUMBER);
PROCEDURE insert_user (pid_person IN NUMBER,pfirst_name IN VARCHAR2, plast_name VARCHAR2, pbirth_day DATE, pemail VARCHAR2, puser_name VARCHAR2, ppassword VARCHAR2, 
                                        pid_gender NUMBER, pid_institution NUMBER, pid_binnacle NUMBER, pid_type_person NUMBER);
PROCEDURE remove_person(pid_person IN NUMBER);
PROCEDURE update_person_first_name(pid_person IN NUMBER, pfirst_name IN VARCHAR2);
PROCEDURE update_person_last_name(pid_person IN NUMBER, plast_name IN VARCHAR2);
PROCEDURE update_person_birth_day(pid_person IN NUMBER, pbirth_day IN DATE);
PROCEDURE update_person_email(pid_person IN NUMBER, pemail IN VARCHAR2);
PROCEDURE update_person_user_name(pid_person IN NUMBER, puser_name IN VARCHAR2);
PROCEDURE update_person_password(pid_person IN NUMBER, ppassword IN VARCHAR2);
PROCEDURE update_person_id_gender(pid_person IN NUMBER, pid_gender IN VARCHAR2);
PROCEDURE update_person_id_institution(pid_person IN NUMBER, pid_institution IN VARCHAR2);
PROCEDURE update_person_type_person(pid_person IN NUMBER, ptype IN NUMBER);
FUNCTION getPersonFirstName(pid_person IN NUMBER) RETURN VARCHAR2 ;
FUNCTION getPersonLastName(pid_person IN NUMBER) RETURN VARCHAR2;
FUNCTION getPersonBirthDay(pid_person IN NUMBER) RETURN DATE;
FUNCTION getPersonUsername(pid_person IN NUMBER) RETURN VARCHAR2;
FUNCTION getPersonPassword(pid_person IN NUMBER) RETURN VARCHAR2;
FUNCTION getPersonIdGender(pid_person IN NUMBER) RETURN NUMBER;
FUNCTION getPersonAge(pId IN NUMBER) RETURN NUMBER;
FUNCTION getPersonIdInstitution(pid_person IN NUMBER) RETURN NUMBER;
FUNCTION getPersonIdBinnacle(pid_person IN NUMBER) RETURN NUMBER;
FUNCTION getPersonIdTypePerson(pid_person IN NUMBER) RETURN NUMBER;




END control_person; 
/
CREATE OR REPLACE PACKAGE BODY control_person IS

PROCEDURE insert_person (pid_person IN NUMBER,pfirst_name IN VARCHAR2, plast_name VARCHAR2, pbirth_day DATE,  pemail VARCHAR, pid_gender NUMBER, pid_institution NUMBER, pid_type_person NUMBER)  AS

BEGIN 
	INSERT INTO person(id_person,first_name, last_name, birth_day, email, id_gender, id_institution, id_type_person)
	VALUES(pid_person,pfirst_name, plast_name, pbirth_day, pemail, pid_gender, pid_institution,pid_type_person);
	COMMIT;
END insert_person;

PROCEDURE insert_user (pid_person IN NUMBER,pfirst_name IN VARCHAR2, plast_name VARCHAR2, pbirth_day DATE, pemail VARCHAR2, puser_name VARCHAR2, ppassword VARCHAR2, 
                                        pid_gender NUMBER, pid_institution NUMBER, pid_binnacle NUMBER, pid_type_person NUMBER)  AS

BEGIN 
	INSERT INTO person(id_person,first_name, last_name, birth_day, email, user_name, password, id_gender, id_institution, id_user_password_binnacle, id_type_person)
	VALUES(pid_person,pfirst_name, plast_name, pbirth_day, pemail, puser_name, encryptpassword(ppassword), pid_gender, pid_institution,pid_binnacle,pid_type_person);
	COMMIT;
END insert_user;

PROCEDURE remove_person (pid_person IN NUMBER) AS
e_invalid_person EXCEPTION;
BEGIN
	DELETE FROM person
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_person;



PROCEDURE update_person_first_name(pid_person IN NUMBER, pfirst_name IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET first_name = pfirst_name
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_first_name;


PROCEDURE update_person_last_name(pid_person IN NUMBER, plast_name IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET last_name = plast_name
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_last_name;


PROCEDURE update_person_birth_day(pid_person IN NUMBER, pbirth_day IN DATE) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET birth_day = pbirth_day
    WHERE id_person = pid_person;
    COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_birth_day;


PROCEDURE update_person_email(pid_person IN NUMBER, pemail IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET email = pemail
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_email;


PROCEDURE update_person_user_name(pid_person IN NUMBER, puser_name IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET user_name = puser_name
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_user_name;


PROCEDURE update_person_type_person(pid_person IN NUMBER, ptype IN NUMBER)
as
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET id_type_person = ptype
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_type_person;


PROCEDURE update_person_password(pid_person IN NUMBER, ppassword IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET password = ppassword
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_password;


PROCEDURE update_person_id_gender(pid_person IN NUMBER, pid_gender IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET id_gender = pid_gender
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_id_gender;


PROCEDURE update_person_id_institution(pid_person IN NUMBER, pid_institution IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET id_institution = pid_institution
	WHERE id_gender = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_id_institution;



FUNCTION getPersonFirstName(pid_person IN NUMBER) RETURN VARCHAR2
IS 
    vcPersonFirstName VARCHAR2(20);
    BEGIN
        SELECT first_name
        INTO vcPersonFirstName
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonFirstName);
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


FUNCTION getPersonLastName(pid_person IN NUMBER) RETURN VARCHAR2
IS
    vcPersonLastName VARCHAR2(30);
    BEGIN
        SELECT last_name
        INTO vcPersonLastName
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonLastName);
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
    
FUNCTION getPersonBirthDay(pid_person IN NUMBER) RETURN DATE
IS 
    vcPersonBirthDay DATE;
    BEGIN
        SELECT birth_day
        INTO vcPersonBirthDay
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonBirthDay);
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
    
FUNCTION getPersonUsername(pid_person IN NUMBER) RETURN VARCHAR2
IS 
    vcPersonUsername VARCHAR2(50);
    BEGIN
        SELECT user_name
        INTO vcPersonUsername
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonUsername);
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

FUNCTION getPersonPassword(pid_person IN NUMBER) RETURN VARCHAR2
IS
    vcPersonPassword VARCHAR(50);
    BEGIN
        SELECT password
        INTO vcPersonPassword
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonPassword);
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
    
FUNCTION getPersonIdGender(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonIdGender NUMBER(6);
    BEGIN
        SELECT id_gender
        INTO vcPersonIdGender
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdGender);
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
    
FUNCTION getPersonAge(pId IN NUMBER) RETURN NUMBER
IS vcAge NUMBER(4);
BEGIN
    SELECT  Trunc((sysdate-birth_day)/365) 
    INTO vcAge
    FROM person 
    WHERE id_person = pId;
    RETURN (vcAge);
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

FUNCTION getPersonBirthDay(pId IN NUMBER) RETURN DATE
IS vcBirthday DATE;
BEGIN
    SELECT birth_day
    INTO vcBirthday
    FROM person
    WHERE id_person = pId;
    RETURN (vcBirthday);
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

FUNCTION getPersonIdInstitution(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonIdInstitution NUMBER(6);
    BEGIN
        SELECT id_institution
        INTO vcPersonIdInstitution
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdInstitution);
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
    
    
FUNCTION getPersonIdBinnacle(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonIdBinnacle NUMBER(8);
    BEGIN
        SELECT id_user_password_binnacle
        INTO vcPersonIdBinnacle
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdBinnacle);
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


FUNCTION getPersonIdTypePerson(pid_person IN NUMBER) RETURN NUMBER
IS 
    vcPersonIdTypePerson NUMBER(6);
    BEGIN
        SELECT id_type_person
        INTO vcPersonIdTypePerson
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdTypePerson);
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

END control_person;