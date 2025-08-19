class Astrounit:
    def __init__(self):
        pass

    def pc_to_ly(self, parsecs: float):
        """Convierte parsecs a años luz"""
        return parsecs * 3.26156

    def au_to_km(self, au: float):
        """Convierte unidades astronómicas a kilómetros"""
        return au * 149597870.7

    def km_to_solar_radii(self, km: float):
        """Convierte kilómetros a radios solares"""
        return km / 695700

