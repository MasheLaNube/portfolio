-- =====================================================
-- CONSULTAS CON JOINS COMPLEJOS
-- =====================================================

-- 6. Estrella con todos sus planetas y observaciones
SELECT est.nombre AS estrella,
       est.clasificacion_espectral,
       est.distancia_parsecs,
       ex.nombre AS planeta,
       ex.zona_habitable,
       ex.masa_tierras,
       COUNT(DISTINCT o.id_observacion) AS num_observaciones
FROM ESTRELLAS est
LEFT JOIN EXOPLANETAS ex ON est.id_estrella = ex.id_estrella
LEFT JOIN OBSERVACIONES o ON est.id_estrella = o.id_estrella
GROUP BY est.id_estrella, est.nombre, est.clasificacion_espectral, 
         est.distancia_parsecs, ex.id_exoplaneta, ex.nombre, 
         ex.zona_habitable, ex.masa_tierras
ORDER BY est.nombre, ex.nombre;

-- 7. Observadores más activos con estadísticas
SELECT o.nombre AS observador,
       o.institucion,
       o.nivel_acceso,
       COUNT(DISTINCT obs.id_observacion) AS total_observaciones,
       COUNT(DISTINCT t.id_tarea) AS total_tareas,
       COUNT(DISTINCT c.id_conversion) AS total_conversiones,
       SUM(CASE WHEN t.estado = 'completada' THEN 1 ELSE 0 END) AS tareas_completadas,
       ROUND(AVG(obs.duracion_minutos), 2) AS duracion_promedio_obs
FROM OBSERVADORES o
LEFT JOIN OBSERVACIONES obs ON o.id_observador = obs.id_observador
LEFT JOIN TAREAS_INVESTIGACION t ON o.id_observador = t.id_observador
LEFT JOIN CONVERSIONES_UNIDADES c ON o.id_observador = c.id_observador
GROUP BY o.id_observador, o.nombre, o.institucion, o.nivel_acceso
HAVING total_observaciones > 0
ORDER BY total_observaciones DESC;

-- 8. Planetas por método de detección
SELECT metodo_deteccion,
       COUNT(*) AS total_planetas,
       ROUND(AVG(masa_tierras), 2) AS masa_promedio_tierras,
       ROUND(AVG(periodo_orbital_dias), 2) AS periodo_promedio_dias,
       SUM(CASE WHEN zona_habitable = TRUE THEN 1 ELSE 0 END) AS en_zona_habitable,
       MIN(año_descubrimiento) AS primer_descubrimiento,
       MAX(año_descubrimiento) AS ultimo_descubrimiento
FROM EXOPLANETAS
GROUP BY metodo_deteccion
ORDER BY total_planetas DESC;
