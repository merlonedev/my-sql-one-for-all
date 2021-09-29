CREATE VIEW historico_reproducao_usuarios AS
  SELECT
  u.Nome AS 'usuario',
  c.Nome_Cancao AS 'nome'
  FROM SpotifyClone.Historico h 
  INNER JOIN SpotifyClone.Usuario u ON h.Id_Usuario = u.Id -- quando criei as tabelas eu deveria ter usado nomes melhores e mais iguais entre tabelas diferentes,
  INNER JOIN SpotifyClone.Cancoes c ON h.Id_Cancao = c.Id
  ORDER BY u.Nome, c.Nome_Cancao;
