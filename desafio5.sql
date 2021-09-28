CREATE VIEW top_2_hits_do_momento AS
SELECT 
 so.song_name AS 'cancao', 
 COUNT(*) AS 'reproducoes'
FROM SpotifyClone.reproduction_history AS rh
JOIN SpotifyClone.song AS so ON so.song_id = rh.song_id
JOIN SpotifyClone.user AS u ON u.user_id = rh.user_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
    