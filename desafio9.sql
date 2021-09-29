DELIMITER $

CREATE PROCEDURE SpotifyClone.albuns_do_artista(IN artist_name VARCHAR(100))

BEGIN
    (SELECT
        ar.name AS `artista`,
        al.name AS `album`
    FROM
        SpotifyClone.artists AS ar
            JOIN
        SpotifyClone.albums AS al ON ar.id = al.artist_id
    WHERE
        ar.name = artist_name
    ORDER BY  `album`);

END $

DELIMITER ;

CALL SpotifyClone.albuns_do_artista('Walter Phoenix');
