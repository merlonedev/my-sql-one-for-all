CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(nome_cancao) AS cancoes,
        (SELECT 
                COUNT(nome_artista)
            FROM
                ARTISTAS) AS artistas,
        (SELECT 
                COUNT(nome_album)
            FROM
                ALBUNS) AS albuns
    FROM
        CANCOES;
