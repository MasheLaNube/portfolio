import math

def circular_area(diameter):
    return math.pi * (diameter / 2) ** 2

def annular_area(outer_d, inner_d):
    return math.pi * ((outer_d / 2) ** 2 - (inner_d / 2) ** 2)

def telescope_area_calculator():
    print("1. Reflecting telescope (full mirror)")
    print("2. Telescope with central obstruction")

    option = input("Choose an option: ")

    if option == "1":
        d = float(input("Mirror diameter (m): "))
        print(f"Mirror area: {round(circular_area(d), 3)} m²")

    elif option == "2":
        d_ext = float(input("Outer diameter (m): "))
        d_int = float(input("Inner diameter (m): "))
        print(f"Effective area: {round(annular_area(d_ext, d_int), 3)} m²")
