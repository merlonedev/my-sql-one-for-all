CREATE VIEW top_3_artistas AS
    SELECT 
        (SELECT 
                t2.Artist
            FROM
                artists AS t2
            WHERE
                t1.Artist_ID = t2.Artist_ID) AS 'artista',
        COUNT(User_ID) AS 'seguidores'
    FROM
        user_artists_listened AS t1
    GROUP BY Artist_ID
    ORDER BY 2 DESC, 1
	LIMIT 3;
