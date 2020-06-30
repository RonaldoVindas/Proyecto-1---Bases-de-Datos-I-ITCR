Create or replace package control_Ban is
PROCEDURE insert_ban(p_ban_time IN DATE,p_id_motive IN NUMBER);
PROCEDURE remove_ban(p_id_ban IN NUMBER);
PROCEDURE update_ban(p_ban_time IN DATE,p_id_ban IN NUMBER);
FUNCTION getBanMotiveDescription(pId IN NUMBER) RETURN VARCHAR2;
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

PROCEDURE update_ban(p_ban_time IN DATE,p_id_ban IN NUMBER)AS
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

FUNCTION getBanMotiveDescription(pId IN NUMBER) RETURN VARCHAR2
IS vcMotiveDescription VARCHAR2(20);
BEGIN
    SELECT ban_motive_description
    INTO vcMotiveDescription
    FROM ban_motive
    WHERE id_ban_motive = pId;
    RETURN (vcMotiveDescription);
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

end control_Ban;