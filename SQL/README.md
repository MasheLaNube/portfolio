# 🌟 Sistema de Gestión de Datos Astronómicos (AstroData)

##  Descripción del Proyecto

**AstroData** es un sistema completo de gestión de bases de datos relacionales diseñado para administrar información astronómica, incluyendo observaciones de estrellas, exoplanetas, mediciones científicas y tareas de investigación. Este proyecto integra herramientas previamente desarrolladas en Python para astronomía (exolog, star classifier, conversor de unidades) en una base de datos relacional robusta.

###  Objetivos

- Centralizar información astronómica en una base de datos estructurada
- Facilitar el análisis y consulta de datos de observaciones
- Gestionar catálogos de estrellas y exoplanetas
- Registrar conversiones de unidades astronómicas
- Administrar tareas de investigación científica

---

##  Estructura del Repositorio

```
astro-database-project/
│
├── README.md                          # Este archivo
│
├── 01-modelado/
│   ├── README.md                      # Documentación del modelo
│   ├── diagrama-er.mmd                # Diagrama Entidad-Relación (Mermaid)
│   └── modelo-relacional.sql          # Descripción del modelo
│
├── 02-ddl/
│   ├── README.md                      # Guía de creación de tablas
│   ├── create-tables.sql              # Creación de tablas e índices
│   ├── create-views.sql               # Vistas del sistema
│   └── create-indexes.sql             # Índices adicionales
│
├── 03-dml/
│   ├── README.md                      # Guía de manipulación de datos
│   ├── insert-data.sql                # Inserción de datos de ejemplo
│   ├── update-data.sql                # Operaciones de actualización
│   └── delete-data.sql                # Operaciones de eliminación
│
├── 04-consultas/
│   ├── README.md                      # Guía de consultas
│   ├── consultas-basicas.sql          # SELECT, WHERE, ORDER BY
│   ├── consultas-joins.sql            # JOIN, LEFT JOIN, RIGHT JOIN
│   ├── consultas-agregacion.sql       # GROUP BY, HAVING, COUNT, AVG
│   └── consultas-avanzadas.sql        # Subconsultas, WINDOW functions
│
└── 05-documentacion/
    ├── diccionario-datos.md           # Diccionario de datos completo
    ├── casos-uso.md                   # Casos de uso del sistema
    └── manual-usuario.md              # Manual de usuario
```

---

##  Modelo de Datos

### Entidades Principales

1. **OBSERVADORES**: Usuarios del sistema (astrónomos e investigadores)
2. **ESTRELLAS**: Catálogo de estrellas observadas y clasificadas
3. **EXOPLANETAS**: Catálogo de planetas extrasolares descubiertos
4. **OBSERVACIONES**: Registro de observaciones astronómicas realizadas
5. **MEDICIONES**: Mediciones específicas de cada observación
6. **CONVERSIONES_UNIDADES**: Historial de conversiones astronómicas
7. **TAREAS_INVESTIGACION**: Sistema de gestión de tareas científicas

### Relaciones

- Un **OBSERVADOR** realiza múltiples **OBSERVACIONES** (1:N)
- Una **ESTRELLA** puede tener múltiples **EXOPLANETAS** (1:N)
- Una **OBSERVACIÓN** contiene múltiples **MEDICIONES** (1:N)
- Un **OBSERVADOR** puede tener múltiples **TAREAS** (1:N)
- Una **ESTRELLA** se registra en múltiples **OBSERVACIONES** (1:N)

---

##  Instalación y Configuración

### Requisitos Previos

- MySQL 8.0 o superior / MariaDB 10.5 o superior
- Cliente MySQL (mysql-client, MySQL Workbench, DBeaver, etc.)
- Git (para clonar el repositorio)

### Pasos de Instalación

1. **Clonar el repositorio**
```bash
git clone https://github.com/tu-usuario/astro-database-project.git
cd astro-database-project
```

2. **Crear la base de datos**
```sql
CREATE DATABASE astrodata CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE astrodata;
```

3. **Ejecutar scripts DDL (Crear tablas)**
```bash
mysql -u usuario -p astrodata < 02-ddl/create-tables.sql
```

4. **Cargar datos de ejemplo**
```bash
mysql -u usuario -p astrodata < 03-dml/insert-data.sql
```

5. **Verificar instalación**
```sql
SHOW TABLES;
SELECT COUNT(*) FROM ESTRELLAS;
SELECT COUNT(*) FROM EXOPLANETAS;
```

---

##  Uso del Sistema

### Consultas Básicas

```sql
-- Listar todas las estrellas
SELECT * FROM ESTRELLAS;

-- Buscar exoplanetas en zona habitable
SELECT nombre, masa_tierras, temperatura_equilibrio_k 
FROM EXOPLANETAS 
WHERE zona_habitable = TRUE;

-- Observaciones recientes
SELECT o.fecha_hora, obs.nombre, e.nombre AS estrella
FROM OBSERVACIONES o
JOIN OBSERVADORES obs ON o.id_observador = obs.id_observador
JOIN ESTRELLAS e ON o.id_estrella = e.id_estrella
ORDER BY o.fecha_hora DESC
LIMIT 10;
```

### Consultas Avanzadas

