CREATE VIEW perfil_artistas AS
  SELECT
	art.name AS `artista`,
  alb.name AS `album`,
  COUNT(ua.artist_id) AS `seguidores`
FROM SpotifyClone.albums AS alb
JOIN SpotifyClone.artists AS art ON alb.artist_id = art.id
JOIN SpotifyClone.user_artist AS ua ON alb.artist_id = ua.artist_id
GROUP BY art.name, alb.name
ORDER BY `seguidores` DESC, `artista` ASC, `album` ASC;
