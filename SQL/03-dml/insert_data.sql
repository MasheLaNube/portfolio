-- =====================================================
-- SISTEMA DE GESTIÓN DE DATOS ASTRONÓMICOS
-- Descripción: Datos de ejemplo para poblar la base de datos
-- =====================================================

-- =====================================================
-- INSERTAR OBSERVADORES
-- =====================================================
INSERT INTO OBSERVADORES (nombre, email, institucion, nivel_acceso, pais) VALUES
('Dr. Carlos Méndez', 'carlos.mendez@astro.cl', 'Universidad de Chile', 'avanzado', 'Chile'),
('Dra. María González', 'maria.gonzalez@eso.org', 'European Southern Observatory', 'admin', 'Chile'),
('Prof. Juan Torres', 'juan.torres@uc.cl', 'Pontificia Universidad Católica', 'avanzado', 'Chile'),
('Sofía Ramírez', 'sofia.ramirez@udec.cl', 'Universidad de Concepción', 'intermedio', 'Chile'),
('Dr. Pedro Sánchez', 'pedro.sanchez@usach.cl', 'Universidad de Santiago', 'avanzado', 'Chile'),
('Ana Martínez', 'ana.martinez@uv.cl', 'Universidad de Valparaíso', 'basico', 'Chile'),
('Dr. Luis Fernández', 'luis.fernandez@nasa.gov', 'NASA', 'avanzado', 'USA'),
('Claudia Rojas', 'claudia.rojas@udp.cl', 'Universidad Diego Portales', 'intermedio', 'Chile');

-- =====================================================
-- INSERTAR ESTRELLAS
-- =====================================================
INSERT INTO ESTRELLAS (nombre, nombre_alternativo, clasificacion_espectral, temperatura_k, 
                       magnitud_aparente, magnitud_absoluta, distancia_parsecs, 
                       masa_solar, radio_solar, luminosidad_solar, constelacion, 
                       ascension_recta, declinacion, fecha_descubrimiento) VALUES
('Proxima Centauri', 'Alpha Centauri C', 'M5.5V', 3042, 11.13, 15.60, 1.301, 0.1221, 0.1542, 0.00155, 'Centaurus', '14h 29m 43s', '-62° 40'' 46"', '1915-10-01'),
('Alpha Centauri A', 'Rigil Kentaurus', 'G2V', 5790, -0.01, 4.38, 1.339, 1.1, 1.2234, 1.519, 'Centaurus', '14h 39m 36s', '-60° 50'' 02"', '1839-01-01'),
('Sirius', 'Alpha Canis Majoris', 'A1V', 9940, -1.46, 1.42, 2.64, 2.063, 1.711, 25.4, 'Canis Major', '06h 45m 09s', '-16° 42'' 58"', '1844-01-31'),
('Betelgeuse', 'Alpha Orionis', 'M2Iab', 3500, 0.50, -5.85, 168, 11.6, 764, 90000, 'Orion', '05h 55m 10s', '+07° 24'' 25"', '1836-01-01'),
('Vega', 'Alpha Lyrae', 'A0V', 9602, 0.03, 0.58, 7.68, 2.135, 2.362, 40.12, 'Lyra', '18h 36m 56s', '+38° 47'' 01"', '1850-01-01'),
('Kepler-452', NULL, 'G2V', 5757, 13.426, NULL, 430, 1.04, 1.11, 1.2, 'Cygnus', '19h 44m 00s', '+44° 16'' 39"', '2009-01-01'),
('TRAPPIST-1', '2MASS J23062928-0502285', 'M8V', 2511, 18.80, 18.4, 12.43, 0.0898, 0.1192, 0.000525, 'Aquarius', '23h 06m 29s', '-05° 02'' 29"', '1999-01-01'),
('HD 209458', NULL, 'G0V', 6091, 7.65, 4.04, 47.5, 1.119, 1.155, 1.591, 'Pegasus', '22h 03m 11s', '+18° 53'' 04"', '1999-01-01'),
('51 Pegasi', NULL, 'G5V', 5793, 5.49, 4.84, 15.4, 1.06, 1.27, 1.34, 'Pegasus', '22h 57m 28s', '+20° 46'' 08"', '1995-01-01'),
('Tau Ceti', NULL, 'G8V', 5344, 3.50, 5.69, 3.65, 0.783, 0.793, 0.52, 'Cetus', '01h 44m 04s', '-15° 56'' 15"', '1850-01-01');

