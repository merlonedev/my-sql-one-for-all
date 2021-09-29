CREATE VIEW top_2_hits_do_momento AS
  SELECT
  c.Nome_Cancao AS 'cancao',
  COUNT(h.Id_Usuario) AS 'reproducoes' -- o README diz: Cada música do histórico de reprodução pode aparecer uma única vez por pessoa. Então considera que uma pessoa pode ouvir uma musica apenas 1 vez.
  FROM SpotifyClone.Cancoes c 
  INNER JOIN SpotifyClone.Historico h ON h.Id_Cancao = c.Id
  GROUP BY c.Nome_Cancao -- fez a contagem lá em cima, e agrupa pelo nome da musica. Ex: Musica X foi tocava  y vezes.
  ORDER BY h.Id_Usuario DESC, c.Nome_Cancao -- vai ordenar da mais tocadas pra menos tocadas.
  LIMIT 2; -- agora aparecem só as 2 mais tocadas.
  SELECT * FROM top_2_hits_do_momento;