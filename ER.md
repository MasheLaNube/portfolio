erDiagram
    OBSERVADORES ||--o{ OBSERVACIONES : realiza
    OBSERVADORES ||--o{ TAREAS_INVESTIGACION : tiene
    ESTRELLAS ||--o{ OBSERVACIONES : registrada_en
    ESTRELLAS ||--o{ EXOPLANETAS : orbita
    OBSERVADORES ||--o{ CONVERSIONES_UNIDADES : ejecuta
    OBSERVACIONES ||--o{ MEDICIONES : contiene

    OBSERVADORES {
        int id_observador PK
        varchar nombre
        varchar email
        varchar institucion
        date fecha_registro
        varchar nivel_acceso
    }

    ESTRELLAS {
        int id_estrella PK
        varchar nombre
        varchar clasificacion_espectral
        float temperatura_k
        float magnitud_aparente
        float magnitud_absoluta
        float distancia_parsecs
        float masa_solar
        float radio_solar
        varchar constelacion
        date fecha_descubrimiento
    }

    EXOPLANETAS {
        int id_exoplaneta PK
        int id_estrella FK
        varchar nombre
        varchar metodo_deteccion
        float masa_jupiteres
        float radio_jupiteres
        float periodo_orbital_dias
        float distancia_orbital_ua
        float excentricidad
        int año_descubrimiento
        boolean zona_habitable
        float temperatura_equilibrio_k
    }

    OBSERVACIONES {
        int id_observacion PK
        int id_observador FK
        int id_estrella FK
        datetime fecha_hora
        varchar tipo_observacion
        float duracion_minutos
        varchar instrumento
        varchar condiciones_atmosfericas
        text notas
        varchar calidad_datos
    }

    MEDICIONES {
        int id_medicion PK
        int id_observacion FK
        varchar tipo_medicion
        float valor
        varchar unidad
        float error_medicion
        varchar metodo
    }

    CONVERSIONES_UNIDADES {
        int id_conversion PK
        int id_observador FK
        datetime fecha_hora
        varchar tipo_conversion
        float valor_entrada
        varchar unidad_entrada
        float valor_salida
        varchar unidad_salida
        varchar categoria
    }

    TAREAS_INVESTIGACION {
        int id_tarea PK
        int id_observador FK
        varchar titulo
        text descripcion
        date fecha_creacion
        date fecha_vencimiento
        varchar estado
        varchar prioridad
        int id_estrella_relacionada FK
        int id_exoplaneta_relacionado FK
    }