DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico (id INT)
RETURNS INT
READS SQL DATA 
BEGIN
RETURN (select
count(usuario_id) as quantidade_musicas_no_historico
from
USUARIO_MUSICAS
where usuario_id = id);
END
$$
DELIMITER ;
