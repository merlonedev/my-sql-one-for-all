CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.`name` AS usuario,
c.cancao_name AS nome
FROM SpotifyClone.historico_de_reproducoes as h
JOIN SpotifyClone.users as u ON u.usuario_id = h.usuario_id
JOIN SpotifyClone.cancoes as c ON c.cancao_id = h.cancao_id
ORDER BY usuario, nome;
