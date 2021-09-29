CREATE VIEW perfil_artistas AS
    SELECT 
        t3.Artist AS 'artista',
        t2.Album AS 'album',
        COUNT(User_ID) AS 'seguidores'
    FROM
        user_artists_listened AS t1
            JOIN
        albums AS t2 ON t1.Artist_ID = t2.Artist_ID
            JOIN
        artists AS t3 ON t1.Artist_ID = t3.Artist_ID
    GROUP BY Artist , Album
    ORDER BY 3 DESC , 1 , 2;
