DELIMITER $$
CREATE PROCEDURE
albuns_do_artista(IN nome VARCHAR(30))
BEGIN
select
a.nome_artista as artista,
b.nome_album as album
from
ARTISTAS a
join
ALBUNS b
on
a.artista_id = b.artista_id
where a.nome_artista = nome
order by album;
END;
$$
DELIMITER ;
