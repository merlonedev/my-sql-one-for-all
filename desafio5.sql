CREATE VIEW top_2_hits_do_momento AS
SELECT C.nome AS cancao, COUNT(UOC.id_usuario) AS reproducoes
FROM SpotifyClone.usuario_ouviu_cancao UOC
INNER JOIN SpotifyClone.cancao C
ON C.id_cancao = UOC.id_cancao
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
