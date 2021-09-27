CREATE VIEW estatisticas_musicais AS
  SELECT
    (SELECT COUNT(*) FROM cancoes) AS cancoes,
    (SELECT COUNT(*) FROM artista) AS artistas,
    (SELECT COUNT(*) FROM album) AS albuns;
