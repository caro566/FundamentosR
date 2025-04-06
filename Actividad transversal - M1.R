# -------------------------------------------------
# CARGA Y REVISIÓN DE UN DATASET EN R (CSV)
# -------------------------------------------------

# 1 CARGAR LIBRERÍAS NECESARIAS ----
print("1. Instalando y cargando librerías necesarias...")
# Instalar solo si no están instaladas
if (!require(readr)) install.packages("readr", dependencies = TRUE)
if (!require(dplyr)) install.packages("dplyr", dependencies = TRUE)

# Cargar paquetes
library(readr)  # Para leer archivos CSV
library(dplyr)  # Para manipulación de datos

# 2º CARGAR DATOS DESDE UN ARCHIVO CSV ----
print("2. Cargando el dataset desde un archivo CSV...")

# Especifica la ruta del archivo CSV (asegúrate de cambiar el nombre del archivo por el correcto)
archivo_csv <- "C:/Users/wuep/Desktop/Descargar datos de ejemplo.csv"  # Ruta completa del archivo

# Cargar datos en un data frame
datos <- read_csv(archivo_csv)

# 3º REVISAR EL DATASET ----
print("3. Explorando el dataset cargado...")

# Ver las primeras filas
print("Primeras 6 filas del dataset:")
head(datos)  # Muestra las primeras filas

# Información general del dataset
print("Información general del dataset:")
str(datos)  # Estructura de los datos

# Dimensiones del dataset (filas y columnas)
print("Dimensiones del dataset (filas x columnas):")
dim(datos)

# Nombres de las columnas
print("Nombres de las columnas:")
names(datos)

# Resumen estadístico del dataset
print("Resumen estadístico de las variables numéricas:")
summary(datos)

# 4º IDENTIFICAR VALORES FALTANTES (NA) ----
print("4. Identificando valores faltantes...")

# Ver cuántos valores faltantes hay por columna
print("Número de valores NA por columna:")
colSums(is.na(datos))

# Mostrar las filas con valores faltantes
print("Filas con valores NA:")
datos[!complete.cases(datos), ]

# 5º VISUALIZACIÓN BÁSICA DE UNA VARIABLE ----
print("5. Creando una visualización básica...")

# Verificar si hay variables numéricas
variables_numericas <- names(datos)[sapply(datos, is.numeric)]
if (length(variables_numericas) > 0) {
  print(paste("???? Se genera un histograma de la variable:", variables_numericas[1]))
  hist(datos[[variables_numericas[1]]], main = paste("Histograma de", variables_numericas[1]), col = "skyblue", border = "black")
} else {
  print("No hay variables numéricas en el dataset para graficar.")
}

# 6º FINAL ----
print("Análisis básico completado!")

