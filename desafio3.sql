DROP VIEW IF EXISTS SpotifyClone.historico_reproducao_usuarios;

CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
    SELECT 
        u.usuario AS 'usuario', c.cancao AS 'nome'
    FROM
        SpotifyClone.usuario AS u
            INNER JOIN
        SpotifyClone.usuario_historico AS us ON u.id = us.usuario_id
            INNER JOIN
        SpotifyClone.cancao AS c ON us.cancao_id = c.id
    ORDER BY u.usuario , c.cancao;

SELECT 
    *
FROM
    SpotifyClone.historico_reproducao_usuarios;
