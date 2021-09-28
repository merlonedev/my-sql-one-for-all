CREATE VIEW cancoes_premium AS
SELECT 
m.nome AS nome, COUNT(hr.musica_id) AS reproducoes
FROM
historico_reproducao AS hr
INNER JOIN
musicas AS m ON m.musica_id = hr.musica_id
INNER JOIN
usuarios AS u ON u.usuario_id = hr.usuario_id
WHERE
u.plano_id IN (2 , 3)
GROUP BY `nome`
ORDER BY `nome`;
