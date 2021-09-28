DELIMITER $$ 
CREATE FUNCTION quantidade_musicas_no_historico (music_id INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE quantidade_musicas_no_historico INT;
SELECT 
    COUNT(*)
FROM
    songs_history
WHERE
    user_id = music_id INTO quantidade_musicas_no_historico;
    RETURN quantidade_musicas_no_historico;
END $$

DELIMITER ;
