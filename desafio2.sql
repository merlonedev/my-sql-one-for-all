CREATE VIEW estatisticas_musicais AS 
SELECT 
(SELECT COUNT(cancao_id) FROM SpotifyClone.Cancoes) AS 'cancoes',
(SELECT COUNT(artista_id) FROM SpotifyClone.Artista) AS 'artistas',
(SELECT COUNT(album_id) FROM SpotifyClone.Album) AS 'albuns';

SELECT 
    *
FROM
    estatisticas_musicais;
