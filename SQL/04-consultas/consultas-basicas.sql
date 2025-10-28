-- =====================================================
-- CONSULTAS BÁSICAS
-- =====================================================

-- 1. Listar todas las estrellas de tipo espectral M
SELECT nombre, clasificacion_espectral, temperatura_k, distancia_parsecs
FROM ESTRELLAS
WHERE clasificacion_espectral LIKE 'M%'
ORDER BY distancia_parsecs ASC;

-- 2. Exoplanetas en zona habitable
SELECT e.nombre AS planeta, 
       est.nombre AS estrella,
       e.masa_tierras,
       e.periodo_orbital_dias,
       e.temperatura_equilibrio_k
FROM EXOPLANETAS e
JOIN ESTRELLAS est ON e.id_estrella = est.id_estrella
WHERE e.zona_habitable = TRUE
ORDER BY e.masa_tierras ASC;

-- 3. Observaciones en condiciones excelentes
SELECT o.fecha_hora,
       obs.nombre AS observador,
       est.nombre AS estrella,
       o.tipo_observacion,
       o.duracion_minutos,
       o.seeing_arcsec
FROM OBSERVACIONES o
JOIN OBSERVADORES obs ON o.id_observador = obs.id_observador
JOIN ESTRELLAS est ON o.id_estrella = est.id_estrella
WHERE o.condiciones_atmosfericas = 'excelente'
ORDER BY o.fecha_hora DESC;

-- 4. Conversiones de unidades de distancia
SELECT c.fecha_hora,
       o.nombre AS observador,
       c.valor_entrada,
       c.unidad_entrada,
       c.valor_salida,
       c.unidad_salida
FROM CONVERSIONES_UNIDADES c
LEFT JOIN OBSERVADORES o ON c.id_observador = o.id_observador
WHERE c.categoria = 'distancia'
ORDER BY c.fecha_hora DESC;

-- 5. Tareas urgentes pendientes o en progreso
SELECT t.titulo,
       o.nombre AS responsable,
       t.fecha_vencimiento,
       t.estado,
       t.porcentaje_avance,
       DATEDIFF(t.fecha_vencimiento, CURDATE()) AS dias_restantes
FROM TAREAS_INVESTIGACION t
JOIN OBSERVADORES o ON t.id_observador = o.id_observador
WHERE t.prioridad = 'urgente' 
  AND t.estado IN ('pendiente', 'en_progreso')
ORDER BY t.fecha_vencimiento ASC;
