def orbital_table():
    print("Orbital Period Table (Assuming M_sun = 1)")
    for r in range(1, 11):
        T = r ** 1.5
        print(f"Semi-major axis: {r} AU => Orbital Period ≈ {round(T, 2)} years")

    while True:
        cont = input("Do you want to enter another value? (y/n): ").lower()
        if cont != 'y':
            break
