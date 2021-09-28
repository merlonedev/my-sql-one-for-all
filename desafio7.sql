CREATE VIEW perfil_artistas AS 
  SELECT
    ar.artist_name AS `artista`,
    al.album_name AS `album`,
    COUNT(ua.id_user) AS `seguidores`
  FROM
    SpotifyClone.user_artists AS ua
  JOIN SpotifyClone.artists AS ar ON ua.id_artist = ar.id_artist
  JOIN SpotifyClone.albums AS al ON ua.id_artist = al.id_artist
  GROUP BY `artista`, `album`
  ORDER BY `seguidores` DESC, `artista`, `album`;
