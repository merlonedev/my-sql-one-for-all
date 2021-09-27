CREATE VIEW historico_reproducao_usuarios AS
SELECT
U.usuario AS usuario,
S.song_name AS nome
FROM SpotifyClone.usuario U
JOIN SpotifyClone.historicoMusicas HM
ON U.usuario_id = HM.usuario_id
JOIN SpotifyClone.songs S
ON HM.song_id = S.song_id
ORDER BY `usuario`, `nome`;
