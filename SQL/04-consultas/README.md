# Consultas SQL

## Descripción

Esta carpeta contiene consultas SQL organizadas por complejidad y tipo, diseñadas para extraer información valiosa de la base de datos.

---

## Archivos

- **`consultas-basicas.sql`**: Consultas simples con SELECT, WHERE y ORDER BY  
- **`consultas-joins.sql`**: Consultas con INNER JOIN, LEFT JOIN y combinaciones de múltiples tablas  
- **`consultas-agregacion.sql`**: Consultas con GROUP BY, COUNT, AVG, SUM, MIN, MAX y HAVING  
- **`consultas-avanzadas.sql`**: Subconsultas, WINDOW functions y consultas complejas  

---

## Categorías de Consultas

### Consultas Básicas (1-5)
- SELECT con WHERE
- ORDER BY
- Filtros simples

### Consultas con JOINS (6-8)
- INNER JOIN
- LEFT JOIN
- Múltiples tablas

### Consultas con Agregación (9-12)
- GROUP BY
- COUNT, AVG, SUM, MIN, MAX
- HAVING

### Consultas con Subconsultas (13-15)
- Subconsultas en WHERE
- Subconsultas correlacionadas
- RANK() y WINDOW functions

### Análisis Temporal (16-18)
- Funciones de fecha
- Agrupación por tiempo
- Análisis de tendencias

### Análisis Científico (19-22)
- Comparaciones estadísticas
- Métricas de calidad
- Análisis de completitud

### Búsqueda Avanzada (23-25)
- Consultas complejas multi-criterio
- Sistemas específicos
- Informes detallados

---

## Ejecución

### Ejecutar todas las consultas

```bash
mysql -u usuario -p astronomia < 04-consultas/consultas-avanzadas.sql


### Ejecutar consultas específicas

```sql
-- Conectar a la base de datos
mysql -u usuario -p astronomia

-- Ejecutar una consulta específica
SOURCE 04-consultas/consultas-avanzadas.sql

-- O copiar y pegar consultas individuales
```

---

##  Ejemplos de Consultas

### Consulta Básica: Estrellas cercanas

```sql
SELECT nombre, clasificacion_espectral, distancia_parsecs
FROM ESTRELLAS
WHERE distancia_parsecs < 10
ORDER BY distancia_parsecs ASC;
```

**Resultado esperado:**
| nombre | clasificacion_espectral | distancia_parsecs |
|--------|------------------------|-------------------|
| Proxima Centauri | M5.5V | 1.301 |
| Alpha Centauri A | G2V | 1.339 |
| Sirius | A1V | 2.64 |

---

### Consulta con JOIN: Planetas en zona habitable

```sql
SELECT e.nombre AS planeta, 
       est.nombre AS estrella,
       e.masa_tierras,
       e.temperatura_equilibrio_k
FROM EXOPLANETAS e
JOIN ESTRELLAS est ON e.id_estrella = est.id_estrella
WHERE e.zona_habitable = TRUE
ORDER BY e.masa_tierras ASC;
```

**Utilidad:** Identificar candidatos para búsqueda de vida

---

### Consulta con Agregación: Estadísticas por método de detección

```sql
SELECT metodo_deteccion,
       COUNT(*) AS total_planetas,
       ROUND(AVG(masa_tierras), 2) AS masa_promedio,
       SUM(CASE WHEN zona_habitable = TRUE THEN 1 ELSE 0 END) AS en_zona_habitable
FROM EXOPLANETAS
GROUP BY metodo_deteccion
ORDER BY total_planetas DESC;
```

**Resultado esperado:**
| metodo_deteccion | total_planetas | masa_promedio | en_zona_habitable |
|------------------|----------------|---------------|-------------------|
| transito | 9 | 1.12 | 5 |
| velocidad_radial | 5 | 2.45 | 3 |

**Utilidad:** Analizar efectividad de métodos de detección

---

### Consulta con Subconsulta: Estrellas más observadas que el promedio

```sql
SELECT est.nombre,
       COUNT(o.id_observacion) AS num_observaciones
FROM ESTRELLAS est
JOIN OBSERVACIONES o ON est.id_estrella = o.id_estrella
GROUP BY est.id_estrella, est.nombre
HAVING COUNT(o.id_observacion) > (
    SELECT AVG(cuenta)
    FROM (
        SELECT COUNT(*) AS cuenta
        FROM OBSERVACIONES
        GROUP BY id_estrella
    ) AS subconsulta
)
ORDER BY num_observaciones DESC;
```

**Utilidad:** Identificar objetivos prioritarios de investigación

---

### Consulta Temporal: Actividad mensual 2024

```sql
SELECT DATE_FORMAT(fecha_hora, '%Y-%m') AS mes,
       COUNT(*) AS num_observaciones,
       COUNT(DISTINCT id_observador) AS observadores_activos
