CREATE VIEW estatisticas_musicais AS
    SELECT 
        (SELECT 
                COUNT(song_id)
            FROM
                songs) AS cancoes,
        (SELECT 
                COUNT(artist_id)
            FROM
                artists) AS artistas,
        (SELECT 
                COUNT(album_id)
            FROM
                albums) AS albuns;
