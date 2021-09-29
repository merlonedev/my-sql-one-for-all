CREATE VIEW cancoes_premium AS
    (SELECT 
        m.nome AS 'nome', COUNT(uh.musica_id) AS 'reproducoes'
    FROM
        SpotifyClone.usuario_historico AS uh
            JOIN
        SpotifyClone.usuarios AS u ON u.usuario_id = uh.usuario_id
            JOIN
        SpotifyClone.musicas AS m ON m.musica_id = uh.musica_id
            JOIN
        SpotifyClone.planos AS p ON p.plano_id = u.plano_id
    WHERE
        p.plano_id IN (2 , 3)
    GROUP BY m.nome
    ORDER BY m.nome);
