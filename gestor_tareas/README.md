# Gestor de Tareas

Este proyecto es una pequeña aplicación web desarrollada en Django para gestionar tareas. Los usuarios pueden autenticarse, crear, ver y eliminar tareas, así como ver una lista de sus tareas asignadas. Para esta versión, las tareas se manejan en memoria, sin conexión a una base de datos real.

## Estructura del Proyecto

- **gestor_tareas/**: Carpeta principal del proyecto Django.
  - **settings.py**: Configuración general del proyecto, incluyendo `INSTALLED_APPS`.
  - **urls.py**: Configuración global de rutas del proyecto.
- **tareas/**: Aplicación que maneja la lógica de gestión de tareas.
  - **views.py**: Vistas para listar, agregar, eliminar y mostrar detalles de tareas.
  - **urls.py**: Rutas específicas de la aplicación `tareas`.
  - **forms.py**: Formularios para crear nuevas tareas usando Django Forms.
  - **templates/tareas/**: Plantillas HTML con Bootstrap para las vistas.

## Funcionalidades Principales

1. **Gestión de Tareas**
   - Crear tareas con título y descripción.
   - Listar todas las tareas del usuario autenticado.
   - Ver detalles de una tarea específica.
   - Eliminar tareas existentes.

2. **Autenticación y Seguridad**
   - Registro, inicio de sesión y cierre de sesión de usuarios usando `django.contrib.auth`.
   - Protección de vistas con el decorador `login_required`.
   - Cada usuario solo puede ver y gestionar sus propias tareas.

3. **Interfaz**
   - Plantillas HTML diseñadas con Bootstrap para una interfaz responsiva.
   - Formularios claros y accesibles para agregar tareas.

## Requisitos

- Python 3.12
- Django 5.2.8
- Un entorno virtual configurado para el proyecto

## Instalación y Ejecución

1. Clonar el repositorio:
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd gestor_tareas
   
2. Crear y activar un entorno virtual:

    python -m venv env
    source env/bin/activate   # Linux/macOS
    env\Scripts\activate      # Windows


3. Instalar dependencias:

    pip install django


4. Ejecutar el servidor de desarrollo:

    python manage.py runserver


5. Acceder a la aplicación en el navegador:

   http://127.0.0.1:8000/

## Consideraciones

Las tareas se almacenan en memoria, por lo que se perderán al reiniciar el servidor.

En producción, se recomienda configurar ALLOWED_HOSTS y ajustar DEBUG=False.
