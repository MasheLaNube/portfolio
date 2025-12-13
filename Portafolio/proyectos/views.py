# proyectos/views.py
from django.shortcuts import render

def inicio(request):
    return render(request, "proyectos/inicio.html")

def project1(request):
    return render(request, "proyectos/memes.html")

def project2(request):
    return render(request, "proyectos/cybersecurity/index1.html")

def amenazas(request):
    return render(request, "proyectos/cybersecurity/amenazas.html")