FROM OBSERVACIONES
WHERE YEAR(fecha_hora) = 2024
GROUP BY DATE_FORMAT(fecha_hora, '%Y-%m')
ORDER BY mes;
```

**Resultado esperado:**
| mes | num_observaciones | observadores_activos |
|----------|-------------------|----------------------|
| 2024-03 | 1 | 1 |
| 2024-04 | 1 | 1 |
| 2024-05 | 1 | 1 |

**Utilidad:** Monitorear actividad del observatorio

---

### Consulta Científica: Planetas similares a la Tierra

```sql
SELECT ex.nombre AS planeta,
       est.nombre AS estrella,
       est.distancia_parsecs,
       ex.masa_tierras,
       ex.temperatura_equilibrio_k
FROM EXOPLANETAS ex
JOIN ESTRELLAS est ON ex.id_estrella = est.id_estrella
WHERE ex.zona_habitable = TRUE
  AND ex.masa_tierras BETWEEN 0.5 AND 10
  AND ex.temperatura_equilibrio_k BETWEEN 200 AND 350
ORDER BY ABS(ex.masa_tierras - 1.0), est.distancia_parsecs;
```

**Utilidad:** Búsqueda de candidatos para misiones espaciales

---

##  Casos de Uso Prácticos

### Caso 1: Planificar Campaña de Observación

**Objetivo:** Encontrar estrellas cercanas con planetas potencialmente habitables

```sql
SELECT est.nombre AS estrella,
       est.distancia_parsecs,
       est.magnitud_aparente,
       COUNT(ex.id_exoplaneta) AS num_planetas,
       GROUP_CONCAT(ex.nombre) AS planetas
FROM ESTRELLAS est
JOIN EXOPLANETAS ex ON est.id_estrella = ex.id_estrella
WHERE est.distancia_parsecs < 50
  AND ex.zona_habitable = TRUE
  AND est.magnitud_aparente < 15
GROUP BY est.id_estrella
ORDER BY est.distancia_parsecs;
```

---

### Caso 2: Evaluar Productividad del Equipo

**Objetivo:** Identificar observadores más activos

```sql
SELECT o.nombre AS observador,
       o.institucion,
       COUNT(DISTINCT obs.id_observacion) AS observaciones,
       COUNT(DISTINCT t.id_tarea) AS tareas,
       ROUND(AVG(obs.duracion_minutos), 2) AS duracion_promedio
FROM OBSERVADORES o
LEFT JOIN OBSERVACIONES obs ON o.id_observador = obs.id_observador
LEFT JOIN TAREAS_INVESTIGACION t ON o.id_observador = t.id_observador
GROUP BY o.id_observador
HAVING observaciones > 0
ORDER BY observaciones DESC;
```

---

### Caso 3: Análisis de Calidad de Datos

**Objetivo:** Evaluar calidad de observaciones por instrumento

```sql
SELECT instrumento,
       COUNT(*) AS total_obs,
       SUM(CASE WHEN calidad_datos = 'alta' THEN 1 ELSE 0 END) AS alta_calidad,
       ROUND(100.0 * SUM(CASE WHEN calidad_datos = 'alta' THEN 1 ELSE 0 END) / COUNT(*), 2) AS porcentaje_alta
FROM OBSERVACIONES
WHERE instrumento IS NOT NULL
GROUP BY instrumento
ORDER BY porcentaje_alta DESC;
```

---

### Caso 4: Descubrimientos por Año

**Objetivo:** Análisis de tendencia de descubrimientos

```sql
SELECT año_descubrimiento,
       COUNT(*) AS nuevos_planetas,
       SUM(COUNT(*)) OVER (ORDER BY año_descubrimiento) AS total_acumulado,
       SUM(CASE WHEN zona_habitable = TRUE THEN 1 ELSE 0 END) AS habitables
FROM EXOPLANETAS
GROUP BY año_descubrimiento
ORDER BY año_descubrimiento;
```

---

### Caso 5: Tareas Próximas a Vencer

**Objetivo:** Gestión de prioridades

```sql
SELECT t.titulo,
       o.nombre AS responsable,
       t.estado,
       t.fecha_vencimiento,
       DATEDIFF(t.fecha_vencimiento, CURDATE()) AS dias_restantes,
       t.porcentaje_avance
FROM TAREAS_INVESTIGACION t
JOIN OBSERVADORES o ON t.id_observador = o.id_observador
WHERE t.estado IN ('pendiente', 'en_progreso')
  AND t.fecha_vencimiento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)
