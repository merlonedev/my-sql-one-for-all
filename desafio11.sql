CREATE VIEW cancoes_premium AS
SELECT 
    c.cancao nome, COUNT(h.cancao_id) reproducoes
FROM
    SpotifyClone.historico h
        INNER JOIN
    SpotifyClone.cancoes c ON h.cancao_id = c.cancao_id
        INNER JOIN
    SpotifyClone.users u ON u.user_id = h.user_id
WHERE
    u.plano_id = 2 OR u.plano_id = 3
GROUP BY nome
ORDER BY nome;
