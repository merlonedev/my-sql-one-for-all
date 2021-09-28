CREATE VIEW cancoes_premium AS
    SELECT 
        c.cancao AS nome, r.reproducoes
    FROM
        cancoes AS c
            INNER JOIN
        (SELECT 
            uc.cancao_id, COUNT(*) AS reproducoes
        FROM
            usuario_cancoes AS uc
        INNER JOIN (SELECT 
            u.id
        FROM
            usuarios AS u
        INNER JOIN (SELECT 
            *
        FROM
            planos
        WHERE
            plano IN ('familiar' , 'universitario')) AS p
        WHERE
            u.plano_id = p.id) AS pu
        WHERE
            pu.id = uc.usuario_id
        GROUP BY uc.cancao_id) AS r ON c.id = r.cancao_id
    ORDER BY nome;
