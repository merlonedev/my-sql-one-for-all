CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(DISTINCT mu.nome_musica) AS cancoes,
        COUNT(DISTINCT ar.nome_artista) AS artistas,
        COUNT(DISTINCT al.nome_album) AS albuns
    FROM
        musicas AS mu
            JOIN
        albuns AS al ON al.album_id = mu.album_id
            JOIN
        artistas AS ar ON al.artista_id = ar.artista_id;
