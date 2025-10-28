# Manipulación de Datos SQL (DML)

## Descripción

Esta carpeta contiene scripts SQL para la manipulación de datos en la base de datos. Incluye ejemplos de inserción, actualización y eliminación de registros, permitiendo practicar y aplicar operaciones DML (Data Manipulation Language).

---

## Archivos

* **`insert-data.sql`**: Inserción de datos de ejemplo en las tablas principales
* **`update-data.sql`**: Actualización de registros existentes
* **`delete-data.sql`**: Eliminación de registros según condiciones específicas

---

## Categorías de Operaciones DML

### Inserción de Datos

* INSERT INTO
* Inserción de registros simples y múltiples
* Uso de valores predeterminados y NULL

### Actualización de Datos

* UPDATE con WHERE
* Modificación de uno o varios campos
* Actualización condicional y masiva

### Eliminación de Datos

* DELETE con WHERE
* Eliminación de registros específicos
* Precaución con eliminaciones masivas

---

## Ejecución

### Ejecutar todos los scripts

```bash
mysql -u usuario -p astronomia < 03-dml/insert-data.sql
mysql -u usuario -p astronomia < 03-dml/update-data.sql
mysql -u usuario -p astronomia < 03-dml/delete-data.sql
```

### Ejecutar scripts específicos

```sql
-- Conectar a la base de datos
mysql -u usuario -p astronomia

-- Ejecutar un script de inserción
SOURCE 03-dml/insert-data.sql;

-- Ejecutar un script de actualización
SOURCE 03-dml/update-data.sql;

-- Ejecutar un script de eliminación
SOURCE 03-dml/delete-data.sql;
```

---

## Ejemplos

### Inserción: Nuevas estrellas

```sql
INSERT INTO ESTRELLAS (nombre, clasificacion_espectral, distancia_parsecs, magnitud_aparente)
VALUES ('Barnard', 'M4V', 1.83, 9.54),
       ('Wolf 359', 'M6V', 2.39, 13.5);
```

### Inserción: Nuevos exoplanetas

```sql
INSERT INTO EXOPLANETAS (nombre, id_estrella, masa_tierras, radio_tierras, zona_habitable, metodo_deteccion, año_descubrimiento)
VALUES ('Kepler-452b', 1, 5.0, 1.6, TRUE, 'transito', 2015);
```

### Actualización: Corregir clasificación espectral

```sql
UPDATE ESTRELLAS
SET clasificacion_espectral = 'M5V'
WHERE nombre = 'Barnard';
```

### Actualización: Cambiar estado de tareas

```sql
UPDATE TAREAS_INVESTIGACION
SET estado = 'completada', porcentaje_avance = 100
WHERE fecha_vencimiento < CURDATE() AND estado != 'completada';
```

### Eliminación: Eliminar observaciones antiguas

```sql
DELETE FROM OBSERVACIONES
WHERE fecha_hora < '2023-01-01';
```

### Eliminación: Limpiar conversiones incorrectas

```sql
DELETE FROM CONVERSIONES_UNIDADES
WHERE valor_entrada IS NULL OR valor_salida IS NULL;
```

---

## Casos de Uso Prácticos

### Caso 1: Agregar un nuevo sistema estelar con planetas

```sql
-- Insertar estrella
INSERT INTO ESTRELLAS (nombre, clasificacion_espectral, distancia_parsecs)
VALUES ('TRAPPIST-1', 'M8V', 12.1);

-- Insertar planetas asociados
INSERT INTO EXOPLANETAS (nombre, id_estrella, masa_tierras, radio_tierras, zona_habitable, metodo_deteccion, año_descubrimiento)
VALUES ('TRAPPIST-1b', 3, 1.02, 1.09, FALSE, 'transito', 2016),
       ('TRAPPIST-1c', 3, 1.16, 1.06, FALSE, 'transito', 2016);
```

### Caso 2: Actualizar masa de un exoplaneta tras nueva medición

```sql
UPDATE EXOPLANETAS
SET masa_tierras = 1.03
WHERE nombre = 'TRAPPIST-1b';
```

### Caso 3: Eliminar observaciones duplicadas

```sql
DELETE o1 FROM OBSERVACIONES o1
INNER JOIN OBSERVACIONES o2
ON o1.id_observacion > o2.id_observacion
AND o1.id_estrella = o2.id_estrella
AND o1.fecha_hora = o2.fecha_hora;
```

### Caso 4: Actualizar prioridad de tareas próximas a vencer

```sql
UPDATE TAREAS_INVESTIGACION
SET prioridad = 'urgente'
WHERE fecha_vencimiento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);
```

### Caso 5: Limpiar conversiones antiguas

```sql
DELETE FROM CONVERSIONES_UNIDADES
WHERE fecha_hora < '2024-01-01';
```

---

## Buenas Prácticas DML

1. **Respaldar antes de modificar**: Siempre tener copias antes de UPDATE o DELETE masivos
2. **Usar WHERE**: Evitar modificaciones o eliminaciones accidentales de toda la tabla
3. **Probar con SELECT**: Verificar qué registros serán afectados antes de aplicar cambios
4. **Transacciones**: Usar COMMIT y ROLLBACK cuando sea necesario
5. **Documentar cambios**: Añadir comentarios para seguimiento de modificaciones

---

## Referencias

* [MySQL INSERT Reference](https://dev.mysql.com/doc/refman/8.0/en/insert.html)
* [MySQL UPDATE Reference](https://dev.mysql.com/doc/refman/8.0/en/update.html)
* [MySQL DELETE Reference](https://dev.mysql.com/doc/refman/8.0/en/delete.html)

---

[← Volver al README Principal](../README.md)
