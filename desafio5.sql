CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancao, COUNT(cru.usuario_id) reproducoes FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.cancoes_reproduzidas_usuario AS cru
ON c.cancao_id = cru.cancao_id
GROUP BY c.cancao
ORDER BY reproducoes DESC, c.cancao
LIMIT 2;