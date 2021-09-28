CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(cancoes_id) AS 'cancoes',
        COUNT(DISTINCT cancao_name) AS 'artistas',
        COUNT(DISTINCT album_id) AS 'albuns'
    FROM
        SpotifyClone.cancoes;
