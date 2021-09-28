CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.usuario, m.musica AS nome
    FROM
        Historico_reproducao AS sa
            JOIN
        Usuario AS u ON u.id = sa.usuario_id
            JOIN
        Musicas AS m ON m.id = sa.musica_id
    ORDER BY u.usuario ASC , m.musica ASC;
