CREATE VIEW top_3_artistas AS
      SELECT 
          a.nome AS `artista`, COUNT(s.id_usuario) AS `seguidores`
      FROM
          seguindoArtistas AS s
              INNER JOIN
          Artistas AS a ON a.id = s.id_artista
      GROUP BY s.id_artista
      ORDER BY `seguidores` DESC , `artista`
      LIMIT 3;
