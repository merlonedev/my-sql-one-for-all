CREATE VIEW historico_reproducao_usuarios AS
  (SELECT 
      u.nome AS 'usuario', m.nome AS 'nome'
  FROM
      SpotifyClone.usuarios AS u
          JOIN
      usuario_historico AS uh ON uh.usuario_id = u.usuario_id
          JOIN
      SpotifyClone.musicas AS m ON m.musica_id = uh.musica_id
  ORDER BY u.nome , m.nome);
