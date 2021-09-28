CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario, c.cancao FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.cancoes_reproduzidas_usuario AS cru
ON cru.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancoes AS c
ON cru.cancao_id = c.cancao_id
ORDER BY u.usuario, c.cancao;
