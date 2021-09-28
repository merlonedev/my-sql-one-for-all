CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        U.usuario_nome AS usuario, C.cancao_nome AS nome
    FROM
        SpotifyClone.Usuario AS U
            INNER JOIN
        SpotifyClone.Historico AS H ON U.usuario_id = H.usuario_id
            INNER JOIN
        SpotifyClone.Cancoes C ON H.cancao_id = C.cancao_id
    ORDER BY U.usuario_nome , C.cancao_nome;
