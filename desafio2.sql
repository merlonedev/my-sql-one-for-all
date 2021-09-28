CREATE VIEW estatisticas_musicais AS
SELECT COUNT(so.song_id) AS 'cancoes',
  (
    SELECT COUNT(ar.artist_id)
    FROM SpotifyClone.artists AS ar
  ) AS 'artistas',
  (
    SELECT COUNT(ab.album_id)
    FROM SpotifyClone.albums AS ab
  ) AS 'albuns'
FROM SpotifyClone.songs AS so;
