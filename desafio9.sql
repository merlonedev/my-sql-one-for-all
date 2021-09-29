DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist VARCHAR(50))
BEGIN
  SELECT
    AR.artist_name AS `artista`,
    AL.album_name AS `album`
  FROM
    SpotifyClone.albums AS AL
  JOIN
    SpotifyClone.artists AS AR
  ON
    AL.artist_id = AR.id
  WHERE
    AR.artist_name = artist
ORDER BY
  `album`;
END $$

DELIMITER ;
