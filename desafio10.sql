DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico (search INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE song_amount INT;
SELECT COUNT(*) FROM SpotifyClone.historic
WHERE user_id = search
GROUP BY user_id INTO song_amount;
RETURN song_amount;
END
$$ DELIMITER ;
