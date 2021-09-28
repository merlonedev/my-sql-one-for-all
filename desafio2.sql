DROP VIEW IF EXISTS SpotifyClone.estatisticas_musicais;

CREATE VIEW SpotifyClone.estatisticas_musicais AS
    SELECT 
        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.cancao) AS 'cancoes',
        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.artista) AS 'artistas',
        (SELECT 
                COUNT(*)
            FROM
                SpotifyClone.album) AS 'albuns';

SELECT 
    *
FROM
    SpotifyClone.estatisticas_musicais;
