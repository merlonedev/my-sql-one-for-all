CREATE VIEW top_3_artistas AS 
    (SELECT ar.artista,
         
        (SELECT COUNT(*)
        FROM SpotifyClone.usuarios_seguindo AS us
        WHERE us.id_artista = ar.id_artista) AS seguidores
        FROM SpotifyClone.artistas AS ar
        ORDER BY  2 DESC, 1 LIMIT 3); 