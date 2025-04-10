# -------------------------------------------------
# CARGA Y REVISI�N DE UN DATASET EN R (CSV)
# -------------------------------------------------

# 1 CARGAR LIBRER�AS NECESARIAS ----
print("1. Instalando y cargando librer�as necesarias...")
# Instalar solo si no est�n instaladas
if (!require(readr)) install.packages("readr", dependencies = TRUE)
if (!require(dplyr)) install.packages("dplyr", dependencies = TRUE)

# Cargar paquetes
library(readr)  # Para leer archivos CSV
library(dplyr)  # Para manipulaci�n de datos

# 2� CARGAR DATOS DESDE UN ARCHIVO CSV ----
print("2. Cargando el dataset desde un archivo CSV...")

# Especifica la ruta del archivo CSV (aseg�rate de cambiar el nombre del archivo por el correcto)
archivo_csv <- "C:/Users/wuep/Desktop/Descargar datos de ejemplo.csv"  # Ruta completa del archivo

# Cargar datos en un data frame
datos <- read_csv(archivo_csv)

# 3� REVISAR EL DATASET ----
print("3. Explorando el dataset cargado...")

# Ver las primeras filas
print("Primeras 6 filas del dataset:")
head(datos)  # Muestra las primeras filas

# Informaci�n general del dataset
print("Informaci�n general del dataset:")
str(datos)  # Estructura de los datos

# Dimensiones del dataset (filas y columnas)
print("Dimensiones del dataset (filas x columnas):")
dim(datos)

# Nombres de las columnas
print("Nombres de las columnas:")
names(datos)

# Resumen estad�stico del dataset
print("Resumen estad�stico de las variables num�ricas:")
summary(datos)

# 4� IDENTIFICAR VALORES FALTANTES (NA) ----
print("4. Identificando valores faltantes...")

# Ver cu�ntos valores faltantes hay por columna
print("N�mero de valores NA por columna:")
colSums(is.na(datos))

# Mostrar las filas con valores faltantes
print("Filas con valores NA:")
datos[!complete.cases(datos), ]

# 5� VISUALIZACI�N B�SICA DE UNA VARIABLE ----
print("5. Creando una visualizaci�n b�sica...")

# Verificar si hay variables num�ricas
variables_numericas <- names(datos)[sapply(datos, is.numeric)]
if (length(variables_numericas) > 0) {
  print(paste("???? Se genera un histograma de la variable:", variables_numericas[1]))
  hist(datos[[variables_numericas[1]]], main = paste("Histograma de", variables_numericas[1]), col = "skyblue", border = "black")
} else {
  print("No hay variables num�ricas en el dataset para graficar.")
}

# 6� FINAL ----
print("An�lisis b�sico completado!")

