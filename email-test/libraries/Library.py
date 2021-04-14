from robot.api import logger
import json


class Library:
    """Give this library a proper name and document it."""

    def example_python_keyword(self):
        logger.info("This is Python!")
    
    def tipo_var(self, var):
        a = type(var)
        print('Var es del tipo', a)
        
    def agregar_cero(self, var):
        aux = var[5]
        aux2 = var[6]
        if aux2 == " ":
            var = var[0:5] + '0' + aux + ' ' + var[7:]
            print(var)
        else:
            print('La fecha esta correcta')
        return var
    
    def comparar_fecha(self, var, var2):
        if var[:16] == var2[:16]:
            aux = True
        else:
            aux = False
        return aux
    
    def limpiar_json(self, var):
        print('El tipo0 es: ', type(var))
        aux = var[2:-1]
        print('El tipo1 es: ', type(aux))
        a = '"{\r\n"Ordenes": {\r\n "clave": "123456789",\r\n "accion": "borrartodo"\r\n }\r\n}"'
        aux2 = a[1:-1]
        if aux2 == aux:
            print('Son iguales')
        else:
            print('Son distintos')
        print('aux es: ', aux)
        print('aux2 es: ', aux2)
        c = aux.find('\r')
        c2 = aux2.find('\r')
        a = aux.replace('\r\n', '')
        a2 = aux2.replace('\r\n', '')
        print(c)
        print(c2)
        print('a es: ', a)
        print('a2 es: ', a2)
        return aux
    
    def comparar_accion(self, var, var2):
        print('var es: ', var)
        print('var2 es: ', var2)
        if (var == var2):
            print('Es igual')
            return True
        else:
            print('No es igual')
            return False
