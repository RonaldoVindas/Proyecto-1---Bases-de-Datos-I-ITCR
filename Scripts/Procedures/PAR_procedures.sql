
CREATE PROCEDURE insert_parameter (pName IN VARCHAR2,pValue IN NUMBER) AS
BEGIN
	INSERT INTO parameter(name,value)
	VALUES(pName,pValue);
	COMMIT;
END insert_parameter;

/

CREATE PROCEDURE remove_parameter (pid_parameter IN NUMBER) AS
BEGIN
	DELETE FROM parameter
	WHERE id_parameter = pid_parameter;
	COMMIT;
END remove_parameter;

/

CREATE PROCEDURE update_parameter_name(pid_parameter IN NUMBER, pname IN VARCHAR2) AS
BEGIN
	UPDATE parameter
	SET name = pname
	WHERE id_parameter = pid_parameter;
	COMMIT;
END update_parameter_name;

/

CREATE PROCEDURE update_parameter_value(pid_parameter IN NUMBER, pValue IN VARCHAR2) AS
BEGIN
	UPDATE parameter
	SET value = pValue
	WHERE id_parameter = pid_parameter;
	COMMIT;
END update_parameter_value;
