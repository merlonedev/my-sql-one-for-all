CREATE VIEW historico_reproducao_usuarios AS
  SELECT 
    u.usuario, c.cancao AS nome
  FROM
    historico h
      JOIN
    user u ON h.user_id = u.id
      JOIN
    cancoes c ON c.id = h.cancoes_id
  ORDER BY usuario ASC , nome ASC;
