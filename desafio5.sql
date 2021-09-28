CREATE VIEW top_2_hits_do_momento AS
    SELECT
        C.cancao AS 'cancao', COUNT(U.usuario) AS 'reproducoes'
    FROM
        SpotifyClone.usuarios U
        JOIN SpotifyClone.usuario_historico_reproducoes UH ON UH.id_usuario = U.usuario_id
        JOIN SpotifyClone.cancoes C ON C.cancao_id = UH.cancao_id
    GROUP BY cancao
    ORDER BY reproducoes DESC, cancao
    LIMIT 2;
