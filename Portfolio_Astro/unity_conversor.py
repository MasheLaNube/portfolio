def convert_units():
    print("Astronomical Unit Converter")
    print("1. Parsec to Light Years")
    print("2. Astronomical Units to Kilometers")
    print("3. Kilometers to Solar Radii")
    option= input("Choose an option: ")

    if option == "1":
        parsecs= float(input("Enter the number of parsecs: "))
        print(f"{parsecs} pc = {parsecs * 3.26156} light years")

    elif option == "2":
        au= float(input("Enter the number of astronomical units: "))
        print(f"{au} AU = {au * 149597870.7} km")

    elif option == "3":
        km= float(input("Enter the number of kilometers: "))
        print(f"{km} km = {km / 695700} solar radii")

    else:
        print("Invalid option.")

