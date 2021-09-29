CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(cancao_id) AS cancoes,
        (SELECT 
                COUNT(artista_name)
            FROM
                SpotifyClone.artistas) AS artistas,
        (SELECT 
                COUNT(album_name)
            FROM
                SpotifyClone.albuns) AS albuns
    FROM
        SpotifyClone.cancoes;
