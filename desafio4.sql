CREATE VIEW top_3_artistas AS 
  SELECT artista AS artista, COUNT(*) AS seguidores
FROM SpotifyClone.Artista AS a
INNER JOIN SpotifyClone.Usuario_Artista AS uc
ON a.artista_id = uc.artista_id
GROUP BY a.artista_id
ORDER BY seguidores DESC, artista
LIMIT 3;
