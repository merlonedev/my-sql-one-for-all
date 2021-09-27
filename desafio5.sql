CREATE VIEW top_2_hits_do_momento AS
	SELECT s.song cancao,
    (SELECT COUNT(h.song_id) FROM historic h
		WHERE h.song_id = s.song_id) reproducoes
	FROM songs s
    ORDER BY reproducoes DESC, cancao LIMIT 2;
