CREATE VIEW top_2_hits_do_momento AS 
    (SELECT m.musica AS cancao,
         
        (SELECT COUNT(*)
        FROM SpotifyClone.historico_musicas hm
        WHERE hm.id_musica = m.id_musica ) AS reproducoes
        FROM SpotifyClone.musicas m
        ORDER BY  2 DESC, 1 LIMIT 2);
