CREATE VIEW historico_reproducao_usuarios AS
SELECT 
    u.user usuario, c.cancao nome
FROM
SpotifyClone.users u
INNER JOIN
SpotifyClone.historico h ON u.user_id = h.user_id
INNER JOIN
SpotifyClone.cancoes c ON c.cancao_id = h.cancao_id
ORDER BY usuario, nome;
