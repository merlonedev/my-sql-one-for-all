CREATE VIEW estatisticas_musicais AS
    SELECT 
        (SELECT 
                COUNT(Song_ID)
            FROM
                songs) AS 'cancoes',
        (SELECT 
                COUNT(Artist_ID)
            FROM
                artists) AS 'artistas',
        (SELECT 
                COUNT(Album_ID)
            FROM
                albums) AS 'albuns';
                