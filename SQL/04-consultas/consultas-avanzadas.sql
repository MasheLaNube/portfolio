-- =====================================================
-- CONSULTAS AVANZADAS
-- =====================================================

-- 13. Estrellas con más planetas que el promedio
SELECT est.nombre,
       est.clasificacion_espectral,
       COUNT(ex.id_exoplaneta) AS num_planetas
FROM ESTRELLAS est
JOIN EXOPLANETAS ex ON est.id_estrella = ex.id_estrella
GROUP BY est.id_estrella, est.nombre, est.clasificacion_espectral
HAVING COUNT(ex.id_exoplaneta) > (
    SELECT AVG(cuenta) 
    FROM (
        SELECT COUNT(*) AS cuenta
        FROM EXOPLANETAS
        GROUP BY id_estrella
    ) AS subconsulta
)
ORDER BY num_planetas DESC;

-- 14. Observadores más productivos que el promedio
SELECT o.nombre,
       o.institucion,
       COUNT(obs.id_observacion) AS total_observaciones
FROM OBSERVADORES o
JOIN OBSERVACIONES obs ON o.id_observador = obs.id_observador
GROUP BY o.id_observador, o.nombre, o.institucion
HAVING COUNT(obs.id_observacion) > (
    SELECT AVG(cuenta)
    FROM (
        SELECT COUNT(*) AS cuenta
        FROM OBSERVACIONES
        GROUP BY id_observador
    ) AS subconsulta
)
ORDER BY total_observaciones DESC;

-- 15. Planetas más masivos por categoría (WINDOW FUNCTION)
SELECT tipo_planeta,
       nombre,
       masa_tierras,
       nombre_estrella
FROM (
    SELECT ex.tipo_planeta,
           ex.nombre,
           ex.masa_tierras,
           est.nombre AS nombre_estrella,
           RANK() OVER (PARTITION BY ex.tipo_planeta ORDER BY ex.masa_tierras DESC) AS ranking
    FROM EXOPLANETAS ex
    JOIN ESTRELLAS est ON ex.id_estrella = est.id_estrella
    WHERE ex.masa_tierras IS NOT NULL
) AS ranked
WHERE ranking = 1
ORDER BY masa_tierras DESC;
