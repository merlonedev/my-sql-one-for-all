CREATE VIEW historico_reproducao_usuarios AS
SELECT 
u.nome AS 'usuario', m.nome_cancao AS 'nome'
FROM
SpotifyClone.usuario AS u
JOIN
usuario_cancao_historico AS uh ON uh.usuario_id = u.usuario_id
JOIN
SpotifyClone.cancoes AS m ON m.cancao_id = uh.cancao_id
ORDER BY u.nome , m.nome_cancao;
