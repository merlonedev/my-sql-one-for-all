CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.nome AS usuario,
m.nome AS nome
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.musica AS m
INNER JOIN SpotifyClone.usuario_musica AS um
ON m.id_musica = um.id_musica AND u.id_usuario = um.id_usuario
ORDER BY usuario, nome;
