CREATE VIEW cancoes_premium AS
SELECT C.nome AS nome,
COUNT(UOC.id_usuario) AS reproducoes
FROM SpotifyClone.usuario_ouviu_cancao UOC
INNER JOIN SpotifyClone.usuario U
ON U.id_usuario = UOC.id_usuario
INNER JOIN SpotifyClone.cancao C
ON C.id_cancao = UOC.id_cancao
WHERE U.id_plano IN (2, 3)
GROUP BY UOC.id_cancao
ORDER BY nome;
