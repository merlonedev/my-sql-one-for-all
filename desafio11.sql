CREATE VIEW	cancoes_premium AS
  SELECT c.cancao AS nome, COUNT(uc.cancao_id) AS reproducoes
FROM SpotifyClone.Usuario_Cancao AS uc
INNER JOIN SpotifyClone.Cancao AS c
ON uc.cancao_id = c.cancao_id
INNER JOIN SpotifyClone.Usuario AS u
ON u.usuario_id = uc.usuario_id
WHERE plano_id IN (2,3)
GROUP BY c.cancao
ORDER BY nome;
