CREATE VIEW cancoes_premium AS
SELECT
  c.cancao AS nome,
  COUNT(*) AS reproducoes
FROM
  historico h
  JOIN cancoes c ON h.cancoes_id = c.id
WHERE
  h.user_id IN (
    SELECT
      id
    FROM
      user
    WHERE
      plano_id <> 1
  )
GROUP BY
  c.cancao
ORDER BY
  nome ASC;
