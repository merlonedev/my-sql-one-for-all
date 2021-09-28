CREATE VIEW top_3_artistas AS 
  SELECT
    a.artist_name AS `artista`,
    COUNT(ua.id_user) AS `seguidores`
  FROM
    SpotifyClone.user_artists AS ua
  JOIN SpotifyClone.artists AS a ON ua.id_artist = a.id_artist
  GROUP BY `artista`
  ORDER BY `seguidores` DESC, `artista`
  LIMIT 3;
