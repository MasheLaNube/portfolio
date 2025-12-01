Gestor de Tareas – Proyecto Django


Este proyecto consiste en una aplicación web construida con Django para la gestión básica de tareas. Permite a los usuarios registrarse, iniciar sesión y administrar sus tareas personales. Cada usuario puede crear, visualizar, editar y eliminar sus propias tareas, garantizando privacidad mediante el sistema de autenticación integrado de Django.

El proyecto utiliza una interfaz sencilla desarrollada con Bootstrap para asegurar una experiencia limpia y responsiva.

Funcionalidades Principales
Autenticación de Usuarios

Registro de nuevos usuarios.

Inicio de sesión.

Cierre de sesión.

Protección de vistas mediante login_required.

Redirecciones configuradas con LOGIN_URL, LOGIN_REDIRECT_URL y LOGOUT_REDIRECT_URL.

Gestión de Tareas (CRUD)

Crear una nueva tarea mediante un formulario.

Listar todas las tareas creadas por el usuario autenticado.

Ver detalles individuales de cada tarea.

Eliminar tareas específicas.

Validación de formularios mediante Django Forms.

Estructura del Proyecto
gestor_tareas/
│
├── gestor_tareas/          Configuración principal del proyecto
│
├── tareas/                 Aplicación de gestión de tareas
│   ├── migrations/         Migraciones de base de datos
│   ├── templates/tareas/   Plantillas HTML
│   ├── static/tareas/      Archivos estáticos
│   ├── views.py            Vistas de la aplicación
│   ├── urls.py             Rutas de la aplicación
│   ├── models.py           Modelo de Tarea
│   └── forms.py            Formularios
│
└── manage.py               Herramienta de administración de Django

Requisitos

Python 3.10 o superior

Django 5.x

Entorno virtual recomendado

Instalación
1. Clonar el repositorio
git clone <url-del-repositorio>
cd gestor_tareas

2. Crear y activar el entorno virtual

Linux/macOS:

python3 -m venv env
source env/bin/activate


Windows:

python -m venv env
env\Scripts\activate

3. Instalar dependencias
pip install -r requirements.txt


Si no existe un requirements.txt, puede crearse con:

pip freeze > requirements.txt

Configuración del Proyecto
Migraciones

Antes de ejecutar el servidor, aplicar las migraciones:

python manage.py makemigrations
python manage.py migrate

Crear superusuario (opcional)
python manage.py createsuperuser

Configuración de autenticación en settings.py

Agregar o verificar lo siguiente:

LOGIN_URL = 'tareas:login'
LOGIN_REDIRECT_URL = 'tareas:lista_tareas'
LOGOUT_REDIRECT_URL = 'tareas:login'

Ejecutar el Servidor

Una vez instaladas las dependencias y completadas las migraciones, iniciar el servidor con:

python manage.py runserver


Luego acceder desde el navegador a:

http://127.0.0.1:8000/

Notas

La base de datos por defecto es SQLite, por lo que no se requiere configuración adicional.

Las tareas son privadas: cada usuario solo puede ver y administrar las suyas.

Las plantillas están diseñadas con Bootstrap para una visualización responsiva.
