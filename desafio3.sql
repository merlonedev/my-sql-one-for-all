CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
    SELECT 
        u.usuario, c.cancao
    FROM
        SpotifyClone.usuarios AS u
            INNER JOIN
        SpotifyClone.usuario_cancoes AS uc ON u.id = uc.usuario_id
            INNER JOIN
        SpotifyClone.cancoes AS c ON uc.cancao_id = c.id
    ORDER BY u.usuario;
