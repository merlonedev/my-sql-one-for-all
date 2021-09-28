DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(user_id int)
RETURNS INT READS SQL DATA
BEGIN
DECLARE historico_do_user INT;
SELECT COUNT(*)
FROM SpotifyClone.historico_de_reproducoes
WHERE SpotifyClone.historico_de_reproducoes.usuario_id = user_id INTO historico_do_user;
RETURN historico_do_user;
END $$
DELIMITER ;
