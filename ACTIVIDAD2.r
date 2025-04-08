# Instalación e importación de librerías
install.packages("readr")  # Asegúrate de instalar 'readr' si no está instalado
library(readr)  # Cargar librería readr

# Cargar los datos desde el archivo CSV
datos <- read_csv("C:\Users\wuep\Desktop/salarios_mujeres.csv")

# Mostrar las primeras filas del dataset
print("Primeras 6 filas del dataset:")
head(datos)

# Verificar la estructura del dataset
print("Estructura del dataset:")
str(datos)

# Resumen estadístico del dataset
print("Resumen estadístico del dataset:")
summary(datos)

# Número de valores NA por columna
print("Número de valores NA por columna:")
colSums(is.na(datos))

# Identificar registros duplicados
print("Registros duplicados:")
sum(duplicated(datos))  # Cuenta cuántos registros duplicados existen

# Filtrado por edad mayor a 40 años
print("Filtrado por edad mayor a 40 años:")
datos_mayores_40 <- datos[datos$Edad > 40, ]  # Filtra solo las filas con Edad > 40

# Filtrado por salario mayor a 10,000
print("Filtrado por salario mayor a 10,000:")
datos_salario_mayor_10000 <- datos[datos$Salario > 10000, ]  # Filtra solo las filas con Salario > 10,000

# Si deseas ver los resultados filtrados
print("Primeros 6 registros de los mayores de 40 años:")
head(datos_mayores_40)

print("Primeros 6 registros de salario mayor a 10,000:")
head(datos_salario_mayor_10000)