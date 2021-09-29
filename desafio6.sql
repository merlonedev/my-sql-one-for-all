CREATE VIEW faturamento_atual AS
SELECT MIN(valor) AS faturamento_minimo,
MAX(valor) AS faturamento_maximo,
ROUND(AVG(valor),2) AS faturamento_medio,
SUM(valor) AS faturamento_total
FROM SpotifyClone.usuario U
INNER JOIN SpotifyClone.plano P
ON U.id_plano = P.id_plano;
