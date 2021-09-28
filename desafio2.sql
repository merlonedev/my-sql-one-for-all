CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(*) AS cancoes,
        (SELECT 
                COUNT(*)
            FROM
                SpotfiyClone.artists) AS artistas,
        (SELECT 
                COUNT(*)
            FROM
                SpotfiyClone.albums) AS albuns
    FROM
        SpotfiyClone.songs;
