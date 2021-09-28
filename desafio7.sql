CREATE VIEW perfil_artistas AS
SELECT 
    a.nome AS `artista`,
    al.nome AS `album`,
    COUNT(ua.usuario_id) AS `seguidores`
FROM
    SpotifyClone.Artistas AS a
        JOIN
    SpotifyClone.Albuns AS al ON al.artista_id = a.id
        JOIN
    SpotifyClone.Usuario_Artista AS ua ON ua.artista_id = a.id
GROUP BY `album` , `artista`
ORDER BY `seguidores` DESC , `artista` , `album`;
