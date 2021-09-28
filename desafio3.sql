CREATE VIEW historico_reproducao_usuarios AS
SELECT 
u.username AS usuario, s.song_name AS nome
FROM
SpotifyClone.users AS u
INNER JOIN
SpotifyClone.histories AS h ON h.user_id = u.user_id
INNER JOIN
SpotifyClone.songs as s on s.song_id = h.song_id
order by u.username ASC, s.song_name ASC;
