Create or replace package control_personxban is
PROCEDURE insert_personXban (pid_person IN NUMBER, pid_ban NUMBER);
PROCEDURE remove_personXban (pid_person IN NUMBER);
PROCEDURE update_personXban_id_person(pid_person IN NUMBER, pnewid_person NUMBER);
PROCEDURE update_personXban_id_ban(pid_ban IN NUMBER, pnewid_ban NUMBER);
FUNCTION getPersonXBanIdBan(pid_person IN NUMBER) RETURN NUMBER;
FUNCTION getPersonXBanIdPerson(pid_ban IN NUMBER) RETURN NUMBER;

end control_personXban;

/
CREATE OR REPLACE PACKAGE BODY control_personxban IS

PROCEDURE insert_personXban (pid_person IN NUMBER, pid_ban NUMBER)  AS
BEGIN
	INSERT INTO personXban(id_person, id_ban)
	VALUES(pid_person, pid_ban);
	COMMIT;
END insert_personXban;


PROCEDURE remove_personXban (pid_person IN NUMBER) AS
e_invalid_id_person EXCEPTION;
BEGIN
	DELETE FROM personXban
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_personXban;


PROCEDURE update_personXban_id_person(pid_person IN NUMBER, pnewid_person NUMBER) AS
e_invalid_id_person EXCEPTION;
BEGIN
	UPDATE personXban
	SET id_person = pnewid_person
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_personXban_id_person;

PROCEDURE update_personXban_id_ban(pid_ban IN NUMBER, pnewid_ban NUMBER) AS
e_invalid_id_ban EXCEPTION;
BEGIN
	UPDATE personXban
	SET id_ban = pnewid_ban
	WHERE id_ban = pid_ban;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_ban;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_ban THEN
        DBMS_OUTPUT.PUT_LINE('No such ban.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_personXban_id_ban;


FUNCTION getPersonXBanIdBan(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonXBanIdBan NUMBER(6);
    BEGIN 
        SELECT id_ban
        INTO vcPersonXBanIdBan
        FROM personxban
        WHERE id_person = pid_person;
        RETURN (vcPersonXBanIdBan);
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
    

FUNCTION getPersonXBanIdPerson(pid_ban IN NUMBER) RETURN NUMBER
IS
    vcPersonXBanIdPerson NUMBER(6);
    BEGIN 
        SELECT id_person
        INTO vcPersonXBanIdPerson
        FROM personxban
        WHERE id_ban = pid_ban;
        RETURN (vcPersonXBanIdPerson);
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
    
end control_personxban;
