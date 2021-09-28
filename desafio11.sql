CREATE VIEW cancoes_premium AS
SELECT c.titulo AS `nome`,
COUNT(*) AS `reproducoes`
FROM historico AS h
JOIN usuario AS u ON u.usuario_id = h.usuario_id
JOIN cancoes AS c ON c.cancoes_id = h.cancoes_id
WHERE u.plano_id IN (2, 3)
GROUP BY c.cancoes_id
ORDER BY c.titulo;
