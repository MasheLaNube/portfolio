-- CREATE DATABASE astronomia;
USE astronomia;

-- =====================================================
-- SISTEMA DE GESTIÓN DE DATOS ASTRONÓMICOS
-- Descripción: Definición de todas las tablas del sistema
-- =====================================================

-- Eliminar tablas si existen (para desarrollo)
DROP TABLE IF EXISTS MEDICIONES;
DROP TABLE IF EXISTS TAREAS_INVESTIGACION;
DROP TABLE IF EXISTS CONVERSIONES_UNIDADES;
DROP TABLE IF EXISTS OBSERVACIONES;
DROP TABLE IF EXISTS EXOPLANETAS;
DROP TABLE IF EXISTS ESTRELLAS;
DROP TABLE IF EXISTS OBSERVADORES;

-- =====================================================
-- ELIMINAR VISTAS SI EXISTEN
-- =====================================================
DROP VIEW IF EXISTS vista_estrellas_con_planetas;
DROP VIEW IF EXISTS vista_estadisticas_observadores;

-- =====================================================
-- TABLA: OBSERVADORES
-- Descripción: Usuarios del sistema (astrónomos e investigadores)
-- =====================================================
CREATE TABLE OBSERVADORES (
    id_observador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    institucion VARCHAR(200),
    fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE),
    nivel_acceso ENUM('basico', 'intermedio', 'avanzado', 'admin') DEFAULT 'basico',
    pais VARCHAR(100),
    activo BOOLEAN DEFAULT TRUE,
    INDEX idx_email (email),
    INDEX idx_institucion (institucion)
);

-- =====================================================
-- TABLA: ESTRELLAS
-- Descripción: Catálogo de estrellas observadas y clasificadas
-- =====================================================
CREATE TABLE ESTRELLAS (
    id_estrella INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    nombre_alternativo VARCHAR(150),
    clasificacion_espectral VARCHAR(10) NOT NULL,
    temperatura_k DECIMAL(10, 2),
    magnitud_aparente DECIMAL(6, 3),
    magnitud_absoluta DECIMAL(6, 3),
    distancia_parsecs DECIMAL(12, 6),
    masa_solar DECIMAL(8, 4),
    radio_solar DECIMAL(8, 4),
    luminosidad_solar DECIMAL(10, 4),
    constelacion VARCHAR(50),
    ascension_recta VARCHAR(20),
    declinacion VARCHAR(20),
    fecha_descubrimiento DATE,
    notas TEXT,
    INDEX idx_nombre (nombre),
    INDEX idx_clasificacion (clasificacion_espectral),
    INDEX idx_constelacion (constelacion)
);

-- =====================================================
-- TABLA: EXOPLANETAS
-- Descripción: Catálogo de exoplanetas descubiertos
-- =====================================================
CREATE TABLE EXOPLANETAS (
    id_exoplaneta INT PRIMARY KEY AUTO_INCREMENT,
    id_estrella INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    metodo_deteccion ENUM('transito', 'velocidad_radial', 'imagen_directa', 'microlente', 'astrometria') NOT NULL,
    masa_jupiteres DECIMAL(10, 6),
    radio_jupiteres DECIMAL(8, 4),
    masa_tierras DECIMAL(10, 4),
    radio_tierras DECIMAL(8, 4),
    periodo_orbital_dias DECIMAL(12, 6),
    distancia_orbital_ua DECIMAL(10, 6),
    excentricidad DECIMAL(6, 4),
    año_descubrimiento INT NOT NULL,
    zona_habitable BOOLEAN DEFAULT FALSE,
    temperatura_equilibrio_k DECIMAL(8, 2),
    densidad_g_cm3 DECIMAL(8, 4),
    tipo_planeta ENUM('rocoso', 'gaseoso', 'helado', 'super_tierra', 'mini_neptuno', 'jupiter_caliente') DEFAULT 'gaseoso',
    confirmado BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_estrella) REFERENCES ESTRELLAS(id_estrella) ON DELETE CASCADE,
    INDEX idx_nombre (nombre),
    INDEX idx_estrella (id_estrella),
    INDEX idx_año (año_descubrimiento),
    INDEX idx_zona_habitable (zona_habitable)
);

-- =====================================================
-- TABLA: OBSERVACIONES
-- Descripción: Registro de observaciones astronómicas realizadas
-- =====================================================
CREATE TABLE OBSERVACIONES (
    id_observacion INT PRIMARY KEY AUTO_INCREMENT,
    id_observador INT NOT NULL,
    id_estrella INT,
    fecha_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_observacion ENUM('fotometria', 'espectroscopia', 'astrometria', 'imagen', 'transito', 'velocidad_radial', 'otro') NOT NULL,
    duracion_minutos DECIMAL(8, 2),
    instrumento VARCHAR(100),
    telescopio VARCHAR(100),
    longitud_onda VARCHAR(50),
    condiciones_atmosfericas ENUM('excelente', 'buena', 'regular', 'mala') DEFAULT 'buena',
    seeing_arcsec DECIMAL(4, 2),
    humedad_porcentaje INT,
    temperatura_celsius DECIMAL(5, 2),
    notas TEXT,
    calidad_datos ENUM('alta', 'media', 'baja') DEFAULT 'media',
    procesado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_observador) REFERENCES OBSERVADORES(id_observador) ON DELETE CASCADE,
    FOREIGN KEY (id_estrella) REFERENCES ESTRELLAS(id_estrella) ON DELETE SET NULL,
    INDEX idx_fecha (fecha_hora),
    INDEX idx_observador (id_observador),
    INDEX idx_estrella (id_estrella),
    INDEX idx_tipo (tipo_observacion)
);

