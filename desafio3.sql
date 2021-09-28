CREATE VIEW historico_reproducao_usuarios AS (
	SELECT u.username AS 'usuario',
    s.song_name AS 'nome'
    FROM users u
    JOIN user_songs_history us ON us.user_id = u.user_id
    JOIN songs s ON s.song_id = us.song_id
);