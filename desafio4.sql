CREATE VIEW top_3_artistas AS
	SELECT a.artist artista,
	(SELECT COUNT(ua.user_id) FROM user_artist ua
		WHERE ua.artist_id = a.artist_id) seguidores
	FROM artists a
	ORDER BY seguidores DESC, artista
    LIMIT 3;
