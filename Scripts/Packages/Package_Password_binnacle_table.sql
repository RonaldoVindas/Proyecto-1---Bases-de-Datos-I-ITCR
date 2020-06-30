Create or replace package control_password_binnacle is
PROCEDURE insert_password_binnacle(p_new_password IN VARCHAR2);
PROCEDURE remove_password_binnacle (pid_password_binnacle IN NUMBER);
PROCEDURE update_password_binnacle (pid_password_binnacle IN NUMBER,pnew_password IN VARCHAR2);
FUNCTION getBinnacleOldPassword(pId IN NUMBER) return varchar2 ;

end control_password_binnacle;
/

create or replace package body control_password_binnacle is

PROCEDURE insert_password_binnacle(p_new_password IN VARCHAR2)AS
BEGIN
    INSERT INTO user_password_binnacle (new_password)
    VALUES(p_new_password);
    COMMIT;
END insert_password_binnacle;

PROCEDURE remove_password_binnacle (pid_password_binnacle IN NUMBER) AS
e_invalid_password EXCEPTION;
BEGIN
	DELETE FROM user_password_binnacle
	WHERE id_user_password_binnacle = pid_password_binnacle;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_password;
    END IF;
    EXCEPTION
    WHEN e_invalid_password THEN
        DBMS_OUTPUT.PUT_LINE('No such binnacle.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_password_binnacle;

PROCEDURE update_password_binnacle (pid_password_binnacle IN NUMBER,pnew_password IN VARCHAR2) AS
e_invalid_password EXCEPTION;
BEGIN
    UPDATE user_password_binnacle
    SET old_password = new_password
    WHERE id_user_password_binnacle = pid_password_binnacle;
    UPDATE user_password_binnacle
    SET new_password = pnew_password
    WHERE id_user_password_binnacle = pid_password_binnacle;
    COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_password;
    END IF;
    EXCEPTION
    WHEN e_invalid_password THEN
        DBMS_OUTPUT.PUT_LINE('No such binnacle.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_password_binnacle;

        
        
        
        
        
FUNCTION getBinnacleOldPassword(pId IN NUMBER) RETURN VARCHAR2
IS vcBinnacleOldPassword VARCHAR2(20);
BEGIN
    SELECT old_password
    INTO vcBinnacleOldPassword
    FROM user_password_binnacle
    WHERE id_user_password_binnacle = pId;
    RETURN (vcBinnacleOldPassword);
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


end control_password_binnacle;