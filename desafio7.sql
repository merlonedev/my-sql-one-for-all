CREATE VIEW perfil_artistas AS
    SELECT 
        a.artist_name as artista,
        al.album_name as album,
        COUNT(user_id) as seguidores
    FROM
        SpotifyClone.artists as a
        inner join SpotifyClone.albums as al on al.artist_id = a.artist_id
        inner join SpotifyClone.user_follow as uf on a.artist_id = uf.artist_id
        Group By a.artist_name, al.album_name
        Order By COUNT(user_id) DESC, a.artist_name ASC, al.album_name ASC;
