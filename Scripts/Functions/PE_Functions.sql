CREATE OR REPLACE FUNCTION getBanTime(pId IN NUMBER) RETURN DATE
IS vcTime DATE;
BEGIN
    SELECT ban_time
    INTO vcTime
    FROM ban
    WHERE id_ban = pId;
    RETURN (vcTime);
END;
/
CREATE OR REPLACE FUNCTION getIdMotive(pId IN NUMBER) RETURN NUMBER
IS vcIdMotive NUMBER(4);
BEGIN
    SELECT id_motive
    INTO vcIdMotive
    FROM ban
    WHERE id_ban = pId;
    RETURN (vcIdMotive);
END;
/
CREATE OR REPLACE FUNCTION getBanMotiveDescription(pId IN NUMBER) RETURN VARCHAR2
IS vcMotiveDescription VARCHAR2(20);
BEGIN
    SELECT ban_motive_description
    INTO vcMotiveDescription
    FROM ban_motive
    WHERE id_ban_motive = pId;
    RETURN (vcMotiveDescription);
END;
/
CREATE OR REPLACE FUNCTION getGenderDescription(pId IN NUMBER) RETURN VARCHAR2
IS vcGender VARCHAR2(50);
BEGIN
    SELECT description
    INTO vcGender
    FROM gender
    WHERE id_gender = pId;
    RETURN (vcGender);
END;
/
CREATE OR REPLACE FUNCTION getInstitution(pId IN NUMBER) RETURN VARCHAR2
IS vcInstitution VARCHAR2(50);
BEGIN
    SELECT name
    INTO vcInstitution
    FROM institution
    WHERE id_institution = pId;
    RETURN (vcInstitution);
END;
/
CREATE OR REPLACE FUNCTION getFirstName(pId IN NUMBER) RETURN VARCHAR2
IS vcFirstName VARCHAR2(20);
BEGIN
    SELECT first_name
    INTO vcFirstName
    FROM person
    WHERE id_person = pId;
    RETURN (vcFirstName);
END;
/
CREATE OR REPLACE FUNCTION getLastName(pId IN NUMBER) RETURN VARCHAR2
IS vcLastName VARCHAR2(30);
BEGIN
    SELECT last_name
    INTO vcLastName
    FROM person
    WHERE id_person = pId;
    RETURN (vcLastName);
END;
/
CREATE OR REPLACE FUNCTION getBirthday(pId IN NUMBER) RETURN DATE
IS vcBirthday DATE;
BEGIN
    SELECT birth_day
    INTO vcBirthday
    FROM person
    WHERE id_person = pId;
    RETURN (vcBirthday);
END;
/
CREATE OR REPLACE FUNCTION getEmail(pId IN NUMBER) RETURN VARCHAR2
IS vcEmail VARCHAR2(50);
BEGIN
    SELECT email
    INTO vcEmail
    FROM person
    WHERE id_person = pId;
    RETURN (vcEmail);
END;
/
CREATE OR REPLACE FUNCTION getUsername(pId IN NUMBER) RETURN VARCHAR2
IS vcUsername VARCHAR2(30);
BEGIN
    SELECT user_name
    INTO vcUsername
    FROM person
    WHERE id_person = pId;
    RETURN (vcUsername);
END;
/
CREATE OR REPLACE FUNCTION getPassword(pId IN NUMBER) RETURN VARCHAR2
IS vcPassword VARCHAR2(20);
BEGIN
    SELECT password
    INTO vcPassword
    FROM person
    WHERE id_person = pId;
    RETURN (vcPassword);
END;
/
CREATE OR REPLACE FUNCTION getIdGender(pId IN NUMBER) RETURN NUMBER
IS vcIdGender NUMBER(6);
BEGIN
    SELECT id_gender
    INTO vcIdGender
    FROM person
    WHERE id_person = pId;
    RETURN (vcIdGender);
END;
/
CREATE OR REPLACE FUNCTION getIdInstitution(pId IN NUMBER) RETURN NUMBER
IS vcIdInstitution NUMBER(6);
BEGIN
    SELECT id_institution
    INTO vcIdInstitution
    FROM person
    WHERE id_person = pId;
    RETURN (vcIdInstitution);
END;
/
CREATE OR REPLACE FUNCTION getIdUserPasswordBinnacle(pId IN NUMBER) RETURN NUMBER
IS vcIdUserPasswordBinnacle NUMBER(8);
BEGIN
    SELECT id_user_password_binnacle
    INTO vcIdUserPasswordBinnacle
    FROM person
    WHERE id_person = pId;
    RETURN (vcIdUserPasswordBinnacle);
END;
/
CREATE OR REPLACE FUNCTION getPhotodescription(pId IN NUMBER) RETURN VARCHAR2
IS vcPhotoDescription VARCHAR2(50);
BEGIN
    SELECT description
    INTO vcPhotoDescription
    FROM photo
    WHERE id_person = pId;
    RETURN (vcPhotoDescription);
END;
/
CREATE OR REPLACE FUNCTION getTypePersonDescription(pId IN NUMBER) RETURN VARCHAR2
IS vcPersonDescription VARCHAR2(50);
BEGIN
    SELECT description
    INTO vcPersonDescription
    FROM type_person
    WHERE id_person = pId;
    RETURN (vcPersonDescription);
END;
/
CREATE OR REPLACE FUNCTION getUserPasswordDate(pId IN NUMBER) RETURN DATE
IS vcUserPasswordDate DATE;
BEGIN
    SELECT user_password_date
    INTO vcUserPasswordDate
    FROM user_password_binnacle
    WHERE id_person = pId;
    RETURN (vcUserPasswordDate);
END;
/
CREATE OR REPLACE FUNCTION getOldPassword(pId IN NUMBER) RETURN VARCHAR2
IS vcOldPassword VARCHAR2(20);
BEGIN
    SELECT old_password
    INTO vcOldPassword
    FROM user_password_binnacle
    WHERE id_person = pId;
    RETURN (vcOldPassword);
END;
/
CREATE OR REPLACE FUNCTION getNewPassword(pId IN NUMBER) RETURN VARCHAR2
IS vcNewPassword VARCHAR2(20);
BEGIN
    SELECT new_password
    INTO vcNewPassword
    FROM user_password_binnacle
    WHERE id_person = pId;
    RETURN (vcNewPassword);
END;
/