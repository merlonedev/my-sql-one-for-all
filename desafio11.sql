CREATE VIEW cancoes_premium AS
    SELECT 
        Song AS 'nome', COUNT(t1.User_ID) AS 'reproducoes'
    FROM
        user_songs_listened AS t1
            JOIN
        songs AS t2 ON t1.Song_ID = t2.Song_ID
            JOIN
        users AS t3 ON t1.User_ID = t3.User_ID
    WHERE
        Plan_ID IN (2 , 3)
    GROUP BY song
    ORDER BY 1;
