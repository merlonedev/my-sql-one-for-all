CREATE VIEW historico_reproducao_usuarios AS
SELECT U.nome AS usuario, C.nome AS nome
FROM SpotifyClone.usuario_ouviu_cancao UOC
INNER JOIN SpotifyClone.usuario U
ON U.id_usuario = UOC.id_usuario
INNER JOIN SpotifyClone.cancao C
ON C.id_cancao = UOC.id_cancao
ORDER BY U.nome, C.nome;
