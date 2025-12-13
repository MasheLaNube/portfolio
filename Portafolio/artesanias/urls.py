from django.urls import path
from . import views

app_name = 'artesanias'

urlpatterns = [
    path("", views.inicio, name="inicio"),
    path("productos/", views.productos, name="productos"),
]