-- =====================================================
-- INSERTAR EXOPLANETAS
-- =====================================================
INSERT INTO EXOPLANETAS (id_estrella, nombre, metodo_deteccion, masa_jupiteres, radio_jupiteres, 
                         masa_tierras, radio_tierras, periodo_orbital_dias, distancia_orbital_ua, 
                         excentricidad, año_descubrimiento, zona_habitable, temperatura_equilibrio_k, 
                         tipo_planeta, confirmado) VALUES
-- Proxima Centauri b
(1, 'Proxima Centauri b', 'velocidad_radial', 0.0038, NULL, 1.27, 1.1, 11.186, 0.0485, 0.02, 2016, TRUE, 234, 'rocoso', TRUE),
-- Proxima Centauri d
(1, 'Proxima Centauri d', 'velocidad_radial', 0.0008, NULL, 0.26, 0.81, 5.122, 0.029, 0.04, 2020, FALSE, 280, 'rocoso', TRUE),
-- Alpha Centauri Bb (candidato)
(2, 'Alpha Centauri Bb', 'transito', 0.0035, NULL, 1.13, 1.04, 3.236, 0.04, 0, 2012, FALSE, 1500, 'rocoso', FALSE),
-- TRAPPIST-1 system (7 planets)
(7, 'TRAPPIST-1b', 'transito', 0.0034, 0.086, 1.017, 1.116, 1.51, 0.01154, 0.006, 2016, FALSE, 400, 'rocoso', TRUE),
(7, 'TRAPPIST-1c', 'transito', 0.0041, 0.093, 1.156, 1.097, 2.42, 0.01581, 0.007, 2016, FALSE, 342, 'rocoso', TRUE),
(7, 'TRAPPIST-1d', 'transito', 0.0012, 0.062, 0.297, 0.788, 4.05, 0.02228, 0.007, 2016, TRUE, 288, 'rocoso', TRUE),
(7, 'TRAPPIST-1e', 'transito', 0.0024, 0.070, 0.772, 0.920, 6.10, 0.02928, 0.005, 2016, TRUE, 251, 'rocoso', TRUE),
(7, 'TRAPPIST-1f', 'transito', 0.0033, 0.078, 0.934, 1.045, 9.21, 0.03853, 0.010, 2016, TRUE, 219, 'rocoso', TRUE),
(7, 'TRAPPIST-1g', 'transito', 0.0040, 0.083, 1.148, 1.129, 12.35, 0.04683, 0.002, 2016, TRUE, 199, 'rocoso', TRUE),
(7, 'TRAPPIST-1h', 'transito', 0.0010, 0.058, 0.331, 0.755, 18.77, 0.06189, 0.007, 2016, FALSE, 173, 'rocoso', TRUE),
-- HD 209458 b (Osiris)
(8, 'HD 209458 b', 'transito', 0.69, 1.359, 220, 14.3, 3.52, 0.047, 0.014, 1999, FALSE, 1449, 'jupiter_caliente', TRUE),
-- 51 Pegasi b (primer exoplaneta)
(9, '51 Pegasi b', 'velocidad_radial', 0.472, 1.9, 150, 12, 4.23, 0.0527, 0.013, 1995, FALSE, 1284, 'jupiter_caliente', TRUE),
-- Kepler-452b (Earth 2.0)
(6, 'Kepler-452b', 'transito', NULL, 1.6, NULL, 5, 384.8, 1.046, 0.107, 2015, TRUE, 265, 'super_tierra', TRUE),
-- Tau Ceti e
(10, 'Tau Ceti e', 'velocidad_radial', 0.012, NULL, 3.93, 1.8, 168.12, 0.552, 0.05, 2017, TRUE, 223, 'super_tierra', TRUE),
-- Tau Ceti f
(10, 'Tau Ceti f', 'velocidad_radial', 0.012, NULL, 3.93, 1.8, 636.13, 1.334, 0.03, 2017, TRUE, 172, 'super_tierra', TRUE);

