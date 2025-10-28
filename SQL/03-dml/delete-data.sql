-- =====================================================
-- SISTEMA DE GESTIÓN DE DATOS ASTRONÓMICOS
-- Descripción: Operaciones de eliminación de datos
-- =====================================================

-- =====================================================
-- ELIMINAR OBSERVADORES
-- =====================================================
-- Borrar un observador específico
DELETE FROM OBSERVADORES
WHERE email = 'ana.martinez@uv.cl';

-- =====================================================
-- ELIMINAR ESTRELLAS
-- =====================================================
-- Borrar estrella por nombre
DELETE FROM ESTRELLAS
WHERE nombre = 'Tau Ceti';

-- =====================================================
-- ELIMINAR EXOPLANETAS
-- =====================================================
-- Borrar un exoplaneta específico
DELETE FROM EXOPLANETAS
WHERE nombre = 'Alpha Centauri Bb';

-- =====================================================
-- ELIMINAR OBSERVACIONES
-- =====================================================
-- Borrar observaciones antiguas
DELETE FROM OBSERVACIONES
WHERE fecha_hora < '2024-05-01';

-- =====================================================
-- ELIMINAR MEDICIONES
-- =====================================================
-- Borrar mediciones de una observación específica
DELETE FROM MEDICIONES
WHERE id_observacion = 4;

-- =====================================================
-- ELIMINAR TAREAS DE INVESTIGACION
-- =====================================================
-- Eliminar tareas completadas
DELETE FROM TAREAS_INVESTIGACION
WHERE estado = 'completada';

-- =====================================================
-- FIN DEL SCRIPT
-- =====================================================
