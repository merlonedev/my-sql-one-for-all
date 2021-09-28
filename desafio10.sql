USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(nome VARCHAR(20))
RETURNS INT READS SQL DATA
BEGIN
    DECLARE musicas_historico INT;
SELECT 
    COUNT(*) AS quantidade_musicas_no_historico
FROM
    usuario_cancoes AS uc
        INNER JOIN
    (SELECT 
        *
    FROM
        usuarios
    WHERE
        usuario = 'Bill') AS u ON u.id = uc.usuario_id INTO musicas_historico;
	RETURN musicas_historico;
END $$

DELIMITER ;
