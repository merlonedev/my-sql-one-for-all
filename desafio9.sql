DELIMITER $$

CREATE PROCEDURE
  albuns_do_artista(IN name_input VARCHAR(50))
BEGIN
  SELECT A. artist_name AS artista,
    AL.album_name AS album
  FROM Artists A
  JOIN Albums AL ON A.artist_ID = AL.artist_ID
  WHERE A.artist_name = name_input;
END $$

DELIMITER ;
