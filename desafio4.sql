CREATE VIEW top_3_artistas AS
  SELECT 
    a.`name` AS `artista`,
    COUNT(a.`name`) AS `seguidores`
FROM SpotifyClone.user_artist AS u_a
JOIN SpotifyClone.artists AS a ON u_a.artist_id = a.id
GROUP BY `name`
ORDER BY `seguidores` DESC, `artista` ASC
LIMIT 3;
-- SELECT * FROM top_3_artistas;
