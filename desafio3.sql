CREATE VIEW historico_reproducao_usuarios AS
SELECT user_name AS "usuario", song_name AS "nome"
FROM SpotifyClone.historic AS H
INNER JOIN SpotifyClone.users AS U ON H.user_id = U.user_id
INNER JOIN SpotifyClone.songs AS S ON H.song_id = S.song_id
ORDER BY U.user_name, S.song_name;
