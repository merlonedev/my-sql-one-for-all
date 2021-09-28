-- Desafio 2

CREATE VIEW estatisticas_musicais AS
SELECT 
(SELECT 
    COUNT(music_id)
FROM
    musics) AS cancoes,
(SELECT 
    COUNT(artist_id)
FROM
    artistas) AS artistas,
(SELECT 
    COUNT(album_id)
FROM
    albums) AS albuns;
