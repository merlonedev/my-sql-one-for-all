CREATE VIEW faturamento_atual AS
SELECT
  MIN(valor_plano) AS faturamento_minimo,
  MAX(valor_plano) AS faturamento_maximo,
  (
    SELECT
      ROUND(AVG(p.valor_plano), 2)
    FROM
      user u
      JOIN plano p ON u.plano_id = p.id
  ) AS faturamento_medio,
  (
    SELECT
      SUM(p.valor_plano)
    FROM
      user u
      JOIN plano p ON u.plano_id = p.id
  ) AS faturamento_total
FROM
  plano;