CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.usuario AS 'usuario',
c.cancao AS 'nome'
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.usuario_cancao AS uc
ON uc.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancao AS c
ON uc.cancao_id = c.cancao_id
ORDER BY usuario, nome;
