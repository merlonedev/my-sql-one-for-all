CREATE VIEW faturamento_atual AS
  SELECT
    MIN(P.price) AS faturamento_minimo,
    MAX(P.price) AS faturamento_maximo,
    ROUND(AVG(P.price), 2) AS faturamento_medio,
    SUM(P.price) AS faturamento_total
  FROM Users U
  JOIN Plans P ON U.plan_ID = P.plan_ID;
