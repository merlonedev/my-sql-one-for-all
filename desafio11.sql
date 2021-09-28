SELECT m.musica_nome as 'nome', COUNT(h.usuario_id) AS `reproducoes` from spotifyclone.historico as h
INNER JOIN spotifyclone.musica AS m ON m.musica_id = h.musica_id
INNER JOIN spotifyclone.usuario AS us ON us.usuario_id = h.usuario_id
WHERE plano_id = 2 or plano_id = 3
GROUP BY `nome`
ORDER BY `nome`;