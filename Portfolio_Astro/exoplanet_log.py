import json
import os

def load_catalog(filename="exoplanets.json"):
    if os.path.exists(filename):
        with open(filename, "r") as f:
            return json.load(f)
    return {}

def save_catalog(catalog, filename="exoplanets.json"):
    with open(filename, "w") as f:
        json.dump(catalog, f, indent=4)

def exoplanet_log():
    catalog = load_catalog()

    while True:
        name = input("Exoplanet name: ")
        mass = float(input("Mass in Jupiter masses: "))
        star = input("Host star: ")

        catalog[name] = {
            "mass_Mj": mass,
            "host_star": star
        }

        another = input("Add another? (y/n): ")
        if another.lower() != "y":
            break

    save_catalog(catalog)

    print("\nRegistered Exoplanets:")
    for name, data in catalog.items():
        print(f"{name}: {data['mass_Mj']} Mj, orbits {data['host_star']}")
