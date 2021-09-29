CREATE VIEW historico_reproducao_usuarios AS
  SELECT nome AS usuario, cancao AS nome
FROM SpotifyClone.Usuario_Cancao AS uc
INNER JOIN SpotifyClone.Usuario AS u
ON u.usuario_id = uc.usuario_id
INNER JOIN SpotifyClone.Cancao AS c
ON c.cancao_id = uc.cancao_id
ORDER BY usuario, nome;
