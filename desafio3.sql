CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        U.usuario AS 'usuario', C.cancao AS 'nome'
    FROM
        SpotifyClone.usuarios AS U
            INNER JOIN
        SpotifyClone.usuario_historico_reproducoes AS UH ON UH.id_usuario = U.usuario_id
            INNER JOIN
        SpotifyClone.cancoes AS C ON C.cancao_id = UH.cancao_id
    ORDER BY usuario , cancao;
