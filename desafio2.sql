-- Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
-- *A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
-- *A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
-- *A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".
CREATE VIEW estatisticas_musicais AS
    SELECT COUNT(cancao_id) AS `cancoes`,
    (SELECT COUNT(artista_id) FROM SpotifyClone.artistas) AS `artistas`,
    COUNT(DISTINCT album_id) AS `albuns`
    FROM SpotifyClone.cancoes;
