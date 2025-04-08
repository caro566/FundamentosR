# Instalación e importación de librerías
install.packages("readr")  # Asegúrate de instalar 'readr' si no está instalado
install.packages("dplyr")  # Asegúrate de instalar 'dplyr' si no está instalado
library(readr)  # Cargar librería readr
library(dplyr)  # Cargar librería dplyr

# Cargar los datos desde el archivo CSV
archivo <- "C:/Users/wuep/Desktop/salarios_mujeres.csv"  # Ruta del archivo
datos <- read_csv(archivo)  # Leer el archivo CSV

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

# 1. Calcular las medidas de tendencia central para la columna 'Salario'
# (asumimos que 'Salario' es una de las columnas del CSV, ajusta el nombre si es necesario)

# Media
media <- mean(datos$Salario, na.rm = TRUE)  # na.rm = TRUE para ignorar valores faltantes
print(paste("La media es:", media))

# Mediana
mediana <- median(datos$Salario, na.rm = TRUE)
print(paste("La mediana es:", mediana))

# Moda (usamos una función personalizada para calcularla)
moda <- function(x) {
  uniq_x <- unique(x)
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}

moda_valor <- moda(datos$Salario)
print(paste("La moda es:", moda_valor))

# 2. Realizar un histograma para visualizar la distribución de 'Salario'
hist(datos$Salario, 
     main = "Histograma de Salarios de Mujeres",  # Título
     xlab = "Salario",                           # Etiqueta en el eje X
     col = "skyblue",                            # Color de las barras
     border = "black",                           # Color del borde de las barras
     breaks = 10)                                # Número de intervalos
