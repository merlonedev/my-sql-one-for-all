  CREATE VIEW estatisticas_musicais AS
  SELECT 
    (SELECT COUNT(*) FROM SpotifyClone.cancao) AS cancoes,
    (SELECT COUNT(*) FROM SpotifyClone.artista) AS artistas,
    COUNT(al.album_id) AS albuns
  FROM SpotifyClone.album as al;