-- =====================================================
-- TABLA: MEDICIONES
-- Descripción: Mediciones específicas tomadas durante observaciones
-- =====================================================
CREATE TABLE MEDICIONES (
    id_medicion INT PRIMARY KEY AUTO_INCREMENT,
    id_observacion INT NOT NULL,
    tipo_medicion VARCHAR(100) NOT NULL,
    valor DECIMAL(20, 10) NOT NULL,
    unidad VARCHAR(50) NOT NULL,
    error_medicion DECIMAL(20, 10),
    metodo VARCHAR(100),
    timestamp_medicion DATETIME DEFAULT CURRENT_TIMESTAMP,
    calibrado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_observacion) REFERENCES OBSERVACIONES(id_observacion) ON DELETE CASCADE,
    INDEX idx_observacion (id_observacion),
    INDEX idx_tipo (tipo_medicion)
);

-- =====================================================
-- TABLA: CONVERSIONES_UNIDADES
-- Descripción: Historial de conversiones de unidades astronómicas
-- =====================================================
CREATE TABLE CONVERSIONES_UNIDADES (
    id_conversion INT PRIMARY KEY AUTO_INCREMENT,
    id_observador INT,
    fecha_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_conversion VARCHAR(100) NOT NULL,
    valor_entrada DECIMAL(30, 15) NOT NULL,
    unidad_entrada VARCHAR(50) NOT NULL,
    valor_salida DECIMAL(35, 15) NOT NULL,
    unidad_salida VARCHAR(50) NOT NULL,
    categoria ENUM('distancia', 'masa', 'tiempo', 'temperatura', 'luminosidad', 'energia', 'otro') NOT NULL,
    precision_decimales INT DEFAULT 6,
    FOREIGN KEY (id_observador) REFERENCES OBSERVADORES(id_observador) ON DELETE SET NULL,
    INDEX idx_observador (id_observador),
    INDEX idx_fecha (fecha_hora),
    INDEX idx_categoria (categoria)
);

-- =====================================================
-- TABLA: TAREAS_INVESTIGACION
-- Descripción: Sistema de gestión de tareas de investigación
-- =====================================================
CREATE TABLE TAREAS_INVESTIGACION (
    id_tarea INT PRIMARY KEY AUTO_INCREMENT,
    id_observador INT NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_vencimiento DATE,
    fecha_completada DATETIME,
    estado ENUM('pendiente', 'en_progreso', 'completada', 'cancelada') DEFAULT 'pendiente',
    prioridad ENUM('baja', 'media', 'alta', 'urgente') DEFAULT 'media',
    id_estrella_relacionada INT,
    id_exoplaneta_relacionado INT,
    etiquetas VARCHAR(200),
    porcentaje_avance INT DEFAULT 0 CHECK (porcentaje_avance >= 0 AND porcentaje_avance <= 100),
    FOREIGN KEY (id_observador) REFERENCES OBSERVADORES(id_observador) ON DELETE CASCADE,
    FOREIGN KEY (id_estrella_relacionada) REFERENCES ESTRELLAS(id_estrella) ON DELETE SET NULL,
    FOREIGN KEY (id_exoplaneta_relacionado) REFERENCES EXOPLANETAS(id_exoplaneta) ON DELETE SET NULL,
    INDEX idx_observador (id_observador),
    INDEX idx_estado (estado),
    INDEX idx_prioridad (prioridad),
    INDEX idx_fecha_vencimiento (fecha_vencimiento)
);

-- =====================================================
-- VISTAS ÚTILES
-- =====================================================

-- Vista: Resumen de estrellas con número de exoplanetas
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

-- Vista: Estadísticas de observadores
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
-- ÍNDICES ADICIONALES PARA OPTIMIZACIÓN
-- =====================================================

-- Índices compuestos para consultas frecuentes
CREATE INDEX idx_exoplanetas_estrella_año ON EXOPLANETAS(id_estrella, año_descubrimiento);
CREATE INDEX idx_observaciones_fecha_tipo ON OBSERVACIONES(fecha_hora, tipo_observacion);
CREATE INDEX idx_tareas_observador_estado ON TAREAS_INVESTIGACION(id_observador, estado);

-- =====================================================
-- FIN DEL SCRIPT
-- =====================================================