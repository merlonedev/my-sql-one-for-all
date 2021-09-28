CREATE VIEW cancoes_premium AS
SELECT 
    m.nome AS `nome`, COUNT(uh.usuario_id) AS `reproducoes`
FROM
    usuario_historico AS uh
        JOIN
    usuarios AS u ON u.id = uh.usuario_id
        JOIN
    musicas AS m ON m.id = uh.musica_id
        JOIN
    planos AS p ON p.id = u.plano_id
WHERE
    p.id IN (2 , 3)
GROUP BY `nome`
ORDER BY `nome`;
