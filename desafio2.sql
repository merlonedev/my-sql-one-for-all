CREATE VIEW estatisticas_musicais AS
    SELECT
        m.cancoes,
        a.artistas,
        ab.albuns
    FROM
        (SELECT COUNT(*) AS `cancoes` FROM SpotifyClone.musicas) AS `m`
        JOIN (SELECT COUNT(*) AS `artistas` FROM SpotifyClone.artistas) AS `a`
        JOIN (SELECT COUNT(*) AS `albuns` FROM SpotifyClone.albuns) AS `ab`;
