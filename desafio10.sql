DELIMITER #

CREATE FUNCTION quantidade_musicas_no_historico(userID INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE totalAlbums INT;
  SELECT COUNT(*) FROM SpotifyClone.user_song
  WHERE user_id = userID INTO totalAlbums;
  RETURN totalAlbums;
END #
DELIMITER ;
