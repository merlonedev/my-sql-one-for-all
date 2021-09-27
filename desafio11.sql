CREATE VIEW cancoes_premium AS
SELECT
S.song_name AS nome,
COUNT(HM.song_id) AS reproducoes
FROM SpotifyClone.songs S
JOIN SpotifyClone.historicoMusicas HM
ON S.song_id = HM.song_id
JOIN SpotifyClone.usuario U
ON U.usuario_id = HM.usuario_id
JOIN SpotifyClone.planos P
ON U.plano_id = P.plano_id
WHERE P.plano_id IN (2, 3)
GROUP BY `nome`
ORDER BY `nome`;
