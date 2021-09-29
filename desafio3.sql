-- Desafio 3

CREATE VIEW historico_reproducao_usuarios AS
SELECT 
  u.username AS usuario, m.music_name AS nome
FROM
  SpotifyClone.usuarios AS u
      JOIN
  SpotifyClone.historico AS sh ON u.user_id = sh.user_id
      JOIN
  SpotifyClone.musics AS m ON m.music_id = sh.music_id
ORDER BY u.username, m.music_name;
