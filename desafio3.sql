CREATE VIEW estatisticas_musicais AS
  SELECT 
    u.nome AS usuario,
    c.cancao_title AS nome
  FROM SpotifyClone.usuario as u, SpotifyClone.historico as h
  INNER JOIN SpotifyClone.cancao as c ON c.cancao_id = h.cancao_id
  WHERE u.user_id = h.user_id
  ORDER BY u.nome, c.cancao_title;
