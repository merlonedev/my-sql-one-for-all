CREATE VIEW top_3_artistas AS
  SELECT A.artist_name AS artista,
    COUNT(UA.user_ID) AS seguidores
  FROM Artists A
  JOIN FollowUsers_Artists UA ON A.artist_ID = UA.artist_ID
  GROUP BY `artista`
  ORDER BY `seguidores` DESC, `artista`
  LIMIT 3;
