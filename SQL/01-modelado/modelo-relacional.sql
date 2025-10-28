-- modelo-relacional.sql
-- Descripción del modelo relacional (tablas principales y relaciones).
-- Ejecuta en la DB astronomia: CREATE DATABASE astronomia; USE astronomia;

-- CREATE DATABASE astronomia;
USE astronomia;

-- Resumen:
-- OBSERVADORES (1) --- (N) OBSERVACIONES
-- ESTRELLAS (1) --- (N) EXOPLANETAS
-- OBSERVACIONES (1) --- (N) MEDICIONES
-- OBSERVADORES (1) --- (N) TAREAS_INVESTIGACION
-- CONVERSIONES_UNIDADES guarda historial de conversiones

-- Tipos básicos utilizados:
-- INT AUTO_INCREMENT PK, VARCHAR para textos, DECIMAL para valores numéricos con precisión,
-- DATETIME para marcas de tiempo, BOOL/ TINYINT(1) para flags.

-- Nota: Este archivo describe el modelo. Para ejecutar DDL real, usa 02-ddl/create-tables.sql
