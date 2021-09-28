CREATE VIEW top_2_hits_do_momento AS
SELECT 
ca.nome_cancao AS cancao, COUNT(um.musica_id) AS reproducoes
FROM
USUARIO_MUSICAS um
JOIN
CANCOES ca ON ca.cancoes_id = um.musica_id
GROUP BY ca.nome_cancao
ORDER BY reproducoes DESC , cancao ASC
LIMIT 2;
