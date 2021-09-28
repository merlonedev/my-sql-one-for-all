CREATE VIEW cancoes_premium AS
SELECT c.cancao AS nome, COUNT(cru.usuario_id) AS reproducoes
FROM SpotifyClone.cancoes_reproduzidas_usuario AS cru
INNER JOIN SpotifyClone.cancoes AS c
ON c.cancao_id = cru.cancao_id
INNER JOIN SpotifyClone.usuarios AS u
ON u.usuario_id = cru.usuario_id
INNER JOIN SpotifyClone.planos AS p
ON p.plano_id = u.plano_id
WHERE p.plano IN ('familiar', 'universitário')
GROUP BY c.cancao
ORDER BY c.cancao;
