CREATE VIEW estatisticas_musicais AS
  SELECT 
    COUNT(Id) AS 'cancoes',
    COUNT(DISTINCT Id_Artista) AS 'artistas', -- precisa ter o distinct pra não repetir números
    COUNT(DISTINCT Id_Album) AS 'albuns'
    FROM SpotifyClone.Cancoes;
SELECT * FROM estatisticas_musicais;