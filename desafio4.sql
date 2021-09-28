CREATE VIEW top_3_artistas AS
    SELECT 
        a.artist_name AS artista, COUNT(user_id) as seguidores
        from
        SpotfiyClone.artists AS a
            INNER JOIN
        SpotfiyClone.user_follow AS uf ON a.artist_id = uf.artist_id 
        Group by a.artist_name
        Order by COUNT(user_id) DESC, a.artist_name ASC
        limit 3;
