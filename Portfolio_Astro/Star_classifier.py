def classify_star():
    temp = float(input("Enter the star's temperature (in Kelvin): "))

    if temp > 30000:
        print("Spectral Type: O")
    elif temp > 10000:
        print("Spectral Type: B")
    elif temp > 7500:
        print("Spectral Type: A")
    elif temp > 6000:
        print("Spectral Type: F")
    elif temp > 5200:
        print("Spectral Type: G")
    elif temp > 3700:
        print("Spectral Type: K")
    else:
        print("Spectral Type: M")
