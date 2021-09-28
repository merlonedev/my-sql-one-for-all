CREATE VIEW top_2_hits_do_momento AS
SELECT
m.nome AS cancao,
COUNT(ua.id_usuario) AS reproducoes
FROM SpotifyClone.musica AS m
INNER JOIN SpotifyClone.usuario_musica AS ua ON m.id_musica = ua.id_musica
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
