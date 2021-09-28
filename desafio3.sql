CREATE VIEW historico_reproducao_usuario AS
    SELECT 
        usuario_id AS 'usuario', cancoes_id AS 'nome'
    FROM
        SpotifyClone.historico;
