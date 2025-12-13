from django.db import models

class Proyecto(models.Model):
    titulo = models.CharField(max_length=200)
    descripcion = models.TextField()
    tecnologia = models.CharField(max_length=200, help_text="Python, Django, C++, ROOT, SQL…")
    github = models.URLField(blank=True)
    imagen = models.ImageField(upload_to="proyectos/", blank=True, null=True)

    def __str__(self):
        return self.titulo


