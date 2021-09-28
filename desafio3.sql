CREATE VIEW historico_reproducao_usuarios AS
    (SELECT 
        u.usuario, m.musica `nome`
    FROM
        SpotifyClone.usuarios u
            JOIN
        SpotifyClone.historico_musicas hm ON hm.id_usuario = u.id_usuario
            JOIN
        SpotifyClone.musicas m ON m.id_musica = hm.id_musica
    ORDER BY 1 , 2);
