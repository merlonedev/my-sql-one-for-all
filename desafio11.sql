CREATE VIEW cancoes_premium AS
  SELECT
    s.song_title AS 'nome',
    COUNT(*) AS 'reproducoes'
  FROM SpotifyClone.songs AS s
  INNER JOIN SpotifyClone.history AS h
    ON h.song_id = s.song_id
  INNER JOIN SpotifyClone.users AS u
    ON h.user_id = u.user_id
  INNER JOIN SpotifyClone.signatures AS si
    ON si.signature_id = u.signature_id
  
  WHERE si.signature_id != 1
    GROUP BY nome
    ORDER BY nome;
