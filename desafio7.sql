CREATE VIEW perfil_artistas AS
SELECT 
    a.nome AS `artista`,
    al.album AS `album`,
    COUNT(s.id_usuario) AS `seguidores`
FROM
    Artistas AS a
        JOIN
    Albuns AS al ON a.id = al.id_artista
        JOIN
    seguindoArtistas AS s ON s.id_artista = a.id
GROUP BY a.nome , al.album
ORDER BY `seguidores` DESC, `artista`, `album`;
