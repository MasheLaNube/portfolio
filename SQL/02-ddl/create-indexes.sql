-- =====================================================
-- CREATE INDEXES PARA SISTEMA DE GESTIÓN DE DATOS ASTRONÓMICOS
-- Descripción: Índices adicionales para optimización de consultas
-- Compatible con MySQL, sin errores por FK ni duplicados
-- =====================================================
SHOW INDEX FROM TAREAS_INVESTIGACION;
-- OBSERVADORES
CREATE INDEX idx_email ON OBSERVADORES(email);
CREATE INDEX idx_institucion ON OBSERVADORES(institucion);

-- ESTRELLAS
CREATE INDEX idx_nombre ON ESTRELLAS(nombre);
CREATE INDEX idx_clasificacion ON ESTRELLAS(clasificacion_espectral);
CREATE INDEX idx_constelacion ON ESTRELLAS(constelacion);

-- EXOPLANETAS
CREATE INDEX idx_nombre_exoplaneta ON EXOPLANETAS(nombre);
CREATE INDEX idx_año ON EXOPLANETAS(año_descubrimiento);
CREATE INDEX idx_zona_habitable ON EXOPLANETAS(zona_habitable);
CREATE INDEX idx_estrella_año ON EXOPLANETAS(id_estrella, año_descubrimiento);

-- OBSERVACIONES
CREATE INDEX idx_fecha ON OBSERVACIONES(fecha_hora);
CREATE INDEX idx_tipo_observacion ON OBSERVACIONES(tipo_observacion);
CREATE INDEX idx_fecha_tipo ON OBSERVACIONES(fecha_hora, tipo_observacion);

-- MEDICIONES
CREATE INDEX idx_tipo_medicion ON MEDICIONES(tipo_medicion);

-- CONVERSIONES_UNIDADES
CREATE INDEX idx_fecha_conversion ON CONVERSIONES_UNIDADES(fecha_hora);
CREATE INDEX idx_categoria_conversion ON CONVERSIONES_UNIDADES(categoria);

-- TAREAS_INVESTIGACION
CREATE INDEX idx_estado_tarea ON TAREAS_INVESTIGACION(estado);
CREATE INDEX idx_prioridad_tarea ON TAREAS_INVESTIGACION(prioridad);
CREATE INDEX idx_fecha_vencimiento_tarea ON TAREAS_INVESTIGACION(fecha_vencimiento);

