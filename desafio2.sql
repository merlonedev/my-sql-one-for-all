CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(M.musica_id) AS 'cancoes',
        COUNT(AR.artista_id) AS 'artistas',
        COUNT(AL.album_id) AS 'albuns'
    FROM
        SpotifyClone.musicas AS M
            INNER JOIN
        SpotifyClone.album AS AL ON M.album_id = AL.album_id
            INNER JOIN
        SpotifyClone.artistas AS AR ON AL.artista_id = AR.artista_id;
