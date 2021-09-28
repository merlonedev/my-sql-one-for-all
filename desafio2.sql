CREATE VIEW estatisticas_musicais AS 
	SELECT
		COUNT(DISTINCT m.nome) AS 'cancoes',
        COUNT(DISTINCT a.nome) AS 'artistas',
        COUNT(DISTINCT al.nome) AS 'albuns'
	FROM
		musicas m,
        artistas a,
        albuns al;
