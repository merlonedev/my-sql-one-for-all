CREATE VIEW top_3_artistas AS
  (SELECT 
      a.nome AS 'artista', COUNT(ua.artista_id) AS 'seguidores'
  FROM
      SpotifyClone.artista AS a
          JOIN
      SpotifyClone.usuario_artista AS ua ON ua.artista_id = a.artista_id
  GROUP BY a.nome
  ORDER BY COUNT(artista_id) DESC , a.nome
  LIMIT 3);
