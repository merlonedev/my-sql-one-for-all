CREATE VIEW cancoes_premium AS
SELECT m.musica_nome as 'nome', COUNT(h.usuario_id) AS `reproducoes` from SpotifyClone.Historico as h
INNER JOIN SpotifyClone.Musica AS m ON m.musica_id = h.musica_id
INNER JOIN SpotifyClone.Usuario AS us ON us.usuario_id = h.usuario_id
WHERE plano_id = 2 or plano_id = 3
GROUP BY `nome`
ORDER BY `nome`;
