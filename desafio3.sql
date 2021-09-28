CREATE VIEW historico_reproducao_usuarios AS 
SELECT 
u.name AS usuario,
s.title As nome
FROM
SpotifyClone.users AS u 
JOIN
SpotifyClone.history AS h ON u.user_id = h.user_id
JOIN
SpotifyClone.songs AS s ON s.song_id = h.song_id
ORDER BY usuario, nome;