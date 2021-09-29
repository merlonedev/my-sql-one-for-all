DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN
    SELECT
        a.nome AS `artista`,
        ab.titulo AS `album`
    FROM
        SpotifyClone.albuns AS `ab`
    JOIN SpotifyClone.artistas AS `a`
    ON ab.artista_id = a.id
    WHERE UCASE(a.nome) = UCASE(nome_artista)
    ORDER BY `album`;
END $$

DELIMITER ;
