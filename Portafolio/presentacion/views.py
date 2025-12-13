from django.shortcuts import render, redirect
from .forms import ContactForm


def presentacion(request):
    if request.method == "POST":
        form = ContactForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("presentacion:inicio")
    else:
        form = ContactForm()

    return render(request, "presentacion/inicio.html", {
        "form": form
    })