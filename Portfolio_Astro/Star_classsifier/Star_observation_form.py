def record_star():
    print("Star Observation Form")
    name = input("Star name: ")
    magnitude = float(input("Apparent magnitude: "))
    distance = float(input("Distance in light years: "))
    is_binary = input("Is it a binary system? (yes/no): ").lower() == "yes"

    print("\nObservation Summary:")
    print(f"Name: {name}")
    print(f"Apparent Magnitude: {magnitude}")
    print(f"Distance: {distance} light years")
    print(f"Binary System: {'Yes' if is_binary else 'No'}")