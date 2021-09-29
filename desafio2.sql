CREATE VIEW estatisticas_musicais AS
  SELECT 
   COUNT(Id.Cancoes) AS 'cancoes',
   COUNT(DISTINCT Id_Artista) AS 'artistas', -- precisa ter o distinct pra não repetir números
   COUNT(DISTINCT Id_Album) AS 'albuns'
   FROM SpotifyClone.Cancoes;
