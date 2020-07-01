Create or replace package control_Ban is
PROCEDURE insert_ban(p_ban_time IN DATE,p_id_motive IN NUMBER);
PROCEDURE remove_ban(p_id_ban IN NUMBER);
PROCEDURE update_ban_End(p_ban_time IN DATE,p_id_ban IN NUMBER);
PROCEDURE updpate_ban_id_motive(pid_motive in number, pid_ban number);
FUNCTION getBanEnds(pId IN NUMBER) RETURN VARCHAR2;
FUNCTION getBanIdMotive(pId in number) return number;
END control_Ban;
/
CREATE OR REPLACE PACKAGE BODY control_BAN IS

PROCEDURE remove_ban(p_id_ban IN NUMBER)AS
e_invalid_ban EXCEPTION;
BEGIN
    DELETE FROM ban
    WHERE id_ban = p_id_ban;
    COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_ban;
    END IF;
    EXCEPTION
    WHEN e_invalid_ban THEN
        DBMS_OUTPUT.PUT_LINE('No such ban.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_ban;


PROCEDURE insert_ban(p_ban_time IN DATE,p_id_motive IN NUMBER)AS
BEGIN
    INSERT INTO ban (ban_time,id_motive)
    VALUES(p_ban_time,p_id_motive);
    COMMIT;
END insert_ban;

PROCEDURE update_ban_End(p_ban_time IN DATE,p_id_ban IN NUMBER)AS
e_invalid_ban EXCEPTION;
BEGIN
    UPDATE ban
    SET ban_time = p_ban_time
    WHERE id_ban = p_id_ban;
    COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_ban;
    END IF;
    EXCEPTION
    WHEN e_invalid_ban THEN
        DBMS_OUTPUT.PUT_LINE('No such ban.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_ban;

FUNCTION getBanEnds(pId IN NUMBER) RETURN Date
IS vcBanTime VARCHAR2(20);
BEGIN
    SELECT ban_time
    INTO vcBanTime
    FROM ban_motive
    WHERE id_ban = pId;
    RETURN (vcBanTime);
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


FUNCTION getBanIdMotive(pId IN NUMBER) RETURN Date
IS vcBanIdMotive Number;
BEGIN
    SELECT Id_motive
    INTO vcBanIdMotive
    FROM ban_motive
    WHERE id_ban = pId;
    RETURN (vcBanTime);
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


PROCEDURE update_ban_id_motive(pidMotive in number,p_id_ban IN NUMBER)AS
e_invalid_ban EXCEPTION;
BEGIN
    UPDATE ban
    SET id_motive = pidMotive
    WHERE id_ban = p_id_ban;
    COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_ban;
    END IF;
    EXCEPTION
    WHEN e_invalid_ban THEN
        DBMS_OUTPUT.PUT_LINE('No such ban.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_ban_id_motive;

end control_Ban;