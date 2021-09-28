CREATE VIEW estatisticas_musicais AS
SELECT        
(SELECT COUNT(*) FROM songs) cancoes,
(SELECT COUNT(*) FROM artists) artistas,
(SELECT COUNT(*) FROM albums) albuns;
