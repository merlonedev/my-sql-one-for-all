CREATE VIEW perfil_artistas AS SELECT
  artista AS artista, album AS album, COUNT(*) AS seguidores
FROM SpotifyClone.Usuario_Artista AS ua
INNER JOIN SpotifyClone.Artista AS a
ON ua.artista_id = a.artista_id
INNER JOIN SpotifyClone.Album AS abm
ON abm.artista_id = ua.artista_id
GROUP BY abm.album_id
ORDER BY seguidores DESC, artista, album;
