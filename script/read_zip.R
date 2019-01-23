library(tidyverse)
library(here) # este paquete ayuda con las direcciones de las carpetas

## esta parte descomprime los archivos en .zip 
files <- dir(pattern = "*.zip")
files



data <- files %>%
  map(unzip)       # 
data
##
## lo siguiente seria recuperar los archivos que necesitas

files2 <- dir(pattern =  "*.csv")## por ejemplo los archivos .csv

files2
data2 <- files2 %>% 
  map(read_csv)# en este punto puedes cambiar la funcion que
## necesitas utilizar. Cambiar "read_csv" por la funcion que 
## sea necesaria.  El resultado de esta linea es una lsita 
## con todos los archivos que se leen

## Lo siguiente es asignarle el nombre correspondiente a cada
## uno de los elementos que estamos leyendo 
names(data2) <- files2


data2

## A partir de este punto lo siguiente seria hacer subseting 
## para recuperar elementos especificos

data2$states.csv
