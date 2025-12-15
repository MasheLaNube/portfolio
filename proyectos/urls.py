from django.urls import path
from . import views

app_name = 'proyectos'

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('project1/', views.project1, name='proyecto 1'),
    path('project2/', views.project2, name='proyecto 2'),
    path("amenazas/", views.amenazas, name="amenazas"),
]
