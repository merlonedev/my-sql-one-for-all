CREATE VIEW songs_by_artists_and_albuns AS
    SELECT
        COUNT(name) AS cancoes,
        COUNT(DISTINCT artist_id) AS artistas,
        COUNT(DISTINCT album_id) AS albuns
    FROM
        SpotifyClone.songs;
