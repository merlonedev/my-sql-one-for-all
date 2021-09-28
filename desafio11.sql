CREATE VIEW cancoes_premium AS
SELECT
c.cancao_name AS nome,
COUNT(*) AS reproducoes
FROM SpotifyClone.historico_de_reproducoes AS h
JOIN SpotifyClone.cancoes AS c ON c.cancao_id = h.cancao_id
JOIN SpotifyClone.users AS u ON u.usuario_id = h.usuario_id && u.plano_id IN (2, 3)
GROUP BY nome
ORDER BY nome;
