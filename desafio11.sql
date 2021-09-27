CREATE VIEW cancoes_premium AS
	SELECT s.song nome,
		(SELECT COUNT(*) FROM historic h
        WHERE h.user_id IN (2, 3)
        AND h.song_id = s.song_id) reproducoes
	FROM songs s
    WHERE (SELECT COUNT(*) FROM historic h
        WHERE h.user_id IN (2, 3)
        AND h.song_id = s.song_id) > 0
	ORDER BY nome;