-- =====================================================
-- INSERTAR OBSERVACIONES
-- =====================================================
INSERT INTO OBSERVACIONES (id_observador, id_estrella, fecha_hora, tipo_observacion, 
                           duracion_minutos, instrumento, telescopio, longitud_onda,
                           condiciones_atmosfericas, seeing_arcsec, humedad_porcentaje,
                           temperatura_celsius, notas, calidad_datos, procesado) VALUES
(1, 1, '2024-03-15 22:30:00', 'espectroscopia', 120, 'HARPS', 'ESO 3.6m', 'Visible', 'excelente', 0.8, 45, 12.5, 'Búsqueda de variaciones en velocidad radial', 'alta', TRUE),
(2, 7, '2024-04-10 01:15:00', 'fotometria', 180, 'SPECULOOS', 'TRAPPIST-South', 'Infrarrojo', 'buena', 1.2, 60, 8.3, 'Monitoreo de tránsitos planetarios', 'alta', TRUE),
(3, 2, '2024-05-20 23:45:00', 'astrometria', 90, 'SPHERE', 'VLT UT3', 'Visible', 'excelente', 0.6, 35, 10.1, 'Medición precisa de paralaje', 'alta', FALSE),
(1, 9, '2024-06-08 00:30:00', 'espectroscopia', 150, 'ESPRESSO', 'VLT', 'Visible', 'buena', 1.0, 50, 11.8, 'Análisis atmosférico de 51 Peg b', 'media', TRUE),
(4, 3, '2024-07-12 22:00:00', 'fotometria', 60, 'CCD Photometer', 'Telescopio UC', 'Visible', 'regular', 2.5, 70, 5.2, 'Curva de luz de Sirius', 'media', FALSE),
(2, 8, '2024-08-25 03:20:00', 'espectroscopia', 200, 'HARPS-N', 'TNG', 'Visible', 'excelente', 0.7, 40, 14.6, 'Caracterización atmosférica HD 209458 b', 'alta', TRUE),
(5, 6, '2024-09-14 01:50:00', 'transito', 240, 'Kepler Photometer', 'Kepler Space Tel', 'Visible', 'excelente', 0.0, 0, -270, 'Tránsito de Kepler-452b', 'alta', TRUE),
(3, 10, '2024-10-03 22:30:00', 'velocidad_radial', 180, 'PFS', 'Magellan', 'Visible', 'buena', 1.1, 55, 9.7, 'Confirmación de planetas Tau Ceti', 'alta', FALSE);

-- =====================================================
-- INSERTAR MEDICIONES
-- =====================================================
INSERT INTO MEDICIONES (id_observacion, tipo_medicion, valor, unidad, error_medicion, metodo, calibrado) VALUES
-- Observación 1 (Proxima Centauri)
(1, 'Velocidad Radial', -22.4, 'm/s', 0.8, 'Cross-correlation', TRUE),
(1, 'Anchura Línea H-alpha', 0.53, 'Angstrom', 0.02, 'Gaussian fit', TRUE),
-- Observación 2 (TRAPPIST-1)
(2, 'Magnitud Aparente', 18.798, 'mag', 0.005, 'Aperture Photometry', TRUE),
(2, 'Profundidad Tránsito', 0.73, '%', 0.03, 'Light curve fitting', TRUE),
(2, 'Duración Tránsito', 0.82, 'hours', 0.02, 'Mid-transit timing', TRUE),
-- Observación 3 (Alpha Centauri A)
(3, 'Paralaje', 747.23, 'mas', 0.17, 'Astrometric position', TRUE),
(3, 'Movimiento Propio RA', -3678.19, 'mas/year', 0.21, 'Multi-epoch astrometry', TRUE),
-- Observación 4 (51 Pegasi)
(4, 'Velocidad Radial', 55.94, 'm/s', 1.2, 'Template matching', TRUE),
(4, 'Índice Actividad CaII', 0.168, 'Index', 0.004, 'Line depth ratio', TRUE),
-- Observación 5 (Sirius)
(5, 'Magnitud V', -1.463, 'mag', 0.008, 'Differential photometry', TRUE),
(5, 'Color B-V', 0.009, 'mag', 0.012, 'Multi-band photometry', FALSE),
-- Observación 6 (HD 209458)
(6, 'Razón Escala Altura', 5.2, 'H', 0.3, 'Transmission spectroscopy', TRUE),
(6, 'Profundidad Na D', 0.042, '%', 0.008, 'Line absorption depth', TRUE),
-- Observación 7 (Kepler-452)
(7, 'Profundidad Tránsito', 0.28, '%', 0.01, 'Kepler pipeline', TRUE),
(7, 'Período Orbital', 384.843, 'days', 0.012, 'Phase folding', TRUE),
-- Observación 8 (Tau Ceti)
(8, 'Velocidad Radial', 8.7, 'm/s', 1.5, 'HARPS pipeline', TRUE),
(8, 'Metalicidad [Fe/H]', -0.50, 'dex', 0.05, 'Spectral synthesis', TRUE);

