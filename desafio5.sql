CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        (SELECT 
                t2.Song
            FROM
                songs AS t2
            WHERE
                t1.Song_ID = t2.Song_ID) AS 'cancao',
        COUNT(User_ID) AS 'reproducoes'
    FROM
        user_songs_listened AS t1
    GROUP BY Song_ID
    ORDER BY 2 DESC , 1
    LIMIT 2;
