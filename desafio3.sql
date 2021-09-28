CREATE VIEW historico_reproducao_usuarios AS SELECT 
    u.usuario_nome as usuario,
    c.cancao_titulo as nome
FROM
    SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.histor_reprod AS h
ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancoes AS c
ON c.cancao_id = h.cancao_id
ORDER BY u.usuario_nome, c.cancao_titulo;
