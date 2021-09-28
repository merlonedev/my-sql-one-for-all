CREATE VIEW top_2_hits_do_momento AS
    SELECT
        m.titulo AS `cancao`,
        COUNT(hm.usuario_id) AS `reproducoes`
    FROM
        SpotifyClone.historico_musicas AS `hm`
    JOIN SpotifyClone.musicas AS `m`
    ON hm.musica_id = m.id
    GROUP BY `cancao`
    ORDER BY `reproducoes` DESC, `cancao`
    LIMIT 2;
