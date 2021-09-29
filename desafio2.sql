CREATE VIEW estatisticas_musicais AS SELECT 
COUNT(SpotifyClone.musica_id) AS cancoes, 
COUNT(DISTINCT SpotifyClone.artista_id) AS artistas, 
COUNT(DISTINCT SpotifyClone.album_id) AS albuns 
FROM SpotifyClone.Musicas;
