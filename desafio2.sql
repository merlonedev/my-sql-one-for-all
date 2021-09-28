CREATE VIEW estatisticas_musicais AS
    SELECT 
        (SELECT 
                COUNT(*)
            FROM
                tb_cancoes) AS 'cancoes',
        (SELECT 
                COUNT(*)
            FROM
                tb_artistas) AS 'artistas',
        COUNT(*) AS 'albuns'
    FROM
        tb_albuns;
