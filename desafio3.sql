CREATE VIEW historico_reproducao_usuarios AS 
SELECT
    u.nome AS 'usuario',
    m.nome AS 'nome'
FROM
    usuario_historico AS uh
    JOIN
    usuarios AS u ON u.id = uh.usuario_id
    JOIN
    musicas AS m ON m.id = uh.musica_id;
