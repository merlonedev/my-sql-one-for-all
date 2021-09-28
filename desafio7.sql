CREATE VIEW perfil_artistas AS
    (SELECT 
        a.artist_name AS 'artista',
        al.album_name AS 'album',
        COUNT(uf.artist_id) AS 'seguidores'
    FROM
        artists a
            JOIN
        albums al ON al.artist_id = a.artist_id
            JOIN
        user_followage uf ON uf.artist_id = a.artist_id
    GROUP BY a.artist_name , al.album_name
    ORDER BY COUNT(uf.artist_id) DESC , a.artist_name ASC , al.album_name ASC);
