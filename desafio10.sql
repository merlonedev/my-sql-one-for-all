USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade INT;
SELECT COUNT(song_id)
FROM SpotifyClone.reproduction_history
WHERE user_id = id INTO quantidade;
RETURN quantidade;
END $$
DELIMITER $$;

-- SELECT quantidade_musicas_no_historico(3);
