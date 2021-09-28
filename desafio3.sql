CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.nome AS usuario, m.nome AS nome
    FROM
        historico_reproducao AS hr
            INNER JOIN
        usuarios AS u ON u.usuario_id = hr.usuario_id
            INNER JOIN
        musicas AS m ON m.musica_id = hr.musica_id
    ORDER BY `usuario` , `nome`;
