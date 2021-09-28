CREATE VIEW SpotifyClone.estatisticas_musicais AS
    SELECT 
        COUNT(s.song_id) AS cancoes,
        COUNT(DISTINCT a.artist) AS artistas,
        COUNT(DISTINCT al.album) AS albuns
    FROM
        SpotifyClone.songs AS s
            JOIN
        SpotifyClone.artists AS a ON s.artist_id = a.artist_id
            JOIN
        SpotifyClone.albuns AS al ON al.album_id = s.album_id;
