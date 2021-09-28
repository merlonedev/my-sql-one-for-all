CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.username AS usuario, s.song_name AS nome
    FROM
        SpotfiyClone.users AS u
            INNER JOIN
        SpotfiyClone.histories AS h ON h.user_id = u.user_id
			INNER JOIN
		SpotfiyClone.songs as s on s.song_id = h.song_id
        order by u.username ASC, s.song_name ASC;
