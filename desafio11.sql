CREATE VIEW cancoes_premium AS
    SELECT 
        m.musica AS nome, COUNT(*) AS reproducoes
    FROM
        SpotifyClone.historico_musicas hm
            JOIN
        SpotifyClone.musicas m ON m.id_musica = hm.id_musica
    WHERE
        hm.id_usuario IN (SELECT 
                id_usuario
            FROM
                SpotifyClone.usuarios
            WHERE
                id_plano IN (2 , 3))
    GROUP BY 1
    ORDER BY 1;
