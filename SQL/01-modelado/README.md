#  Modelado de Datos - AstroData

## Descripción

Esta carpeta contiene el modelo entidad-relación (ER) y la documentación del diseño de la base de datos del Sistema de Gestión de Datos Astronómicos.

---

##  Archivos

- **`diagrama-er.mmd`**: Diagrama Entidad-Relación en formato Mermaid
- **`modelo-relacional.sql`**: Script con comentarios descriptivos del modelo

---

##  Objetivo del Modelado

El modelo de datos está diseñado para:

1. **Almacenar información de estrellas**: Catálogo completo con clasificación espectral, magnitudes, distancias y parámetros físicos
2. **Registrar exoplanetas**: Planetas extrasolares con sus características orbitales y físicas
3. **Gestionar observaciones**: Registro de sesiones de observación astronómica
4. **Mediciones científicas**: Datos específicos obtenidos durante observaciones
5. **Conversiones de unidades**: Historial de conversiones astronómicas
6. **Tareas de investigación**: Sistema de gestión de proyectos científicos

---

##  Diagrama Entidad-Relación

El diagrama muestra las siguientes entidades y sus relaciones:

### Entidades

1. **OBSERVADORES** - Usuarios del sistema
2. **ESTRELLAS** - Catálogo estelar
3. **EXOPLANETAS** - Planetas extrasolares
4. **OBSERVACIONES** - Sesiones de observación
5. **MEDICIONES** - Datos científicos medidos
6. **CONVERSIONES_UNIDADES** - Historial de conversiones
7. **TAREAS_INVESTIGACION** - Gestión de proyectos

### Relaciones Principales

```
OBSERVADORES 1----N OBSERVACIONES
OBSERVADORES 1----N TAREAS_INVESTIGACION
OBSERVADORES 1----N CONVERSIONES_UNIDADES

ESTRELLAS 1----N EXOPLANETAS
ESTRELLAS 1----N OBSERVACIONES

OBSERVACIONES 1----N MEDICIONES

TAREAS_INVESTIGACION N----1 ESTRELLAS (opcional)
TAREAS_INVESTIGACION N----1 EXOPLANETAS (opcional)
```

---

##  Características del Modelo

### Normalización

El modelo está normalizado hasta la **3ra Forma Normal (3FN)**:

- **1FN**: Todos los atributos son atómicos (no hay grupos repetidos)
- **2FN**: No hay dependencias parciales de la clave primaria
- **3FN**: No hay dependencias transitivas

### Integridad Referencial

- **Claves Primarias**: Todas las tablas tienen identificadores únicos auto-incrementales
- **Claves Foráneas**: Relaciones explícitas entre tablas con constraints
- **ON DELETE**: Configurado apropiadamente (CASCADE, SET NULL)
- **ON UPDATE**: Mantiene consistencia en actualizaciones

### Índices

El modelo incluye índices para optimizar consultas frecuentes:

- Índices en claves foráneas
- Índices en campos de búsqueda común (nombre, fecha, tipo)
- Índices compuestos para consultas complejas

---

## Decisiones de Diseño

### ¿Por qué estas entidades?

**OBSERVADORES**: Necesitamos rastrear quién realiza observaciones, quién es responsable de tareas y quién usa el sistema.

**ESTRELLAS y EXOPLANETAS separados**: Aunque están relacionados, tienen atributos muy diferentes. Separar permite mejor organización y escalabilidad.

**MEDICIONES separada de OBSERVACIONES**: Una observación puede tener múltiples tipos de mediciones. Separar permite flexibilidad y evita columnas vacías.

**CONVERSIONES_UNIDADES**: Historial útil para reproducibilidad científica y análisis de uso del sistema.

**TAREAS_INVESTIGACION**: Integra la gestión de proyectos dentro del sistema de datos astronómicos