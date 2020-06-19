------ban table-----
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
-----ban motive table-----
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
-----personxban table-----
CREATE OR REPLACE PROCEDURE insert_personxban()AS
BEGIN
    INSERT INTO personxban()
    VALUES();
    COMMIT;
END insert_personxban;
/
CREATE OR REPLACE PROCEDURE remove_personxban()AS
BEGIN
    DELETE FROM personxban
    WHERE;
    commit;
END remove_personxban;
/
CREATE OR REPLACE PROCEDURE update_personxban()AS
BEGIN
    UPDATE personxban
    SET
    WHERE;
    COMMIT;
END update_personxban;
/


