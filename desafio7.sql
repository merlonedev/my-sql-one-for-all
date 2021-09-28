CREATE VIEW perfil_artistas AS
  (SELECT 
      a.nome AS 'artista',
      al.nome AS 'album',
      COUNT(ua.usuario_id) AS 'seguidores'
  FROM
      SpotifyClone.artista AS a
          JOIN
      SpotifyClone.albuns AS al ON al.artista_id = a.artista_id
          JOIN
      SpotifyClone.usuario_artista AS ua ON a.artista_id = ua.artista_id
  GROUP BY a.nome , al.nome
  ORDER BY COUNT(ua.usuario_id) DESC , a.nome , al.nome);
