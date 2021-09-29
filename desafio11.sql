CREATE VIEW cancoes_premium AS
SELECT 
b.nome_cancao AS nome, COUNT(nome_cancao) AS reproducoes
FROM
USUARIO_MUSICAS a
JOIN
CANCOES b ON a.musica_id = b.cancoes_id
JOIN
USUARIO c ON c.usuario_id = a.usuario_id
WHERE
c.plano_id IN (2 , 3)
GROUP BY b.nome_cancao
ORDER BY nome;
