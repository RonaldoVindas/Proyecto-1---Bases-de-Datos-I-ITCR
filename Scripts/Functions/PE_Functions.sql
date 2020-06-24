/*Tabla: Gender*/

CREATE OR REPLACE FUNCTION getGenderDescription(pid_gender IN NUMBER) RETURN VARCHAR2
IS 
    vcGenderDescription VARCHAR2(50);
    BEGIN
        SELECT description
        INTO vcGenderDescription
        FROM gender
        WHERE id_gender = pid_gender;
        RETURN (vcGenderDescription);
    END;

/

/*Tabla: Institution*/
CREATE OR REPLACE FUNCTION getInstitutionName(pid_institution IN NUMBER) RETURN VARCHAR2
IS 
    vcInstitutionN VARCHAR2(50);
    BEGIN
        SELECT name
        INTO vcInstitutionName
        FROM institution
        WHERE id_institution = pid_institution;
        RETURN (vcInstitutionName);
    END;

/

CREATE OR REPLACE FUNCTION getPersonFirstName(pid_person IN NUMBER) RETURN VARCHAR2
IS 
    vcPersonFirstName VARCHAR2(20);
    BEGIN
        SELECT first_name
        INTO vcPersonFirstName
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonFirstName);
    END;

/

CREATE OR REPLACE FUNCTION getPersonLastName(pid_person IN NUMBER) RETURN VARCHAR2
IS
    vcPersonLastName VARCHAR2(30);
    BEGIN
        SELECT last_name
        INTO vcPersonLastName
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonLastName);
    END;

/

CREATE OR REPLACE FUNCTION getPersonBirthDay(pid_person IN NUMBER) RETURN DATE
IS 
    vcPersonBirthDay DATE;
    BEGIN
        SELECT birth_day
        INTO vcPersonBirthDay
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonBirthDay);
    END;

/

CREATE OR REPLACE FUNCTION getPersonPassword(pid_person IN NUMBER) RETURN VARCHAR2
IS
    vcPersonPassword VARCHAR(50);
    BEGIN
        SELECT password
        INTO vcPersonPassword
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonPassword);
    END;

/

CREATE OR REPLACE FUNCTION getPersonIdGender(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonIdGender NUMBER(6);
    BEGIN
        SELECT id_gender
        INTO vcPersonIdGender
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdGender);
    END;
/

CREATE OR REPLACE FUNCTION getPersonIdInstitution(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonIdInstitution NUMBER(6);
    BEGIN
        SELECT id_institution
        INTO vcPersonIdInstitution
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdInstitution);
    END;
/

CREATE OR REPLACE FUNCTION getPersonIdBinnacle(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonIdBinnacle NUMBER(8);
    BEGIN
        SELECT id_user_password_binnacle
        INTO vcPersonIdBinnacle
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdBinnacle);
    END;

/

CREATE OR REPLACE FUNCTION getPersonIdTypePerson(pid_person IN NUMBER) RETURN NUMBER
IS 
    vcPersonIdTypePerson NUMBER(6);
    BEGIN
        SELECT id_type_person
        INTO vcPersonIdTypePerson
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdTypePerson);
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


CREATE OR REPLACE FUNCTION getPhotodescription(pId IN NUMBER) RETURN VARCHAR2
IS vcPhotoDescription VARCHAR2(50);
BEGIN
    SELECT description
    INTO vcPhotoDescription
    FROM photo
    WHERE id_photo = pId;
    RETURN (vcPhotoDescription);
END;

/

CREATE OR REPLACE FUNCTION getTypePersonDescription(pId IN NUMBER) RETURN VARCHAR2
IS vcTypePersonDescription VARCHAR2(50);
BEGIN
    SELECT description
    INTO vcTypePersonDescription
    FROM type_person
    WHERE id_type_person = pId;
    RETURN (vcTypePersonDescription);
END;

/

CREATE OR REPLACE FUNCTION getBinnacleUserPasswordDate(pId IN NUMBER) RETURN DATE
IS vcBinnacleUserPasswordDate DATE;
BEGIN
    SELECT user_password_date
    INTO vcBinnacleUserPasswordDate
    FROM user_password_binnacle
    WHERE id_user_password_binnacle = pId;
    RETURN (vcBinnacleUserPasswordDate);
END;

/

CREATE OR REPLACE FUNCTION getBinnacleOldPassword(pId IN NUMBER) RETURN VARCHAR2
IS vcBinnacleOldPassword VARCHAR2(20);
BEGIN
    SELECT old_password
    INTO vcBinnacleOldPassword
    FROM user_password_binnacle
    WHERE id_user_password_binnacle = pId;
    RETURN (vcBinnacleOldPassword);
END;

/

CREATE OR REPLACE FUNCTION getBinnacleNewPassword(pId IN NUMBER) RETURN VARCHAR2
IS vcBinnacleNewPassword VARCHAR2(20);
BEGIN
    SELECT new_password
    INTO vcBinnacleNewPassword
    FROM user_password_binnacle
    WHERE id_user_password_binnacle = pId;
    RETURN (vcBinnacleNewPassword);
END;

/


CREATE OR REPLACE FUNCTION getPersonXBanIdBan(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonXBanIdBan NUMBER(6);
    BEGIN 
        SELECT id_ban
        INTO vcPersonXBanIdBan
        FROM personxban
        WHERE id_person = pid_person;
        RETURN (vcPersonXBanIdBan);
    END;

/

CREATE OR REPLACE FUNCTION getPersonXBanIdPerson(pid_ban IN NUMBER) RETURN NUMBER
IS
    vcPersonXBanIdPerson NUMBER(6);
    BEGIN 
        SELECT id_person
        INTO vcPersonXBanIdPerson
        FROM personxban
        WHERE id_ban = pid_ban;
        RETURN (vcPersonXBanIdPerson);
    END;