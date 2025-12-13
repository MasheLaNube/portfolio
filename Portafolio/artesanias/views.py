from django.shortcuts import render
from .models import Producto

def inicio(request):
    return render(request, "artesanias/inicio.html")

def productos(request):
    productos = Producto.objects.all()
    return render(request, "artesanias/tienda.html", {"productos": productos})