Ver archivo `04-consultas/consultas-avanzadas.sql` para ejemplos completos de:
- Consultas con múltiples JOINs
- Agregaciones complejas (GROUP BY, HAVING)
- Subconsultas
- Window functions
- Análisis estadísticos

---

##  Casos de Uso

### 1. Registro de Nueva Observación

```sql
-- Registrar observación
INSERT INTO OBSERVACIONES (id_observador, id_estrella, tipo_observacion, 
                           duracion_minutos, instrumento)
VALUES (1, 5, 'espectroscopia', 120, 'HARPS');

-- Agregar mediciones
INSERT INTO MEDICIONES (id_observacion, tipo_medicion, valor, unidad)
VALUES (LAST_INSERT_ID(), 'Velocidad Radial', -22.4, 'm/s');
```

### 2. Buscar Planetas Similares a la Tierra

```sql
SELECT ex.nombre, est.nombre AS estrella, ex.masa_tierras, ex.temperatura_equilibrio_k
FROM EXOPLANETAS ex
JOIN ESTRELLAS est ON ex.id_estrella = est.id_estrella
WHERE ex.zona_habitable = TRUE
  AND ex.masa_tierras BETWEEN 0.8 AND 1.5
  AND ex.temperatura_equilibrio_k BETWEEN 250 AND 300
ORDER BY ABS(ex.masa_tierras - 1.0);
```

### 3. Gestión de Tareas de Investigación

```sql
-- Ver tareas pendientes urgentes
SELECT titulo, fecha_vencimiento, porcentaje_avance
FROM TAREAS_INVESTIGACION
WHERE estado IN ('pendiente', 'en_progreso')
  AND prioridad = 'urgente'
ORDER BY fecha_vencimiento;

-- Actualizar progreso
UPDATE TAREAS_INVESTIGACION
SET porcentaje_avance = 75, estado = 'en_progreso'
WHERE id_tarea = 1;
```

---

##  Mantenimiento

### Respaldo de la Base de Datos

```bash
# Respaldar toda la base de datos
mysqldump -u usuario -p astrodata > backup_astrodata_$(date +%Y%m%d).sql

# Respaldar solo estructura
mysqldump -u usuario -p --no-data astrodata > estructura_astrodata.sql

# Respaldar solo datos
mysqldump -u usuario -p --no-create-info astrodata > datos_astrodata.sql
```

### Restaurar desde Respaldo

```bash
mysql -u usuario -p astrodata < backup_astrodata_20241027.sql
```

### Optimización

```sql
-- Analizar tablas
ANALYZE TABLE ESTRELLAS, EXOPLANETAS, OBSERVACIONES;

-- Optimizar tablas
OPTIMIZE TABLE OBSERVACIONES, MEDICIONES;

-- Ver estadísticas de índices
SHOW INDEX FROM ESTRELLAS;
```

---

##  Documentación Adicional

- **[Diccionario de Datos](05-documentacion/diccionario-datos.md)**: Descripción detallada de cada tabla y campo
- **[Casos de Uso](05-documentacion/casos-uso.md)**: Escenarios de uso completos
- **[Manual de Usuario](05-documentacion/manual-usuario.md)**: Guía para usuarios finales

---

##  Contribuciones

### Estructura de Commits

Este proyecto sigue las convenciones de commits semánticos:

```
feat: Agregar tabla de instrumentos astronómicos
fix: Corregir constraint en tabla EXOPLANETAS
docs: Actualizar README con ejemplos de consultas
refactor: Optimizar consultas de agregación
```

### Proceso de Desarrollo

1. Fork del repositorio
2. Crear rama feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit de cambios (`git commit -m 'feat: Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Crear Pull Request

---

##  Historial de Versiones

### v1.0.0 (2024-10-27)
-  Modelo de datos completo con 7 tablas principales
-  Datos de ejemplo de 10 estrellas y 15 exoplanetas
-  25+ consultas SQL de ejemplo
-  Operaciones CRUD completas
-  Vistas y índices optimizados
-  Documentación completa

---

##  Contexto Académico

Este proyecto fue desarrollado como parte del curso de **Programa Especial “Talento Digital Para Chile”, Becas Laborales 2024, Desarrollo de Aplicaciones Full Stack Python**, demostrando competencias en:

1.  Modelado de bases de datos relacionales
2.  Lenguaje SQL (DDL, DML, DCL)
3.  Diseño de consultas complejas
4.  Normalización de datos
5.  Optimización y mantenimiento

---

## 📧 Contacto

**Desarrollador**: Marcela López
**Email**: mashelopezulloa@gmail.com  
**GitHub**: [@MasheLaNube](https://github.com/MasheLaNube)

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

---

## 🌠 Agradecimientos

- Datos basados en catálogos de **NASA Exoplanet Archive**
- Información estelar de **SIMBAD Astronomical Database**
- Sistema TRAPPIST-1 data de **ESO**
- Inspiración en proyectos previos de Python para astronomía

---

## 🔗 Enlaces Útiles

- [NASA Exoplanet Archive](https://exoplanetarchive.ipac.caltech.edu/)
- [SIMBAD Astronomical Database](http://simbad.u-strasbg.fr/simbad/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [SQL Tutorial](https://www.w3schools.com/sql/)

---