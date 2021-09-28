CREATE VIEW historico_reproducao_usuarios AS
SELECT 
u.usuario AS usuario, ca.nome_cancao AS nome
FROM
USUARIO u
JOIN
USUARIO_MUSICAS um ON u.usuario_id = um.usuario_id
JOIN
CANCOES ca ON um.musica_id = ca.cancoes_id
ORDER BY u.usuario , ca.nome_cancao;
    
