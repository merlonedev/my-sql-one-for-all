CREATE VIEW cancoes_premium AS
    SELECT 
        mu.nome_musica AS nome, COUNT(*) AS reproducoes
    FROM
        musicas_reproduzidas AS mr
            JOIN
        musicas AS mu ON mr.musica_id = mu.musica_id
            JOIN
        usuarios AS us ON mr.usuario_id = us.usuario_id
            JOIN
        planos AS pl ON us.plano_id = pl.plano_id
    WHERE
        pl.nome_plano IN ('universitário' , 'familiar')
    GROUP BY nome
    ORDER BY nome;
