CREATE VIEW estatisticas_musicais AS
    SELECT 
    COUNT(id) AS `cancoes`,
    (SELECT 
            COUNT(id)
        FROM
            Artistas) AS `artistas`,
    (SELECT 
            COUNT(id)
        FROM
            Albuns) AS `albuns`
FROM
    Musicas
