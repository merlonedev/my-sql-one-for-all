CREATE VIEW historico_reproducao_usuarios AS
SELECT 
 u.user_name AS 'usuario',
 so.song_name AS'nome' 
FROM SpotifyClone.reproduction_history AS rh
JOIN SpotifyClone.user AS u ON u.user_id = rh.user_id
JOIN SpotifyClone.song AS so ON so.song_id = rh.song_id
ORDER BY usuario, nome;
