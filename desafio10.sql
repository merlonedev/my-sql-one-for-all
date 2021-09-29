DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id_user INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE songs_quantity INT;
    SELECT 
      COUNT(*)
    FROM
      SpotifyClone.user_songs AS us
    WHERE
      id_user = us.id_user 
    INTO songs_quantity;
    RETURN songs_quantity;
END $$
DELIMITER ;
