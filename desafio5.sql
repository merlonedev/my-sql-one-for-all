CREATE VIEW top_2_hits_do_momento AS
SELECT
c.cancao AS 'cancao',
COUNT(uc.cancao_id) AS 'reproducoes'
FROM SpotifyClone.usuario_cancao AS uc
INNER JOIN SpotifyClone.cancao AS c
ON uc.cancao_id = c.cancao_id
GROUP BY uc.cancao_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
