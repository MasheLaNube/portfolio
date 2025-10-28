#  Creación de Tablas y Estructura de Base de Datos

## Descripción

Esta carpeta contiene scripts SQL para la definición y creación de la estructura de la base de datos. Incluye tablas, índices y vistas necesarias para soportar la gestión de datos astronómicos.

---

## Archivos

- **create-tables.sql**: Contiene la creación de todas las tablas principales con sus columnas, tipos de datos, restricciones y claves primarias/foráneas.
- **create-views.sql**: Define vistas para facilitar consultas frecuentes o complejas.
- **create-indexes.sql**: Crea índices adicionales para optimizar el rendimiento de las consultas.

---

## Objetivos

1. **Definir estructura de datos consistente**
   - Tablas normalizadas
   - Tipos de datos adecuados
   - Relaciones entre entidades

2. **Optimizar consultas y operaciones**
   - Índices para campos críticos
   - Vistas para simplificar consultas recurrentes

3. **Facilitar la manipulación y análisis de datos**
   - Preparar la base de datos para operaciones DML (INSERT, UPDATE, DELETE)
   - Facilitar consultas SQL de diferentes niveles de complejidad

---

## Ejecución

### Ejecutar todos los scripts DDL

```bash
mysql -u usuario -p astronomia < 02-ddl/create-tables.sql
mysql -u usuario -p astronomia < 02-ddl/create-views.sql
mysql -u usuario -p astronomia < 02-ddl/create-indexes.sql
```

## Ejecutar scripts individualmente
-- Conectar a la base de datos
mysql -u usuario -p astronomia

-- Ejecutar cada script por separado
SOURCE 02-ddl/create-tables.sql;
SOURCE 02-ddl/create-views.sql;
SOURCE 02-ddl/create-indexes.sql;

## Conceptos Aplicados
# Tablas

Definición de columnas con tipos de datos

Claves primarias y foráneas

Restricciones NOT NULL y UNIQUE

Auto-increment para identificadores

# Vistas

Consultas predefinidas para simplificar el acceso a información compleja

Combinación de varias tablas en una vista

Optimización para reportes y análisis

# Índices

Índices simples y compuestos

Mejora del rendimiento en JOINs y WHERE

Consideración de campos usados frecuentemente en búsquedas

# Buenas Prácticas

Crear tablas antes de vistas e índices: Evita errores de referencia.

Nombrar entidades de forma consistente: Facilita el mantenimiento.

Definir claves foráneas correctamente: Mantiene la integridad referencial.

Verificar índices: Asegura que las consultas frecuentes sean eficientes.

Comentar scripts: Documenta propósito y relaciones.


[← Volver al README Principal](../README.md)