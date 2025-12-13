from django.db import models

class Producto(models.Model):
    nombre = models.CharField(max_length=200)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=7, decimal_places=2)
    stock = models.PositiveIntegerField(default=0)
    imagen = models.ImageField(upload_to="artesanias/", blank=True, null=True)
    categoria = models.CharField(
        max_length=100,
        choices=[
            ("trinket", "Trinket Dish"),
            ("pin", "Pin"),
            ("aro", "Aro / Arete"),
            ("colgante", "Colgante"),
            ("llavero", "Llavero"),
            ("sticker", "Sticker"),
            ("iman", "Imán"),
            ("colgante", "Colgante"),
            ("hippers", "Hippers"),
        ]
    )

    def __str__(self):
        return self.nombre
