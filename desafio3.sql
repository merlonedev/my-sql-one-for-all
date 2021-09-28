CREATE VIEW historico_reproducao_usuarios AS
SELECT u.user usuario, s.song nome FROM historic h
JOIN users u ON u.user_id = h.user_id
JOIN songs s ON s.song_id = h.song_id
ORDER BY usuario, nome;
