CREATE VIEW historico_reproducao_usuarios AS
  SELECT 
	usuarios.usuario AS 'usuario',
    cancoes.nome_cancao AS 'nome'
FROM tb_cancoes_usuario as reproducoes 
	JOIN tb_usuarios AS usuarios ON usuarios.usuario_id = reproducoes.id_usuario
    JOIN tb_cancoes AS cancoes ON cancoes.id_cancao = reproducoes.id_cancao
ORDER BY usuarios.usuario ASC, cancoes.nome_cancao ASC;
 