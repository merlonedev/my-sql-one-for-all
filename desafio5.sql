-- Desafio 5

CREATE VIEW top_2_hits_do_momento AS
SELECT 
  m.music_name AS cancao, COUNT(m.music_name) AS reproducoes
FROM
  SpotifyClone.musics AS m
      JOIN
  SpotifyClone.historico AS h ON m.music_id = h.music_id
GROUP BY cancao
ORDER BY reproducoes DESC , cancao
LIMIT 2; 
