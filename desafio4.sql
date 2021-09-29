CREATE VIEW top_3_artistas AS
  SELECT
   a.Nome_Artista AS 'artista',
   COUNT(f.Id_Usuario) AS 'seguidores' -- faz a contagem no id do usuario e abaixo AGRUPA pelo id do artista. Aí vou saber quantos seguidores teve cada artista. Ex: O artista de id=1 teve X seguidores.
  FROM SpotifyClone.Follow f
  INNER JOIN SpotifyClone.Artista a ON f.Id_Artista = a.Id -- não precisa da tabela usuario aqui pq não quer saber o nome dos usuarios. Somente saber quantos seguidores tiveram os artistas.
  GROUP BY a.Id -- pra organizar: artista tal teve X seguidores.
  ORDER BY f.Id_Usuario DESC, a.Nome_Artista LIMIT 3;
  SELECT * FROM top_3_artistas;