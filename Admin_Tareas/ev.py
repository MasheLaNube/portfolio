import json
import os
import time

ARCHIVO_TAREAS = "tareas.json"

def cargar_tareas():
    if os.path.exists(ARCHIVO_TAREAS):
        archivo= open(ARCHIVO_TAREAS, "r", encoding="utf-8")
        contenido= archivo.read()
        archivo.close()
        return json.loads(contenido)
    return []

def guardar_tareas(tareas):
    archivo= open(ARCHIVO_TAREAS, "w", encoding="utf-8")
    contenido= json.dumps(tareas, indent=4)
    archivo.write(contenido)
    archivo.close()

def mostrar_menu():
    print("\n--- Gestor de Tareas ---")
    print("1. Agregar tarea")
    print("2. Ver tareas")
    print("3. Marcar tarea como completada")
    print("4. Eliminar tarea")
    print("5. Salir")

def agregar_tarea(tareas):
    descripcion= input("Escribe la descripción de la tarea: ").strip()
    if descripcion != "":
        tarea= {"descripcion": descripcion, "completada": False}
        tareas.append(tarea)
        print("Tarea agregada.")
    else:
        print("La descripción no puede estar vacía.")

def ver_tareas(tareas):
    if len(tareas) == 0:
        print("No hay tareas.")
    else:
        print("\n--- Lista de Tareas ---")
        indice = 1
        for tarea in tareas:
            if tarea["completada"] == True:
                estado = "Completada"
            else:
                estado = "Pendiente"
            print(str(indice) + ". " + tarea["descripcion"] + " [" + estado + "]")
            indice += 1

def marcar_completada(tareas):
    ver_tareas(tareas)
    if len(tareas) > 0:
        entrada= input("Número de tarea a marcar como completada: ")
        if entrada.isdigit():
            indice= int(entrada)
            if indice >= 1 and indice <= len(tareas):
                tareas[indice - 1]["completada"] = True
                print("Tarea marcada como completada.")
            else:
                print("Número de tarea inválido.")
        else:
            print("Debes ingresar un número.")

def eliminar_tarea(tareas):
    ver_tareas(tareas)
    if len(tareas) > 0:
        entrada= input("Número de tarea a eliminar: ")
        if entrada.isdigit():
            indice= int(entrada)
            if indice >= 1 and indice <= len(tareas):
                tarea= tareas[indice - 1]["descripcion"]
                del tareas[indice - 1]
                print("Tarea eliminada: " + tarea)
            else:
                print("Número de tarea inválido.")
        else:
            print("Debes ingresar un número.")

# EJECUCIÓN PRINCIPAL DIRECTA
tareas = cargar_tareas()
continuar = True

while continuar:
    mostrar_menu()
    opcion = input("Elige una opción: ")

    if opcion == "1":
        agregar_tarea(tareas)
    elif opcion == "2":
        ver_tareas(tareas)
        time.sleep(5)
    elif opcion == "3":
        marcar_completada(tareas)
    elif opcion == "4":
        eliminar_tarea(tareas)
    elif opcion == "5":
        guardar_tareas(tareas)
        print("¡Hasta luego!")
        continuar = False
    else:
        print("Opción no válida.")
