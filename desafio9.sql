USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(artista_selecionado varchar(100))
BEGIN
select
ar.artista as artista,
al.album as album
from artista as ar
inner join album as al on ar.id = al.artista_id
where ar.artista = artista_selecionado
order by album;
END $$

DELIMITER ;
