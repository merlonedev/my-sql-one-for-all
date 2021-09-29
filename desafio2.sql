USE SpotifyClone;

  CREATE VIEW estatisticas_musicais AS
  SELECT 
    (SELECT COUNT(*) FROM cancao) AS cancoes,
    (SELECT COUNT(*) FROM artista) AS artistas,
    COUNT(al.album_id) AS albuns
  FROM album as al;
    