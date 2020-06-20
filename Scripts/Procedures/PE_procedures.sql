/*====================================================CREACIÓN DE PROCEDIMIENTOS DE TABLAS====================================*/

/*EN ESQUEMA PE: ========================================*/


/*Tabla: Gender: ========================================*/

CREATE PROCEDURE insert_gender (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO gender(description)
	VALUES(pdescription);
	COMMIT;
END insert_gender;

/

CREATE PROCEDURE remove_gender (pid_gender IN NUMBER) AS
BEGIN
	DELETE FROM gender
	WHERE id_gender = pid_gender;
	COMMIT;
END remove_gender;

/

CREATE PROCEDURE update_gender_description(pid_gender IN NUMBER, pdescription IN VARCHAR2) AS
BEGIN
	UPDATE gender
	SET description = pdescription
	WHERE id_gender = pid_gender;
	COMMIT;
END update_gender_description;



/*Tabla: Institution: ========================================*/


CREATE PROCEDURE update_institution_name(pid_institution IN NUMBER, pname IN VARCHAR2) AS
BEGIN
	UPDATE institution
	SET name = pname
	WHERE id_institution = pid_institution;
	COMMIT;
END update_institution_name;

/

CREATE PROCEDURE remove_institution (pid_institution IN NUMBER) AS
BEGIN
	DELETE FROM institution
	WHERE id_institution = pid_institution;
	COMMIT;
END remove_institution;

/

CREATE PROCEDURE update_institution_name(pid_institution IN NUMBER, pname IN VARCHAR2) AS
BEGIN
	UPDATE institution
	SET name = pname
	WHERE id_institution = pid_institution;
	COMMIT;
END update_institution_name;


/*Tabla: Person: ========================================*/

CREATE PROCEDURE insert_person (pfirst_name IN VARCHAR2, plast_name VARCHAR2, pbirth_day DATE, 
								pemail VARCHAR2, puser_name VARCHAR2, ppassword VARCHAR2, 
								pid_gender NUMBER, pid_institution NUMBER, pid_binnacle NUMBER, 
								pid_type_person NUMBER)  AS

BEGIN
	INSERT INTO person(first_name, last_name, birth_day, email, user_name, password, id_gender, id_institution, id_user_password_binnacle, id_type_person)
	VALUES(pfirst_name, plast_name, pbirth_day, pemail, puser_name, ppassword, pid_gender, pid_institution,pid_binnacle,pid_type_person);
	COMMIT;
END insert_person;

/

CREATE PROCEDURE remove_person (pid_person IN NUMBER) AS
BEGIN
	DELETE FROM person
	WHERE id_person = pid_person;
	COMMIT;
END remove_person;

/

CREATE PROCEDURE update_person_first_name(pid_person IN NUMBER, pfirst_name IN VARCHAR2) AS
BEGIN
	UPDATE person
	SET first_name = pfirst_name
	WHERE id_person = id_person;
	COMMIT;
END update_person_first_name;

/

CREATE PROCEDURE update_person_last_name(pid_person IN NUMBER, plast_name IN VARCHAR2) AS
BEGIN
	UPDATE person
	SET last_name = plast_name
	WHERE id_person = id_person;
	COMMIT;
END update_person_last_name;

/

CREATE PROCEDURE update_person_birth_day(pid_person IN NUMBER, pbirth_day IN DATE) AS
BEGIN
	UPDATE person
	SET birth_day = pbirth_day
	WHERE id_person = id_person;
	COMMIT;
END update_person_birth_day;

/

CREATE PROCEDURE update_person_email(pid_person IN NUMBER, pemail IN VARCHAR2) AS
BEGIN
	UPDATE person
	SET email = pemail
	WHERE id_person = id_person;
	COMMIT;
END update_person_email;

/


CREATE PROCEDURE update_person_username(pid_person IN NUMBER, puser_name IN VARCHAR2) AS
BEGIN
	UPDATE person
	SET user_name = puser_name
	WHERE id_person = id_person;
	COMMIT;
END update_person_username;

/

CREATE PROCEDURE update_person_username(pid_person IN NUMBER, pusername IN VARCHAR2) AS
BEGIN
	UPDATE person
	SET username = pusername
	WHERE id_person = id_person;
	COMMIT;
END update_person_username;

/

CREATE PROCEDURE update_person_password(pid_person IN NUMBER, ppassword IN VARCHAR2) AS
BEGIN
	UPDATE person
	SET password = ppassword
	WHERE id_person = id_person;
	COMMIT;
END update_person_password;

/

CREATE PROCEDURE update_person_id_gender(pid_person IN NUMBER, pid_gender IN VARCHAR2) AS
BEGIN
	UPDATE person
	SET id_gender = pid_gender
	WHERE id_person = pid_person;
	COMMIT;
END update_person_id_gender;

/

CREATE PROCEDURE update_person_id_institution(pid_person IN NUMBER, pid_institution IN VARCHAR2) AS
BEGIN
	UPDATE person
	SET id_institution = pid_institution
	WHERE id_gender = pid_gender;
	COMMIT;
END update_person_pid_institution;



/*Tabla: PersonXBan: ========================================*/


CREATE PROCEDURE insert_personXban (pid_person IN NUMBER, pid_ban NUMBER)  AS
BEGIN
	INSERT INTO personXban(id_person, id_ban)
	VALUES(pid_person, pid_ban);
	COMMIT;
END insert_personXban;

/

CREATE PROCEDURE remove_personXban (pid_person IN NUMBER) AS
BEGIN
	DELETE FROM personXban
	WHERE id_person = pid_person;
	COMMIT;
END remove_personXban;

/

CREATE PROCEDURE update_personXban_id_person(pid_person IN NUMBER, pnewid_person NUMBER) AS
BEGIN
	UPDATE personXban
	SET id_person = pnewid_person
	WHERE id_person = pid_person;
	COMMIT;
END update_personXban_id_person;

/

CREATE PROCEDURE update_personXban_id_ban(pid_ban IN NUMBER, pnewid_ban NUMBER) AS
BEGIN
	UPDATE personXban
	SET id_ban = pnewid_ban
	WHERE id_ban = pid_ban;
	COMMIT;
END update_personXban_id_ban;

/*Tabla: PersonXPhoto: ========================================*/

CREATE PROCEDURE insert_personXphoto (pid_person IN NUMBER, pid_photo NUMBER)  AS
BEGIN
	INSERT INTO personXphoto(id_person, id_photo)
	VALUES(pid_person, pid_photo);
	COMMIT;
END insert_personXphoto;

/

CREATE PROCEDURE remove_personXphoto (pid_person IN NUMBER) AS
BEGIN
	DELETE FROM personXphoto
	WHERE id_person = pid_person;
	COMMIT;
END remove_personXphoto;

/

CREATE PROCEDURE update_personXphoto_id_person(pid_person IN NUMBER, pnewid_person NUMBER) AS
BEGIN
	UPDATE personXphoto
	SET id_person = pnewid_person
	WHERE id_person = pid_person;
	COMMIT;
END update_personXphoto_id_person;

/

CREATE PROCEDURE update_personXphoto_id_photo(pid_photo IN NUMBER, pnewid_photo NUMBER) AS
BEGIN
	UPDATE personXphoto
	SET id_photo = pnewid_photo
	WHERE id_photo = pid_photo;
	COMMIT;
END update_personXphoto_id_photo;

/*Tabla: Photo: ========================================*/

CREATE PROCEDURE insert_photo (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO photo(description)
	VALUES(pdescription);
	COMMIT;
END insert_photo;

/

CREATE PROCEDURE remove_photo (pid_photo IN NUMBER) AS
BEGIN
	DELETE FROM photo
	WHERE id_photo = pid_photo;
	COMMIT;
END remove_photo;

/

CREATE PROCEDURE update_photo_description(pid_photo IN NUMBER, pdescription IN VARCHAR2) AS
BEGIN
	UPDATE photo
	SET description = pdescription
	WHERE id_photo = pid_photo;
	COMMIT;
END update_photo_description;


/*Tabla: Type Person: ========================================*/

CREATE PROCEDURE insert_type_person (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO type_person(description)
	VALUES(pdescription);
	COMMIT;
END insert_type_person;

/

CREATE PROCEDURE remove_type_person (pid_type_person IN NUMBER) AS
BEGIN
	DELETE FROM type_person
	WHERE id_type_person = pid_type_person;
	COMMIT;
END remove_type_person;

/

CREATE PROCEDURE update_type_person_description(pid_type_person IN NUMBER, pdescription IN VARCHAR2) AS
BEGIN
	UPDATE type_person
	SET description = pdescription
	WHERE id_type_person = pid_type_person;
	COMMIT;
END update_type_person_description;


/*Tabla: Ban: ========================================*/


CREATE OR REPLACE PROCEDURE insert_ban(p_ban_time IN DATE,p_id_motive IN NUMBER)AS
BEGIN
    INSERT INTO ban (ban_time,id_motive)
    VALUES(p_ban_time,p_id_motive);
    COMMIT;
END insert_ban;
/
CREATE OR REPLACE PROCEDURE remove_ban(p_id_ban IN NUMBER)AS
BEGIN
    DELETE FROM ban
    WHERE id_ban = p_id_ban;
    commit;
END remove_ban;
/
CREATE OR REPLACE PROCEDURE update_ban(p_ban_time IN DATE,p_id_ban IN NUMBER)AS
BEGIN
    UPDATE ban
    SET ban_time = p_ban_time
    WHERE id_ban = p_id_ban;
    COMMIT;
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
BEGIN
    DELETE FROM ban_motive
    WHERE id_ban_motive = p_id_ban_motive;
    COMMIT;
END remove_ban_motive;
/
CREATE OR REPLACE PROCEDURE update_ban_motive(p_ban_motive_description IN VARCHAR2,p_id_ban_motive IN NUMBER)AS
BEGIN
    UPDATE ban_motive
    SET ban_motive_description = p_ban_motive_description
    WHERE id_ban_motive = p_id_ban_motive;
    COMMIT;
END update_ban_motive;
/
