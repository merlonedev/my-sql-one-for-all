CREATE VIEW top_3_artistas AS
    SELECT 
        si.singer_name AS 'artista',
        COUNT(*) AS 'seguidores'
    FROM
        SpotifyClone.singer_followers as sf
	JOIN SpotifyClone.singer AS si ON si.singer_id = sf.singer_id
    JOIN SpotifyClone.user AS u ON u.user_id = sf.user_id
    GROUP BY artista
    ORDER BY seguidores DESC, artista
    LIMIT 3;
