from django.contrib import admin
from .models import Publicacion
from .models import ContactMessage

admin.site.register(Publicacion)

@admin.register(ContactMessage)
class ContactMessageAdmin(admin.ModelAdmin):
    list_display = ("name", "email", "subject", "created_at")
    search_fields = ("name", "email", "subject")