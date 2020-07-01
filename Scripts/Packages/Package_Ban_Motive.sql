Create or replace package control_Ban_Motive is
PROCEDURE insert_ban_motive(p_ban_motive_description IN VARCHAR2);
PROCEDURE remove_ban_motive(p_id_ban_motive IN NUMBER);
PROCEDURE update_ban_motive(p_ban_motive_description IN VARCHAR2,p_id_ban_motive IN NUMBER);
FUNCTION getBanMotiveDescription(pId IN NUMBER) return varchar2;
FUNCTION get_Motive_ID(pDescription varchar2) return number;
end control_Ban_Motive;
/
CREATE OR REPLACE PACKAGE BODY control_BAN_Motive IS

PROCEDURE insert_ban_motive(p_ban_motive_description IN VARCHAR2)AS
BEGIN
    INSERT INTO ban_motive(ban_motive_description)
    VALUES(p_ban_motive_description);
    COMMIT;
END insert_ban_motive;


PROCEDURE remove_ban_motive(p_id_ban_motive IN NUMBER)AS
e_invalid_ban_motive EXCEPTION;
BEGIN
    DELETE FROM ban_motive
    WHERE id_ban_motive = p_id_ban_motive;
    COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_ban_motive;
    END IF;
    EXCEPTION
    WHEN e_invalid_ban_motive THEN
        DBMS_OUTPUT.PUT_LINE('No such ban.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_ban_motive; 


PROCEDURE update_ban_motive(p_ban_motive_description IN VARCHAR2,p_id_ban_motive IN NUMBER)AS
e_invalid_ban_motive EXCEPTION;
BEGIN
    UPDATE ban_motive
    SET ban_motive_description = p_ban_motive_description
    WHERE id_ban_motive = p_id_ban_motive;
    COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_ban_motive;
    END IF;
    EXCEPTION
    WHEN e_invalid_ban_motive THEN
        DBMS_OUTPUT.PUT_LINE('No such ban.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_ban_motive;


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


FUNCTION get_Motive_ID(pDescription varchar2) RETURN number
IS vcMotiveID number(3);
BEGIN
    SELECT id_ban_motive
    INTO vcMotiveID
    FROM ban_motive
    WHERE ban_motive_description = pDescription;
    RETURN (vcMotiveID);
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

end control_Ban_Motive;