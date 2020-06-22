CREATE OR REPLACE FUNCTION getParameterName(pId IN NUMBER) RETURN VARCHAR2
IS vcName VARCHAR2(20);
BEGIN
    SELECT name
    INTO vcName
    FROM parameter
    WHERE id_parameter = pId;
    RETURN (vcName);
END;
/
CREATE OR REPLACE FUNCTION getParameterValue(pId IN NUMBER) RETURN NUMBER
IS vcValue NUMBER(38);
BEGIN
    SELECT value
    INTO vcValue
    FROM parameter
    WHERE id_parameter = pId;
    RETURN (vcValue);
END;
