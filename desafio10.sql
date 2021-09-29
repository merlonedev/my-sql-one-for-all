DELIMITER $

CREATE FUNCTION SpotifyClone.quantidade_musicas_no_historico(
    id_usuario INT
)
RETURNS INT READS SQL DATA

BEGIN
    DECLARE quantity INT;

    SELECT
        COUNT(us.song_id)
    FROM
        SpotifyClone.users_songs AS us
    WHERE
        us.user_id = id_usuario
    INTO quantity;

    RETURN quantity;
END $

DELIMITER ;

SELECT SpotifyClone.quantidade_musicas_no_historico(3);
