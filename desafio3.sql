CREATE VIEW historico_reproducao_usuarios AS
SELECT u.nome AS `usuario`,
s.nome AS `nome`
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.hist_rep AS h
ON u.usuario_id = h.usuario_id
INNER JOIN SpotifyClone.musica AS s
ON h.musica_id = s.musica_id
ORDER BY `usuario`, `nome`;
