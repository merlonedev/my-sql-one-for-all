CREATE VIEW estatisticas_musicais AS
SELECT 
    COUNT(SONG_ID) AS 'cancoes',
    COUNT(DISTINCT ARTIST_ID) AS 'artistas',
    COUNT(DISTINCT ALBUM_ID) AS 'albuns'
FROM
    SpotifyClone.Songs;
