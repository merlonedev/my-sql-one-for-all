CREATE VIEW perfil_artistas AS
SELECT
A.artist_name AS "artista",
C.album_name AS "album",
COUNT(F.user_id) AS "seguidores"
FROM SpotifyClone.artists AS A
INNER JOIN SpotifyClone.albuns AS C ON A.artist_id = C.artist_id
INNER JOIN SpotifyClone.follower AS F ON F.artist_id = A.artist_id
GROUP BY A.artist_name, C.album_name
ORDER BY seguidores DESC, artista, album;
