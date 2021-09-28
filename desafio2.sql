CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(M.musica_id) AS 'cancoes',
        COUNT(DISTINCT AR.artista_id) AS 'artistas',
        COUNT(DISTINCT AL.album_id) AS 'albuns'
    FROM
        SpotifyClone.musicas AS M
            JOIN
        SpotifyClone.album AS AL ON M.album_id = AL.album_id
            JOIN
        SpotifyClone.artistas AS AR ON AL.artista_id = AR.artista_id;
