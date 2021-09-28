CREATE VIEW top_2_hits_do_momento AS
(SELECT 
  m.nome AS 'cancao', COUNT(uh.musica_id) AS 'reproducoes'
FROM
  SpotifyClone.musicas AS m
    JOIN
  SpotifyClone.usuario_historico AS uh ON uh.musica_id = m.musica_id
GROUP BY m.nome
ORDER BY COUNT(uh.musica_id) DESC , m.nome
LIMIT 2);
