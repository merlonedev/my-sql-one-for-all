CREATE VIEW estatisticas_musicais AS
  SELECT COUNT(*) AS cancoes,
    (SELECT COUNT(*) FROM Artists) AS artistas,
    (SELECT COUNT(*) FROM Albums) AS albuns
  FROM Songs;
