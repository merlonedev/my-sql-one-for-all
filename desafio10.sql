DELIMITER $$ 

CREATE FUNCTION quantidade_musicas_no_historico (music_id INT NOT NULL)
RETURNS VARCHAR(20) READS SQL DATA
BEGIN
    DECLARE total_songs INT NOT NULL;
    SELECT COUNT(song_id) FROM SpotifyClone.songs_history 
    WHERE music_id = song_id INTO total_songs;
    RETURN total_songs;
END $$

DELIMITER ;
