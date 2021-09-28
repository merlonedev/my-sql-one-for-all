CREATE VIEW cancoes_premium AS
	SELECT 
		so.song_name AS 'nome',
        COUNT(rh.song_id) AS 'reproducoes'
	FROM SpotifyClone.reproduction_history AS rh
    JOIN SpotifyClone.song AS so ON so.song_id = rh.song_id
    JOIN SpotifyClone.user AS u ON u.user_id = rh.user_id
    WHERE u.plan_id = 2 OR u.plan_id = 3
    GROUP BY nome
    ORDER BY nome;
    