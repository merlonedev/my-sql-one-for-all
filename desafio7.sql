CREATE VIEW perfil_artistas AS
SELECT 
    a.nome AS `artista`,
    al.nome AS `album`,
    COUNT(us.usuario_id) AS `seguidores`
FROM
    artistas AS a
        JOIN
    albuns AS al ON al.artista_id = a.id
        JOIN
    usuario_seguindo AS us ON us.artista_id = a.id
GROUP BY `album` , `artista`
ORDER BY `seguidores` DESC , `artista` , `album`;
