-- =====================================================
-- CONSULTAS CON AGREGACIÓN
-- =====================================================

-- 9. Estadísticas de observaciones por tipo
SELECT tipo_observacion,
       COUNT(*) AS total_observaciones,
       ROUND(AVG(duracion_minutos), 2) AS duracion_promedio,
       ROUND(MIN(duracion_minutos), 2) AS duracion_minima,
       ROUND(MAX(duracion_minutos), 2) AS duracion_maxima,
       COUNT(DISTINCT id_observador) AS num_observadores
FROM OBSERVACIONES
GROUP BY tipo_observacion
ORDER BY total_observaciones DESC;

-- 10. Estrellas más observadas
SELECT est.nombre,
       est.clasificacion_espectral,
       est.distancia_parsecs,
       COUNT(o.id_observacion) AS num_observaciones,
       COUNT(DISTINCT o.id_observador) AS num_observadores_distintos,
       MIN(o.fecha_hora) AS primera_observacion,
       MAX(o.fecha_hora) AS ultima_observacion
FROM ESTRELLAS est
JOIN OBSERVACIONES o ON est.id_estrella = o.id_estrella
GROUP BY est.id_estrella, est.nombre, est.clasificacion_espectral, est.distancia_parsecs
HAVING num_observaciones > 0
ORDER BY num_observaciones DESC;

-- 11. Productividad por institución
SELECT o.institucion,
       COUNT(DISTINCT o.id_observador) AS num_investigadores,
       COUNT(DISTINCT obs.id_observacion) AS total_observaciones,
       COUNT(DISTINCT t.id_tarea) AS total_tareas,
       ROUND(AVG(CASE WHEN t.estado = 'completada' 
                      THEN t.porcentaje_avance 
                      ELSE NULL END), 2) AS promedio_completado
FROM OBSERVADORES o
LEFT JOIN OBSERVACIONES obs ON o.id_observador = obs.id_observador
LEFT JOIN TAREAS_INVESTIGACION t ON o.id_observador = t.id_observador
WHERE o.institucion IS NOT NULL
GROUP BY o.institucion
ORDER BY total_observaciones DESC;

-- 12. Exoplanetas por año de descubrimiento
SELECT año_descubrimiento,
       COUNT(*) AS total_descubiertos,
       COUNT(CASE WHEN zona_habitable = TRUE THEN 1 END) AS en_zona_habitable,
       ROUND(AVG(masa_tierras), 2) AS masa_promedio_tierras,
       GROUP_CONCAT(DISTINCT metodo_deteccion ORDER BY metodo_deteccion) AS metodos_usados
FROM EXOPLANETAS
GROUP BY año_descubrimiento
ORDER BY año_descubrimiento DESC;
