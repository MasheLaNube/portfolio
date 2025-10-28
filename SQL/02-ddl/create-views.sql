-- =====================================================
-- CREATE VIEWS PARA SISTEMA DE GESTIÓN DE DATOS ASTRONÓMICOS
-- Descripción: Creación de vistas útiles para análisis y reportes
-- =====================================================
USE astronomia;
-- =====================================================
-- ELIMINAR VISTAS SI EXISTEN
-- =====================================================
DROP VIEW IF EXISTS vista_estrellas_con_planetas;
DROP VIEW IF EXISTS vista_estadisticas_observadores;

-- =====================================================
-- VISTA: Resumen de estrellas con número de exoplanetas
-- =====================================================
CREATE VIEW vista_estrellas_con_planetas AS
SELECT 
    e.id_estrella,
    e.nombre,
    e.clasificacion_espectral,
    e.distancia_parsecs,
    COUNT(ex.id_exoplaneta) AS num_exoplanetas,
    SUM(CASE WHEN ex.zona_habitable = TRUE THEN 1 ELSE 0 END) AS planetas_zona_habitable
FROM ESTRELLAS e
LEFT JOIN EXOPLANETAS ex ON e.id_estrella = ex.id_estrella
GROUP BY e.id_estrella, e.nombre, e.clasificacion_espectral, e.distancia_parsecs;

-- =====================================================
-- VISTA: Estadísticas de observadores
-- =====================================================
CREATE VIEW vista_estadisticas_observadores AS
SELECT 
    o.id_observador,
    o.nombre,
    o.institucion,
    COUNT(DISTINCT obs.id_observacion) AS total_observaciones,
    COUNT(DISTINCT t.id_tarea) AS total_tareas,
    COUNT(DISTINCT c.id_conversion) AS total_conversiones,
    MAX(obs.fecha_hora) AS ultima_observacion
FROM OBSERVADORES o
LEFT JOIN OBSERVACIONES obs ON o.id_observador = obs.id_observador
LEFT JOIN TAREAS_INVESTIGACION t ON o.id_observador = t.id_observador
LEFT JOIN CONVERSIONES_UNIDADES c ON o.id_observador = c.id_observador
GROUP BY o.id_observador, o.nombre, o.institucion;

-- =====================================================
-- FIN DEL SCRIPT
-- =====================================================
