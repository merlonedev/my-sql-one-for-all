CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        us.nome_usuario AS usuario, mu.nome_musica AS nome
    FROM
        usuarios AS us
            JOIN
        musicas_reproduzidas AS mr ON us.usuario_id = mr.usuario_id
            JOIN
        musicas AS mu ON mr.musica_id = mu.musica_id
    ORDER BY usuario , nome;
