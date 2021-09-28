CREATE VIEW historico_reproducao_usuarios AS
SELECT 
	u.nome AS `usuario`, m.nome AS `nome`
FROM
	SpotifyClone.Usuario_Historico AS uh
		JOIN
	SpotifyClone.Usuarios AS u ON u.id = uh.usuario_id
		JOIN
	SpotifyClone.Musicas AS m ON m.id = uh.musica_id
ORDER BY `usuario` , `nome`;
