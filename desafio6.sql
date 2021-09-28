CREATE VIEW faturamento_atual  AS
    SELECT 
        ROUND(MIN(planos.valor_plano),2) AS 'faturamento_minimo',
        ROUND(MAX(planos.valor_plano),2) AS 'faturamento_maximo',
        ROUND(AVG(planos.valor_plano),2) AS 'faturamento_medio',
        ROUND(SUM(planos.valor_plano),2) AS 'faturamento_total'
    FROM
        tb_planos AS planos INNER JOIN tb_usuarios AS usuarios ON usuarios.id_plano = planos.id_plano;
