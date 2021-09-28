CREATE VIEW historico_reproducao_usuarios AS
SELECT u.user_name AS usuario,
m.music_name AS nome
FROM SpotifyClone.users AS u
INNER JOIN `history` AS h ON u.user_id = h.user_id
INNER JOIN musics AS m ON m.music_id = h.music_id
ORDER BY u.user_name, m.music_name;
