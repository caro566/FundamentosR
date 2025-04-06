# Cargar librerías necesarias
install.packages("dplyr")  # Si no tienes dplyr instalado
install.packages("readr")  # Si no tienes readr instalado
library(dplyr)
library(readr)

# 1. Leer el archivo CSV
archivo <- "C:/Users/wuep/Desktop/salarios_mujeres.csv"  # Ruta del archivo
datos <- read_csv(archivo)  # Leer el archivo CSV

# Verificar las primeras filas del conjunto de datos
head(datos)

# 2. Calcular las medidas de tendencia central para la columna 'Salario'
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

# 3. Realizar un histograma para visualizar la distribución de 'Salario'
hist(datos$Salario, 
     main = "Histograma de Salarios de Mujeres",  # Título
     xlab = "Salario",                           # Etiqueta en el eje X
     col = "skyblue",                            # Color de las barras
     border = "black",                           # Color del borde de las barras
     breaks = 10)                                # Número de intervalos
