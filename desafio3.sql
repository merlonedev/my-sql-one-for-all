CREATE VIEW historico_reproducao_usuarios AS SELECT 
u.usuario AS usuario,
m.musica AS nome
FROM Usuario AS u
JOIN Historico_de_reproducao AS hd
ON hd.usuario_id = u.usuario_id
JOIN Musicas AS m
ON m.musica_id = hd.musica_id
ORDER BY u.usuario, m.musica;