-- =====================================================
-- INSERTAR CONVERSIONES DE UNIDADES
-- =====================================================
INSERT INTO CONVERSIONES_UNIDADES (id_observador, fecha_hora, tipo_conversion, 
                                   valor_entrada, unidad_entrada, valor_salida, 
                                   unidad_salida, categoria, precision_decimales) VALUES
(1, '2024-03-15 22:00:00', 'Parsecs a Años Luz', 1.301, 'parsecs', 4.244, 'años luz', 'distancia', 3),
(1, '2024-03-15 22:05:00', 'UA a Kilómetros', 0.0485, 'UA', 7256520.5, 'km', 'distancia', 1),
(2, '2024-04-10 00:30:00', 'Masas Solares a Masas Terrestres', 0.0898, 'masas solares', 30020.4, 'masas terrestres', 'masa', 1),
(3, '2024-05-20 23:00:00', 'Kelvin a Celsius', 5790, 'K', 5516.85, '°C', 'temperatura', 2),
(4, '2024-06-08 00:00:00', 'Julios a Electronvoltios', 1.602e-19, 'J', 1.0, 'eV', 'energia', 10),
(2, '2024-08-25 02:45:00', 'Años Luz a Parsecs', 168, 'años luz', 51.54, 'parsecs', 'distancia', 2),
(5, '2024-09-14 01:00:00', 'Radios Solares a Kilómetros', 764, 'radios solares', 531476000, 'km', 'distancia', 0),
(1, '2024-10-01 15:30:00', 'Días a Años', 384.843, 'días', 1.054, 'años', 'tiempo', 3),
(3, '2024-10-10 10:15:00', 'Radios Jovianos a Radios Terrestres', 1.359, 'radios jovianos', 15.245, 'radios terrestres', 'distancia', 3),
(6, '2024-10-15 14:20:00', 'Masas Jovianas a Masas Terrestres', 0.69, 'masas jovianas', 219.3, 'masas terrestres', 'masa', 1),
(4, '2024-10-18 09:45:00', 'Magnitud Aparente a Flujo', -1.46, 'magnitud', 1.0e-7, 'W/m²', 'luminosidad', 8),
(7, '2024-10-20 16:00:00', 'Parsecs a Metros', 2.64, 'parsecs', 8.14e16, 'm', 'distancia', 2);

-- =====================================================
-- INSERTAR TAREAS DE INVESTIGACIÓN
-- =====================================================
INSERT INTO TAREAS_INVESTIGACION (id_observador, titulo, descripcion, fecha_creacion,
                                  fecha_vencimiento, estado, prioridad, 
                                  id_estrella_relacionada, id_exoplaneta_relacionado,
                                  etiquetas, porcentaje_avance) VALUES
(1, 'Análisis de curva de luz Proxima Cen', 
    'Procesar datos fotométricos de Proxima Centauri para buscar señales de tránsitos adicionales',
    '2024-03-16 09:00:00', '2024-04-15', 'en_progreso', 'alta', 1, 1, 'fotometria,exoplanetas', 65),
    
(2, 'Caracterización atmosférica TRAPPIST-1e',
    'Análisis espectroscópico de la atmósfera de TRAPPIST-1e usando datos del JWST',
    '2024-04-11 10:30:00', '2024-06-30', 'en_progreso', 'urgente', 7, 5, 'atmosferas,JWST,zona_habitable', 40),
    
