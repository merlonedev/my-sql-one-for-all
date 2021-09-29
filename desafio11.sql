CREATE VIEW cancoes_premium AS SELECT 
    c.cancao_titulo AS nome,
    COUNT(h.cancao_id) AS reproducoes
FROM
    SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.histor_reprod AS h
ON h.cancao_id = c.cancao_id
INNER JOIN SpotifyClone.usuarios AS u
ON u.usuario_id = h.usuario_id
WHERE u.plano_id = 2 OR u.plano_id = 3
GROUP BY nome
ORDER BY nome;
