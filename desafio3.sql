use SpotifyClone;

CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.usuario AS usuario, c.cancao AS nome
    FROM
        usuario AS u
            INNER JOIN
        usuario_historico AS us ON u.id = us.usuario_id
            INNER JOIN
        cancao AS c ON us.cancao_id = c.id
    ORDER BY u.usuario , c.cancao;

SELECT 
    *
FROM
    historico_reproducao_usuarios;
