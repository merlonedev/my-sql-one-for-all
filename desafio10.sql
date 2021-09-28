CREATE FUNCTION `quantidade_musicas_no_historico`(usuario INT) RETURNS int
    READS SQL DATA
BEGIN
DECLARE result INT;
SELECT 
COUNT(exibicoes.id_usuario) 
FROM tb_cancoes_usuario AS `exibicoes` 
INNER JOIN tb_usuarios AS usuarios ON usuarios.usuario_id = exibicoes.id_usuario
WHERE usuarios.usuario_id = usuario
GROUP BY exibicoes.id_usuario
INTO result;
RETURN result;
END
