delimiter $$

CREATE FUNCTION quantidade_musicas_no_historico(usuario int)
RETURNS INT READS SQL DATA
BEGIN
	DECLARE cancoes_usuario INT;
	Select Count(song_id) from SpotfiyClone.histories where SpotfiyClone.histories.user_id = usuario into cancoes_usuario;
    Return cancoes_usuario;
END $$

delimiter ;