ORDER BY dias_restantes ASC;
```

---

##  Consultas de Reportes

### Reporte Completo de un Sistema Planetario

```sql
-- Sistema TRAPPIST-1
SELECT 
    'Estrella' AS tipo,
    est.nombre AS nombre,
    est.clasificacion_espectral AS detalle,
    NULL AS valor_numerico
FROM ESTRELLAS est 
WHERE est.nombre = 'TRAPPIST-1'

UNION ALL

SELECT 'Planeta', ex.nombre, 
       CONCAT(ex.masa_tierras, ' M⊕'), 
       ex.temperatura_equilibrio_k
FROM EXOPLANETAS ex
JOIN ESTRELLAS est ON ex.id_estrella = est.id_estrella
WHERE est.nombre = 'TRAPPIST-1'
ORDER BY tipo DESC, nombre;
```

---

### Resumen Estadístico General

```sql
SELECT 
    'Total Estrellas' AS metrica,
    COUNT(*) AS valor
FROM ESTRELLAS

UNION ALL

SELECT 'Estrellas con Planetas',
    COUNT(DISTINCT id_estrella)
FROM EXOPLANETAS

UNION ALL

SELECT 'Total Exoplanetas',
    COUNT(*)
FROM EXOPLANETAS

UNION ALL

SELECT 'Planetas en Zona Habitable',
    COUNT(*)
FROM EXOPLANETAS
WHERE zona_habitable = TRUE

UNION ALL

SELECT 'Total Observaciones',
    COUNT(*)
FROM OBSERVACIONES

UNION ALL

SELECT 'Observadores Activos',
    COUNT(*)
FROM OBSERVADORES
WHERE activo = TRUE;
```

---

##  Cumplimiento de Requerimientos

### Requerimiento 2: SQL para Obtención de Información

 **SELECT**: Múltiples ejemplos de consultas
 **WHERE**: Filtros simples y complejos
 **JOIN**: INNER, LEFT, múltiples tablas
 **GROUP BY**: Agregaciones y estadísticas
 **ORDER BY**: Ordenamiento de resultados
 **Subconsultas**: Consultas anidadas
 **Funciones**: Agregación, fecha, string

---

##  Conceptos Aplicados

### JOINs

- **INNER JOIN**: Solo registros coincidentes
- **LEFT JOIN**: Todos de la izquierda + coincidencias
- **Múltiples JOINs**: Combinar 3+ tablas

### Agregación

- **COUNT()**: Contar registros
- **AVG()**: Promedio
- **SUM()**: Suma total
- **MIN/MAX()**: Valores extremos
- **GROUP_CONCAT()**: Concatenar valores

### Funciones de Fecha

- **DATE_FORMAT()**: Formatear fechas
- **YEAR(), MONTH()**: Extraer componentes
- **DATEDIFF()**: Diferencia de días
- **CURDATE()**: Fecha actual

### Window Functions

- **RANK()**: Ranking de valores
- **OVER()**: Particiones y ordenamiento
- **SUM() OVER()**: Totales acumulados

---

## 🔧 Optimización de Consultas

### Usar EXPLAIN

```sql
EXPLAIN SELECT * 
FROM EXOPLANETAS ex
JOIN ESTRELLAS est ON ex.id_estrella = est.id_estrella
WHERE ex.zona_habitable = TRUE;
```

### Índices Apropiados

```sql
-- Verificar que existen índices en campos de JOIN y WHERE
SHOW INDEX FROM EXOPLANETAS;
```

### Limitar Resultados

```sql
-- Usar LIMIT para pruebas
SELECT * FROM OBSERVACIONES
ORDER BY fecha_hora DESC
LIMIT 10;
```

---

##  Tips de Uso

1. **Empezar Simple**: Probar primero con SELECT * antes de consultas complejas
2. **Usar LIMIT**: Para verificar resultados sin cargar toda la tabla
3. **Comentar Código**: Documentar qué hace cada consulta
4. **Guardar Favoritas**: Crear vistas para consultas frecuentes
5. **Verificar NULL**: Considerar valores NULL en condiciones

---

##  Referencias

- [MySQL SELECT Reference](https://dev.mysql.com/doc/refman/8.0/en/select.html)
- [MySQL JOIN Syntax](https://dev.mysql.com/doc/refman/8.0/en/join.html)
- [MySQL Aggregate Functions](https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html)
- [MySQL Window Functions](https://dev.mysql.com/doc/refman/8.0/en/window-functions.html)

---

**[← Volver al README Principal](../README.md)**