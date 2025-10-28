-- =====================================================
-- SISTEMA DE GESTIÓN DE DATOS ASTRONÓMICOS
-- Descripción: Operaciones de actualización de datos
-- =====================================================

-- =====================================================
-- ACTUALIZAR OBSERVADORES
-- =====================================================
-- Cambiar nivel de acceso de un observador
UPDATE OBSERVADORES
SET nivel_acceso = 'admin'
WHERE email = 'ana.martinez@uv.cl';

-- Cambiar país de un observador
UPDATE OBSERVADORES
SET pais = 'USA'
WHERE nombre = 'Dr. Luis Fernández';

-- =====================================================
-- ACTUALIZAR ESTRELLAS
-- =====================================================
-- Corregir magnitud absoluta de una estrella
UPDATE ESTRELLAS
SET magnitud_absoluta = 15.5
WHERE nombre = 'Proxima Centauri';

-- Cambiar constelación
UPDATE ESTRELLAS
SET constelacion = 'Centaurus A'
WHERE nombre = 'Alpha Centauri A';

-- =====================================================
-- ACTUALIZAR EXOPLANETAS
-- =====================================================
-- Actualizar temperatura de equilibrio
UPDATE EXOPLANETAS
SET temperatura_equilibrio_k = 235
WHERE nombre = 'Proxima Centauri b';

-- Cambiar confirmación de un planeta candidato
UPDATE EXOPLANETAS
SET confirmado = TRUE
WHERE nombre = 'Alpha Centauri Bb';

-- =====================================================
-- ACTUALIZAR OBSERVACIONES
-- =====================================================
-- Cambiar instrumento utilizado
UPDATE OBSERVACIONES
SET instrumento = 'HARPS-N'
WHERE id_observacion = 1;

-- Modificar notas
UPDATE OBSERVACIONES
SET notas = 'Curva de luz procesada y calibrada'
WHERE id_observacion = 2;

-- =====================================================
-- ACTUALIZAR MEDICIONES
-- =====================================================
-- Ajustar valor medido
UPDATE MEDICIONES
SET valor = 0.75
WHERE id_observacion = 2 AND tipo_medicion = 'Profundidad Tránsito';

-- =====================================================
-- ACTUALIZAR TAREAS DE INVESTIGACION
-- =====================================================
-- Cambiar estado de una tarea
UPDATE TAREAS_INVESTIGACION
SET estado = 'completada'
WHERE titulo LIKE '%Kepler-452b%';

-- Cambiar porcentaje de avance
UPDATE TAREAS_INVESTIGACION
SET porcentaje_avance = 100
WHERE id_tarea = 3;

-- =====================================================
-- FIN DEL SCRIPT
-- =====================================================
