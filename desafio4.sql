CREATE VIEW top_3_artistas AS
  SELECT 
    artistas.nome_artista AS 'artista',
    COUNT(seguidores.id_usuario) AS 'seguidores'
    FROM
      tb_artistas_usuarios AS seguidores
    JOIN
    tb_usuarios AS usuarios ON usuarios.usuario_id = seguidores.id_usuario
    JOIN
  tb_artistas AS artistas ON artistas.id_artista = seguidores.id_artista
  GROUP BY artistas.nome_artista
  ORDER BY COUNT(seguidores.id_usuario) DESC , artistas.nome_artista ASC
  LIMIT 3;


 