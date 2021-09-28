CREATE VIEW cancoes_premium AS
SELECT 
    m.nome AS `nome`, COUNT(uh.usuario_id) AS `reproducoes`
FROM
    SpotifyClone.Usuario_Historico AS uh
        JOIN
    SpotifyClone.Usuarios AS u ON u.id = uh.usuario_id
        JOIN
    SpotifyClone.Musicas AS m ON m.id = uh.musica_id
        JOIN
    SpotifyClone.Planos AS p ON p.id = u.plano_id
WHERE
    p.id IN (2 , 3)
GROUP BY `nome`
ORDER BY `nome`;
