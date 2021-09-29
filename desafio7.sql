CREATE VIEW perfil_artistas AS
  SELECT A.artist_name AS artista,
    AL.album_name AS album,
    COUNT(UA.user_ID) AS seguidores
  FROM Artists A 
  JOIN Albums AL ON A.artist_ID = AL.artist_ID
  JOIN FollowUsers_Artists UA ON A.artist_ID = UA.artist_ID
  GROUP BY `artista`, `album`
  ORDER BY `seguidores` DESC, `artista`, `album`;
