
CREATE OR REPLACE PROCEDURE insert_parameter (pName IN VARCHAR2,pValue IN VARCHAR2) AS
BEGIN
	INSERT INTO parameter(name,value)
	VALUES(pName,pValue);
	COMMIT;
END insert_parameter;

/

CREATE OR REPLACE PROCEDURE remove_parameter (pid_parameter IN NUMBER) AS
e_invalid_id_parameter EXCEPTION;
BEGIN
	DELETE FROM parameter
	WHERE id_parameter = pid_parameter;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_parameter;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_parameter THEN
        DBMS_OUTPUT.PUT_LINE('No such parameter.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_parameter;

/

CREATE OR REPLACE PROCEDURE update_parameter_name(pid_parameter IN NUMBER, pname IN VARCHAR2) AS
e_invalid_id_parameter EXCEPTION;
BEGIN
	UPDATE parameter
	SET name = pname
	WHERE id_parameter = pid_parameter;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_parameter;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_parameter THEN
        DBMS_OUTPUT.PUT_LINE('No such parameter.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_parameter_name;

/

CREATE OR REPLACE PROCEDURE update_parameter_value(pid_parameter IN NUMBER, pValue IN VARCHAR2) AS
e_invalid_id_parameter EXCEPTION;
BEGIN
	UPDATE parameter
	SET value = pValue
	WHERE id_parameter = pid_parameter;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_parameter;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_parameter THEN
        DBMS_OUTPUT.PUT_LINE('No such parameter.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_parameter_value;
