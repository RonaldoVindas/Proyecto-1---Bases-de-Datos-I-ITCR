Create or replace package control_personxphoto is
PROCEDURE insert_personXphoto (pid_person IN NUMBER, pid_photo NUMBER);
PROCEDURE remove_personXphoto (pid_person IN NUMBER);
PROCEDURE update_personXphoto_id_person(pid_person IN NUMBER, pnewid_person NUMBER);
PROCEDURE update_personXphoto_id_photo(pid_photo IN NUMBER, pnewid_photo NUMBER);
end control_personxphoto;

/
CREATE OR REPLACE PACKAGE BODY control_personxphoto IS
PROCEDURE insert_personXphoto (pid_person IN NUMBER, pid_photo NUMBER)  AS
BEGIN
	INSERT INTO personXphoto(id_person, id_photo)
	VALUES(pid_person, pid_photo);
	COMMIT;
END insert_personXphoto;


PROCEDURE remove_personXphoto (pid_person IN NUMBER) AS
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

PROCEDURE update_personXphoto_id_person(pid_person IN NUMBER, pnewid_person NUMBER) AS
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

PROCEDURE update_personXphoto_id_photo(pid_photo IN NUMBER, pnewid_photo NUMBER) AS
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

end control_personxphoto;