(3, 'Medición precisa paralaje Alpha Cen',
    'Reducir datos astrométricos de Alpha Centauri A para mejorar la medición de distancia',
    '2024-05-21 08:00:00', '2024-05-30', 'completada', 'media', 2, NULL, 'astrometria,distancias', 100),
    
(1, 'Paper: Habitabilidad Proxima b',
    'Escribir artículo sobre condiciones de habitabilidad en Proxima Centauri b',
    '2024-06-01 14:00:00', '2024-09-15', 'en_progreso', 'alta', 1, 1, 'paper,habitabilidad,astrobiologia', 75),
    
(4, 'Calibración fotómetro CCD',
    'Realizar calibración completa del fotómetro CCD para observaciones de Sirius',
    '2024-07-10 11:00:00', '2024-07-20', 'completada', 'media', 3, NULL, 'instrumental,calibracion', 100),
    
(2, 'Propuesta observacional VLT 2025',
    'Redactar propuesta para tiempo de observación en VLT para estudio de HD 209458 b',
    '2024-08-20 09:30:00', '2024-10-01', 'completada', 'urgente', 8, 11, 'propuesta,VLT,atmosferas', 100),
    
(5, 'Análisis tránsitos Kepler-452b',
    'Procesar curvas de luz de Kepler para refinar parámetros orbitales de Kepler-452b',
    '2024-09-15 12:00:00', '2024-11-30', 'pendiente', 'media', 6, 13, 'kepler,transitos,super_tierras', 10),
    
(3, 'Confirmación planetas Tau Ceti',
    'Análisis estadístico de datos de velocidad radial para confirmar planetas de Tau Ceti',
    '2024-10-04 10:00:00', '2024-12-15', 'en_progreso', 'alta', 10, 14, 'velocidad_radial,confirmacion', 30),
    
(6, 'Tutorial Python: Análisis de Tránsitos',
    'Crear tutorial en Python para analizar curvas de luz de tránsitos exoplanetarios',
    '2024-10-08 15:00:00', '2024-11-01', 'en_progreso', 'baja', NULL, NULL, 'educacion,python,tutorial', 50),
    
(7, 'Base de datos exoplanetas confirmados',
    'Actualizar base de datos local con todos los exoplanetas confirmados hasta 2024',
    '2024-10-12 09:00:00', '2024-10-25', 'en_progreso', 'media', NULL, NULL, 'base_datos,catalogo', 80),
    
(1, 'Revisión paper TRAPPIST-1',
    'Revisar manuscrito enviado a Nature sobre sistema TRAPPIST-1',
    '2024-10-15 11:00:00', '2024-10-28', 'pendiente', 'urgente', 7, NULL, 'revision,paper', 0),
    
(4, 'Mantenimiento telescopio',
    'Realizar mantenimiento preventivo del telescopio de la universidad',
    '2024-10-18 08:00:00', '2024-10-22', 'en_progreso', 'alta', NULL, NULL, 'mantenimiento,instrumental', 60),
    
(8, 'Seminario: Métodos detección exoplanetas',
    'Preparar seminario sobre métodos de detección de exoplanetas para estudiantes',
    '2024-10-20 10:00:00', '2024-11-05', 'pendiente', 'media', NULL, NULL, 'educacion,seminario', 20);

-- =====================================================
-- VERIFICACIÓN DE DATOS INSERTADOS
-- =====================================================

-- Contar registros en cada tabla
SELECT 'OBSERVADORES' as Tabla, COUNT(*) as Total FROM OBSERVADORES
UNION ALL
SELECT 'ESTRELLAS', COUNT(*) FROM ESTRELLAS
UNION ALL
SELECT 'EXOPLANETAS', COUNT(*) FROM EXOPLANETAS
UNION ALL
SELECT 'OBSERVACIONES', COUNT(*) FROM OBSERVACIONES
UNION ALL
SELECT 'MEDICIONES', COUNT(*) FROM MEDICIONES
UNION ALL
SELECT 'CONVERSIONES_UNIDADES', COUNT(*) FROM CONVERSIONES_UNIDADES
UNION ALL
SELECT 'TAREAS_INVESTIGACION', COUNT(*) FROM TAREAS_INVESTIGACION;

-- =====================================================
-- FIN DEL SCRIPT
-- =====================================================