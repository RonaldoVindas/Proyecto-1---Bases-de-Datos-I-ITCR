/*====================================================CREACIÓN DE PROCEDIMIENTOS DE TABLAS====================================*/

/*EN ESQUEMA PE: ========================================*/

/*Tabla: Gender: ========================================*/

CREATE OR REPLACE PROCEDURE insert_gender (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO gender(description)
	VALUES(pdescription);
END insert_gender;

/

CREATE OR REPLACE PROCEDURE remove_gender (pid_gender IN NUMBER) AS
e_invalid_gender EXCEPTION;
BEGIN
	DELETE FROM gender
	WHERE id_gender = pid_gender;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_gender;
    END IF;
    EXCEPTION
    WHEN e_invalid_gender THEN
        DBMS_OUTPUT.PUT_LINE('No such gender.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_gender;

/

CREATE OR REPLACE PROCEDURE update_gender_description(pid_gender IN NUMBER, pdescription IN VARCHAR2) AS
e_invalid_gender EXCEPTION;
BEGIN
	UPDATE gender
	SET description = pdescription
	WHERE id_gender = pid_gender;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_gender;
    END IF;
    EXCEPTION
    WHEN e_invalid_gender THEN
        DBMS_OUTPUT.PUT_LINE('No such gender.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_gender_description;

/

/*Tabla: Institution: ========================================*/


CREATE OR REPLACE PROCEDURE insert_institution_name( pname IN VARCHAR2) AS
BEGIN
    INSERT INTO institution(name)
	VALUES(pname);
	COMMIT;
END insert_institution_name;

/

CREATE OR REPLACE PROCEDURE remove_institution (pid_institution IN NUMBER) AS
e_invalid_institution EXCEPTION;
BEGIN
	DELETE FROM institution
	WHERE id_institution = pid_institution;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_institution;
    END IF;
    EXCEPTION
    WHEN e_invalid_institution THEN
        DBMS_OUTPUT.PUT_LINE('No such institution.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_institution;

/

CREATE OR REPLACE PROCEDURE update_institution_name(pid_institution IN NUMBER, pname IN VARCHAR2) AS
e_invalid_institution EXCEPTION;
BEGIN
	UPDATE institution
	SET name = pname
	WHERE id_institution = pid_institution;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_institution;
    END IF;
    EXCEPTION
    WHEN e_invalid_institution THEN
        DBMS_OUTPUT.PUT_LINE('No such institution.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_institution_name;
/

/*Tabla: Person: ========================================*/

CREATE OR REPLACE PROCEDURE insert_person (pfirst_name IN VARCHAR2, plast_name VARCHAR2, pbirth_day DATE, 
								pemail VARCHAR2, puser_name VARCHAR2, ppassword VARCHAR2, 
								pid_gender NUMBER, pid_institution NUMBER, pid_binnacle NUMBER, 
								pid_type_person NUMBER)  AS

BEGIN
	INSERT INTO person(first_name, last_name, birth_day, email, user_name, password, id_gender, id_institution, id_user_password_binnacle, id_type_person,person_age)
	VALUES(pfirst_name, plast_name, pbirth_day, pemail, puser_name, ppassword, pid_gender, pid_institution,pid_binnacle,pid_type_person,TRUNC((SYSDATE - pbirth_day)/365.25));
	COMMIT;
END insert_person;

/

CREATE OR REPLACE PROCEDURE remove_person (pid_person IN NUMBER) AS
e_invalid_person EXCEPTION;
BEGIN
	DELETE FROM person
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_person;

/

CREATE OR REPLACE PROCEDURE update_person_first_name(pid_person IN NUMBER, pfirst_name IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET first_name = pfirst_name
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_first_name;

/

CREATE OR REPLACE PROCEDURE update_person_last_name(pid_person IN NUMBER, plast_name IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET last_name = plast_name
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_last_name;

/

CREATE OR REPLACE PROCEDURE update_person_birth_day(pid_person IN NUMBER, pbirth_day IN DATE) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET birth_day = pbirth_day
    WHERE id_person = pid_person;
    COMMIT;
    UPDATE person
    SET person_age = TRUNC((SYSDATE - pbirth_day)/365.25)
    WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_birth_day;

/


CREATE OR REPLACE PROCEDURE update_person_email(pid_person IN NUMBER, pemail IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET email = pemail
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_email;

/


CREATE OR REPLACE PROCEDURE update_person_username(pid_person IN NUMBER, puser_name IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET user_name = puser_name
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_username;

/

CREATE OR REPLACE PROCEDURE update_person_username(pid_person IN NUMBER, pusername IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET user_name = pusername
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_username;

/

CREATE OR REPLACE PROCEDURE update_person_password(pid_person IN NUMBER, ppassword IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET password = ppassword
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_password;

/

CREATE OR REPLACE PROCEDURE update_person_id_gender(pid_person IN NUMBER, pid_gender IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET id_gender = pid_gender
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_id_gender;

/

CREATE OR REPLACE PROCEDURE update_person_id_institution(pid_person IN NUMBER, pid_institution IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET id_institution = pid_institution
	WHERE id_gender = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_id_institution;


/
/*Tabla: PersonXBan: ========================================*/


CREATE OR REPLACE PROCEDURE insert_personXban (pid_person IN NUMBER, pid_ban NUMBER)  AS
BEGIN
	INSERT INTO personXban(id_person, id_ban)
	VALUES(pid_person, pid_ban);
	COMMIT;
END insert_personXban;

/

CREATE OR REPLACE PROCEDURE remove_personXban (pid_person IN NUMBER) AS
e_invalid_id_person EXCEPTION;
BEGIN
	DELETE FROM personXban
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_personXban;

/

CREATE OR REPLACE PROCEDURE update_personXban_id_person(pid_person IN NUMBER, pnewid_person NUMBER) AS
e_invalid_id_person EXCEPTION;
BEGIN
	UPDATE personXban
	SET id_person = pnewid_person
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_personXban_id_person;

/

CREATE OR REPLACE PROCEDURE update_personXban_id_ban(pid_ban IN NUMBER, pnewid_ban NUMBER) AS
e_invalid_id_ban EXCEPTION;
BEGIN
	UPDATE personXban
	SET id_ban = pnewid_ban
	WHERE id_ban = pid_ban;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_ban;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_ban THEN
        DBMS_OUTPUT.PUT_LINE('No such ban.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_personXban_id_ban;
/
/*Tabla: PersonXPhoto: ========================================*/

CREATE OR REPLACE PROCEDURE insert_personXphoto (pid_person IN NUMBER, pid_photo NUMBER)  AS
BEGIN
	INSERT INTO personXphoto(id_person, id_photo)
	VALUES(pid_person, pid_photo);
	COMMIT;
END insert_personXphoto;

/

CREATE OR REPLACE PROCEDURE remove_personXphoto (pid_person IN NUMBER) AS
e_invalid_id_person EXCEPTION;
BEGIN
	DELETE FROM personXphoto
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_personXphoto;

/

CREATE OR REPLACE PROCEDURE update_personXphoto_id_person(pid_person IN NUMBER, pnewid_person NUMBER) AS
e_invalid_id_person EXCEPTION;
BEGIN
	UPDATE personXphoto
	SET id_person = pnewid_person
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_personXphoto_id_person;

/

CREATE OR REPLACE PROCEDURE update_personXphoto_id_photo(pid_photo IN NUMBER, pnewid_photo NUMBER) AS
e_invalid_id_photo EXCEPTION;
BEGIN
	UPDATE personXphoto
	SET id_photo = pnewid_photo
	WHERE id_photo = pid_photo;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_id_photo;
    END IF;
    EXCEPTION
    WHEN e_invalid_id_photo THEN
        DBMS_OUTPUT.PUT_LINE('No such photo.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_personXphoto_id_photo;
/
/*Tabla: Photo: ========================================*/

CREATE OR REPLACE PROCEDURE insert_photo (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO photo(description)
	VALUES(pdescription);
	COMMIT;
END insert_photo;

/

CREATE OR REPLACE PROCEDURE remove_photo (pid_photo IN NUMBER) AS
e_invalid_photo EXCEPTION;
BEGIN
	DELETE FROM photo
	WHERE id_photo = pid_photo;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_photo;
    END IF;
    EXCEPTION
    WHEN e_invalid_photo THEN
        DBMS_OUTPUT.PUT_LINE('No such photo.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_photo;

/

CREATE OR REPLACE PROCEDURE update_photo_description(pid_photo IN NUMBER, pdescription IN VARCHAR2) AS
e_invalid_photo EXCEPTION;
BEGIN
	UPDATE photo
	SET description = pdescription
	WHERE id_photo = pid_photo;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_photo;
    END IF;
    EXCEPTION
    WHEN e_invalid_photo THEN
        DBMS_OUTPUT.PUT_LINE('No such photo.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_photo_description;

/
/*Tabla: Type Person: ========================================*/

CREATE OR REPLACE PROCEDURE insert_type_person (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO type_person(description)
	VALUES(pdescription);
	COMMIT;
END insert_type_person;

/

CREATE OR REPLACE PROCEDURE remove_type_person (pid_type_person IN NUMBER) AS
e_invalid_type_person EXCEPTION;
BEGIN
	DELETE FROM type_person
	WHERE id_type_person = pid_type_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_type_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_type_person THEN
        DBMS_OUTPUT.PUT_LINE('No such type of person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_type_person;

/

CREATE OR REPLACE PROCEDURE update_type_person_description(pid_type_person IN NUMBER, pdescription IN VARCHAR2) AS
e_invalid_type_person EXCEPTION;
BEGIN
	UPDATE type_person
	SET description = pdescription
	WHERE id_type_person = pid_type_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_type_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_type_person THEN
        DBMS_OUTPUT.PUT_LINE('No such type of person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_type_person_description;

/
/*Tabla: Ban: ========================================*/


CREATE OR REPLACE PROCEDURE insert_ban(p_ban_time IN DATE,p_id_motive IN NUMBER)AS
BEGIN
    INSERT INTO ban (ban_time,id_motive)
    VALUES(p_ban_time,p_id_motive);
    COMMIT;
END insert_ban;
/
CREATE OR REPLACE PROCEDURE remove_ban(p_id_ban IN NUMBER)AS
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
/
CREATE OR REPLACE PROCEDURE update_ban(p_ban_time IN DATE,p_id_ban IN NUMBER)AS
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
/


/*Tabla: Ban Motive: ========================================*/


CREATE OR REPLACE PROCEDURE insert_ban_motive(p_ban_motive_description IN VARCHAR2)AS
BEGIN
    INSERT INTO ban_motive(ban_motive_description)
    VALUES(p_ban_motive_description);
    COMMIT;
END insert_ban_motive;
/
CREATE OR REPLACE PROCEDURE remove_ban_motive(p_id_ban_motive IN NUMBER)AS
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
/
CREATE OR REPLACE PROCEDURE update_ban_motive(p_ban_motive_description IN VARCHAR2,p_id_ban_motive IN NUMBER)AS
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
/
CREATE OR REPLACE PROCEDURE insert_password_binnacle(p_new_password IN VARCHAR2)AS
BEGIN
    INSERT INTO user_password_binnacle (new_password)
    VALUES(p_new_password);
    COMMIT;
END insert_password_binnacle;
/

CREATE OR REPLACE PROCEDURE remove_password_binnacle (pid_password_binnacle IN NUMBER) AS
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
/
CREATE OR REPLACE PROCEDURE update_password_binnacle (pid_password_binnacle IN NUMBER,pnew_password IN VARCHAR2) AS
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
