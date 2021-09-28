CREATE VIEW historico_reproducao_usuarios AS
SELECT u.user_name AS usuario, m.musica AS nome
FROM SpotifyClone.users AS u
INNER JOIN
SpotifyClone.historic AS hr
ON u.user_id = hr.user_id
INNER JOIN SpotifyClone.musicas AS m
ON m.musica_id = hr.musica_id
ORDER BY `usuario`, `nome`;
