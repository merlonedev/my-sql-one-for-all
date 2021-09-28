CREATE VIEW perfil_artistas AS
    SELECT 
        at.artist_name AS artista,
        al.album_name AS album,
        COUNT(uf.artist_id) AS seguidores
    FROM
        albums al
            INNER JOIN
        artists at ON al.artist_id = at.artist_id
            INNER JOIN
        user_followage uf ON at.artist_id = uf.artist_id
    GROUP BY at.artist_name , al.album_name
    ORDER BY COUNT(uf.artist_id) DESC , at.artist_name , al.album_name;
