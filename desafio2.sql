CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(DISTINCT t.track) AS `cancoes`,
        COUNT(DISTINCT a.artist) AS `artistas`,
        COUNT(DISTINCT al.album) AS `albuns`
    FROM
        SpotifyClone.Artists a
            INNER JOIN
        SpotifyClone.Tracks t ON a.artist_id = t.artist_id
            INNER JOIN
        SpotifyClone.Albums al ON a.artist_id = al.artist_id;
