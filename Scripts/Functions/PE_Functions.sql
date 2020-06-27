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
    vcInstitutionName VARCHAR2(50);
    BEGIN
        SELECT name
        INTO vcInstitutionName
        FROM institution
        WHERE id_institution = pid_institution;
        RETURN (vcInstitutionName);
    END;

/

/*Tabla: Person*/
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

CREATE OR REPLACE FUNCTION getPersonUsername(pid_person IN NUMBER) RETURN VARCHAR2
IS 
    vcPersonUsername VARCHAR2(50);
    BEGIN
        SELECT user_name
        INTO vcPersonUsername
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonUsername);
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

CREATE OR REPLACE FUNCTION getPersonAge(pId IN NUMBER) RETURN NUMBER
IS vcAge NUMBER(4);
BEGIN
    SELECT person_age
    INTO vcAge
    FROM person
    WHERE id_person = pId;
    RETURN (vcAge);
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


/*Tabla: Ban Motive*/
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

/*Tabla: Photo*/
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

/*Tabla: Type Person*/
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

/*Tabla: User Password Binnacle*/
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

/*Tabla: PersonXBan*/
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



/

/*========================= FUNCIONES ADICIONALES ===============================================*/

/*Encriptación de Passwords*/

CREATE OR REPLACE FUNCTION EncryptPassword(pencrypt_password IN VARCHAR2) RETURN VARCHAR2
AS
    data VARCHAR2(255);
    BEGIN
    data := rpad(pencrypt_password, (trunc(length(pencrypt_password)/8)+1)*8, chr(0) );
    dbms_obfuscation_toolkit.DESEncrypt
          ( input_string => data,
            key_string   => 'DBAKey03',
            encrypted_string=> data );
 
    RETURN data;
  END;

/

/*Desencriptación de Llaves*/

CREATE OR REPLACE FUNCTION DecryptPassword(pdecrypt_password IN VARCHAR2) RETURN VARCHAR2
AS
    data VARCHAR2(255);
    BEGIN
     dbms_obfuscation_toolkit.DESDecrypt
          ( input_string => pdecrypt_password,
            key_string   => 'DBAKey03',
            decrypted_string=> data );
    return rtrim( data, chr(0) );
    END;


