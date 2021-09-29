CREATE VIEW historico_reproducao_usuarios AS 
SELECT 
    U.USER_NAME AS usuario, S.SONG_NAME AS nome
FROM
    SpotifyClone.History AS H
        INNER JOIN
    SpotifyClone.UserDetail AS U ON U.USER_ID = H.USER_ID
        INNER JOIN
    SpotifyClone.Songs AS S ON S.SONG_ID = H.SONG_ID
ORDER BY usuario , nome;
