CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        (SELECT 
                t2.UserName
            FROM
                users AS t2
            WHERE
                t1.User_ID = t2.User_ID) AS 'usuario',
        (SELECT 
                t2.Song
            FROM
                songs AS t2
            WHERE
                t1.Song_ID = t2.Song_ID) AS 'nome'
    FROM
        user_songs_listened AS t1
    ORDER BY 1 , 2;
